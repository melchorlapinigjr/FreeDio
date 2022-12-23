import 'package:flutter/material.dart';
import 'package:free_radio_philippines/ui/widgets/my_gridview/my_gridview_model.dart';
import 'package:free_radio_philippines/ui/widgets/my_widgets.dart';
import 'package:stacked/stacked.dart';

class MyGridView extends StatelessWidget {
  final Map<String, dynamic> stations;
  final bool? isRecentStations;

  const MyGridView(
      {Key? key, required this.stations, this.isRecentStations = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MyGridViewModel>.nonReactive(
        viewModelBuilder: () => MyGridViewModel(allStations: stations),
        onModelReady: (model) => model.init(isRecentStations!),
        builder: (context, model, widget) {
          return GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
          );
        });
  }
}
