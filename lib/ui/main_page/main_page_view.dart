import 'package:flutter/material.dart';
import 'package:free_radio_philippines/core/models/station_object.dart';
import 'package:free_radio_philippines/resources/colors.dart';
import 'package:free_radio_philippines/ui/main_page/main_page_view_model.dart';
import 'package:free_radio_philippines/ui/widgets/my_widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MainPageView extends StatelessWidget {
  const MainPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainPageViewModel>.reactive(
        viewModelBuilder: () => MainPageViewModel(),
        onModelReady: (model) => model.init(),
        builder: (context, model, widget) {
          return Scaffold(
              backgroundColor: MyColors.background,
              appBar: MyAppBarView(),
              body: model.isBusy
                  ? const MyCircularProgressIndicator()
                  : GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              mainAxisExtent: 120,
                              childAspectRatio: 1),
                      padding: const EdgeInsets.all(10),
                      children: [
                        ...model.stations
                            .map((e) => MyStationCardItemView(
                                  stationObject: e,
                                  onTap: () => model.onStationPressed(e),
                                ))
                            .toList(),
                      ],
                    ));
        });
  }
}
