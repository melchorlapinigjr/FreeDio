import 'package:flutter/material.dart';
import 'package:free_radio_philippines/app/app_themes.dart';
import 'package:free_radio_philippines/resources/colors.dart';
import 'package:free_radio_philippines/ui/main_page/main_page_view_model.dart';
import 'package:free_radio_philippines/ui/main_page/mydrawer_view.dart';
import 'package:free_radio_philippines/ui/main_page/tabs/radio_stations_tab.dart';
import 'package:free_radio_philippines/ui/widgets/my_gridview/my_gridview.dart';
import 'package:free_radio_philippines/ui/widgets/my_widgets.dart';
import 'package:stacked/stacked.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainPageViewModel>.reactive(
        viewModelBuilder: () => MainPageViewModel(),
        onViewModelReady: (model) => model.init(this),
        builder: (context, model, widget) {
          return Scaffold(
              key: model.scaffoldKey,
              backgroundColor: MyColors.background,
              drawer: const MyDrawerView(),
              body: model.isBusy
                  ? const MyCircularProgressIndicator()
                  : Stack(
                alignment: Alignment.centerLeft,
                      children: [
                        LayoutBuilder(builder: (context, constraints) {
                          return Column(children: [
                            const SizedBox(
                              height: 48,
                            ),
                            Text('FreeDio Philippines',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium
                                    ?.copyWith(
                                        color: Colors.grey.shade50,
                                        fontSize: constraints.maxWidth > 720
                                            ? 36
                                            : 28),

                            textAlign: TextAlign.left,),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 74),
                              child: Text(
                                'Listen for free on all Philippines AM & FM radio stations',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                        color: Colors.white,
                                        fontSize: constraints.maxWidth > 720
                                            ? 24
                                            : 14),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextFormField(
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        constraints.maxWidth > 720 ? 24 : 16),
                                onChanged: model.onSearchTextChanged,
                                decoration: InputDecoration(
                                    prefixIcon: model.showSearchLoading
                                        ? const CircularProgressIndicator()
                                        : null,
                                    labelText: 'Search station...',
                                    focusColor: Colors.white,
                                    labelStyle: const TextStyle(
                                        color: MyColors.lighterGrey),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: MyColors.lightBlue),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          width: 1, color: Colors.deepOrange),
                                      borderRadius: BorderRadius.circular(15),
                                    )),
                              ),
                            ),
                            TabBar(
                              indicatorSize: TabBarIndicatorSize.tab,
                              controller: model.tabController,
                              isScrollable: true,
                              indicatorWeight: 2,
                              labelPadding: EdgeInsets.symmetric(
                                  horizontal:
                                      AppThemes.getMediaQuery().size.width /
                                          10),
                              onTap: model.setCurrentTabIndex,
                              tabs: [
                                Tab(
                                    child: tabItemText(
                                        'Radio Stations',
                                        model.currentIndex == 0,
                                        constraints.maxWidth > 720 ? 24 : 14)),
                                Tab(
                                    child: tabItemText(
                                        'Recents',
                                        model.currentIndex == 1,
                                        constraints.maxWidth > 720 ? 24 : 14)),
                                Tab(
                                    child: tabItemText(
                                        'Favorites',
                                        model.currentIndex == 2,
                                        constraints.maxWidth > 720 ? 24 : 14)),
                              ],
                            ),
                            Expanded(
                                child: TabBarView(
                                    controller: model.tabController,
                                    children: [
                                  const RadioStationsTab(),
                                  MyGridView(stations: model.mapOfStations),
                                  MyGridView(
                                      stations: model.mapOfStations,
                                      isRecentStations: false),
                                ]))
                          ]);
                        }),
                        Positioned(
                            top: 40,
                            left: 8,
                            child: IconButton(
                                onPressed: model.openMyDrawer,
                                icon: const Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: 36,
                                ))),
                      ],
                    ));
        });
  }

  Text tabItemText(String text, bool isSelected, double size) => Text(
        text,
        style: AppThemes.getTextTheme().bodyMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.yellow : MyColors.white,
            fontSize: size),
      );
}

class Delegate extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;
  final String _title;

  Delegate(this.backgroundColor, this._title);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text(
          _title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 25,
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 80;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}

class BatteryOptimisationDialog extends StatelessWidget {
  final VoidCallback onDisablePressed;

  const BatteryOptimisationDialog({Key? key, required this.onDisablePressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Battery Optimization',
            style: Theme.of(context).textTheme.headlineLarge,   textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'This app requires you to disable battery optimization for FreeDio PH so that radio can play longer behind or in the background.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: onDisablePressed,
                child: const Text('Disable'),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          )
        ],
      ),
    );
  }
}
