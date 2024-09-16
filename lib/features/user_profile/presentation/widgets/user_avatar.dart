import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rinavent/core/contants/padding.dart';
import 'package:rinavent/core/theme/app_palette.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    this.image,
  });

  final File? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        image != null
            ? SizedBox(
                height: 125,
                width: 125,
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(150)),
                    child: Image.file(
                      image!,
                      fit: BoxFit.cover,
                    )),
              )
            : const CircleAvatar(
                radius: AppPadding.spacer + 10,
                backgroundColor: AppPalette.borderColor,
                child:  Icon(
                  Icons.person_2_rounded,
                  color: AppPalette.greyColor,
                  size: 60,
                ),
              ),
        Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: AppPalette.gradient1,
                border: Border.all(color: AppPalette.backgroundColor, width: 3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Padding(
                padding: EdgeInsets.all(5),
                child: Icon(
                  size: 18,
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ))
      ],
    );
  }
}
