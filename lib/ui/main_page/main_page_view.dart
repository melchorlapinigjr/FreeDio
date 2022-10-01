import 'package:flutter/material.dart';
import 'package:free_radio_philippines/app/app_themes.dart';
import 'package:free_radio_philippines/resources/colors.dart';
import 'package:free_radio_philippines/ui/main_page/main_page_view_model.dart';
import 'package:free_radio_philippines/ui/main_page/tabs/radio_stations_tab.dart';
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
              backgroundColor: MyColors.background,
              body: model.isBusy
                  ? const MyCircularProgressIndicator()
                  : Column(children: [
                      const SizedBox(
                        height: 64,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'Search station...',
                              labelStyle:
                                  const TextStyle(color: MyColors.lighterGrey),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: MyColors.lightBlue),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1, color: Colors.red),
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
                              child: tabItemText(
                                  'Radio Stations', model.currentIndex == 0)),
                          Tab(
                              child: tabItemText(
                                  'Recents', model.currentIndex == 1)),
                          Tab(
                              child: tabItemText(
                                  'Favorites', model.currentIndex == 2)),
                          Tab(
                              child: tabItemText(
                                  'Top Stations', model.currentIndex == 3)),
                        ],
                      ),
                      Expanded(
                          child: TabBarView(
                              controller: model.tabController,
                              children: const [
                            RadioStationsTab(),
                            Text('Recent'),
                            Text('Favorites'),
                            Text('Top stations'),
                          ]))
                    ]));
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
          style: TextStyle(
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
