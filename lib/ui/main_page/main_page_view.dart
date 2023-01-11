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
        onModelReady: (model) => model.init(this),
        builder: (context, model, widget) {
          return Scaffold(
              key: model.scaffoldKey,
              backgroundColor: MyColors.background,
              drawer: const MyDrawerView(),
              body: model.isBusy
                  ? const MyCircularProgressIndicator()
                  : Stack(
                      children: [
                        Column(children: [
                          const SizedBox(
                            height: 48,
                          ),
                          Text('FreeDio Philippines',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(color: Colors.grey.shade50)),
                          Text(
                            'Stream for free on all PH AM/FM radio stations',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: TextFormField(
                              style: const TextStyle(color: Colors.white),
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
                                    AppThemes.getMediaQuery().size.width / 10),
                            onTap: model.setCurrentTabIndex,
                            tabs: [
                              Tab(
                                  child: tabItemText('Radio Stations',
                                      model.currentIndex == 0)),
                              Tab(
                                  child: tabItemText(
                                      'Recents', model.currentIndex == 1)),
                              Tab(
                                  child: tabItemText(
                                      'Favorites', model.currentIndex == 2)),
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
                        ]),
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

  Text tabItemText(String text, bool isSelected) => Text(
        text,
        style: AppThemes.getTextTheme().bodyText2?.copyWith(
            fontWeight: FontWeight.w500,
            color: isSelected ? MyColors.lightRed : MyColors.white),
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
