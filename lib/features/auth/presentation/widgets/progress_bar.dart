import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rinavent/core/contants/padding.dart';
import 'package:rinavent/core/theme/app_palette.dart';

class ProgressBar extends StatelessWidget {
  const ProgressBar(
      {super.key, required this.totalNumber, required this.currentNumber});
  final int totalNumber;
  final int currentNumber;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var barSize = size.width * .6;

    return Row(
      children: [
        Stack(
          alignment: Alignment.centerLeft,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: barSize,
              height: 10,
              decoration: BoxDecoration(
                color: AppPalette.borderColor,
                borderRadius: BorderRadius.circular(100.0),
              ),
            ),
            Container(
              width: barSize * (currentNumber / totalNumber),
              height: 10,
              decoration: BoxDecoration(
                color: AppPalette.gradient1,
                borderRadius: BorderRadius.circular(100.0),
                boxShadow: [
                  BoxShadow(
                    color: AppPalette.gradient1.withOpacity(0.5),
                    blurRadius: 6.0,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: AppPadding.miniSpacer,
        ),
        Text(
          '$currentNumber/$totalNumber',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppPalette.gradient1),
        )
      ],
    );
  }
}
