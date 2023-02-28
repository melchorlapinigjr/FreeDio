import 'package:flutter/material.dart';
import 'package:free_radio_philippines/ui/main_page/main_page_view_model.dart';
import 'package:free_radio_philippines/ui/widgets/my_widgets.dart';
import 'package:stacked/stacked.dart';

class RadioStationsTab extends ViewModelWidget<MainPageViewModel> {
  const RadioStationsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, MainPageViewModel viewModel) {
    return LayoutBuilder(builder: (context, constraints) {
      return GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: constraints.maxWidth >= 720 ? 5 : 3,
            crossAxisSpacing: constraints.maxWidth >= 720 ? 10 : 5,
            mainAxisSpacing: constraints.maxWidth >= 720 ? 10 : 5,
            mainAxisExtent: 120,
            childAspectRatio: 1),
        padding: const EdgeInsets.all(10),
        children: [
          ...viewModel.stations
              .map((e) => MyStationCardItemView(
                    stationObject: e,
                    onTap: () => viewModel.onStationPressed(e),
                  ))
              .toList(),
        ],
      );
    });
  }
}
