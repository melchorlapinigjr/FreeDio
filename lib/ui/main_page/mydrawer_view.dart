import 'package:flutter/material.dart';
import 'package:free_radio_philippines/resources/colors.dart';
import 'package:free_radio_philippines/ui/main_page/main_page_view_model.dart';
import 'package:stacked/stacked.dart';

class MyDrawerView extends ViewModelWidget<MainPageViewModel> {
  final String appName;

  const MyDrawerView({Key? key, required this.appName}) : super(key: key);

  @override
  Widget build(BuildContext context, MainPageViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: 280,
      child: ListView(
        shrinkWrap: true,
        children: [
          buildMenuItem(
              label: 'Rate Us',
              icon: const Icon(
                Icons.star,
                size: 32,
              ),
              onTap: viewModel.onRatePressed,
              context: context),
          Divider(
            height: .5,
            color: Colors.grey.shade200,
          ),
          const SizedBox(
            height: 24,
          ),
          buildTextItem(context,
              '$appName is a free internet radio station app made from Odyssy - a software company focussing in cross platform mobile development.'),
          const SizedBox(
            height: 16,
          ),
          buildTextItem(context,
              'For suggestions and feedbacks please email us at odyssy@gmail.com. Thank you!')
        ],
      ),
    );
  }

  Text buildTextItem(BuildContext context, label) {
    return Text(
      label,
      style: Theme.of(context)
          .textTheme
          .bodyText2
          ?.copyWith(color: Colors.black87, fontWeight: FontWeight.w600),
    );
  }

  Widget buildMenuItem(
      {required String label,
      required VoidCallback onTap,
      required Widget icon,
      context}) {
    return IconButton(
      onPressed: onTap,
      icon: Row(
        children: [
          icon,
          const SizedBox(
            width: 8,
          ),
          Text(
            label,
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: MyColors.darkBlue),
          )
        ],
      ),
    );
  }
}
