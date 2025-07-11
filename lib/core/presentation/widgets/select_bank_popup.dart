// // ignore_for_file: must_be_immutable

// import 'package:rinavent/core/domain/entities/card_type.dart';
// import 'package:rinavent/core/l10n/app_localizations.dart';
// import 'package:rinavent/core/presentation/widgets/custom_elevated_button.dart';
// import 'package:rinavent/core/presentation/widgets/custom_icon_button.dart';
// import 'package:rinavent/core/presentation/widgets/custom_image_view.dart';
// import 'package:rinavent/core/theme/app_decoration.dart';
// import 'package:rinavent/core/theme/custom_text_style.dart';
// import 'package:rinavent/core/theme/theme_helper.dart';
// import 'package:rinavent/core/utils/image_constant.dart';
// import 'package:rinavent/core/utils/size_utils.dart';

// import 'package:flutter/material.dart';


// class SelectBankPopupTwoScreen extends StatefulWidget {
//   const SelectBankPopupTwoScreen({super.key});

//   @override
//   State<SelectBankPopupTwoScreen> createState() =>
//       _SelectBankPopupTwoScreenState();
// }

// class _SelectBankPopupTwoScreenState extends State<SelectBankPopupTwoScreen> {

//   int selectIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: SizeUtils.width,
//       // height: 470.v,
//       decoration: BoxDecoration(
//         color: appTheme.whiteA700,
//         borderRadius: BorderRadiusStyle.customBorderTL12,
//       ),
//       child: _buildPopup(context),
//     );
//   }

//   /// Section Widget
//   Widget _buildPopup(BuildContext context) {
//     var appLocalization = AppLocalizations.of(context);

//     return Column(mainAxisSize: MainAxisSize.min, children: [
//       SizedBox(height: 24.v),
//       Align(
//           alignment: Alignment.centerLeft,
//           child: Padding(
//               padding: EdgeInsets.only(left: 20.h),
//               child: Text(appLocalization!.lbl_select_bank,
//                   style: CustomTextStyles.titleLargeBlack900))),
//       SizedBox(height: 17.v),
//       Padding(
//         padding: EdgeInsets.symmetric(horizontal: 20.h),
//         child: ListView.separated(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           separatorBuilder: (context, index) {
//             return SizedBox(height: 16.v);
//           },
//           itemCount: cardTypeList.length,
//           itemBuilder: (context, index) {
//             CardType model = cardTypeList[index];

//             return GestureDetector(
//               onTap: () {
//                 setState(() {
//                   selectIndex = index;
//                 });
//                 // controller.update();
//               },
//               child: Container(
//                 padding: EdgeInsets.all(8.h),
//                 decoration: AppDecoration.outlineBlack.copyWith(
//                   borderRadius: BorderRadiusStyle.roundedBorder12,
//                 ),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SizedBox(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         children: [
//                           CustomIconButton(
//                             height: 55.adaptSize,
//                             width: 55.adaptSize,
//                             padding: EdgeInsets.all(7.h),
//                             decoration: IconButtonStyleHelper.fillGrayTL12,
//                             child: CustomImageView(
//                               imagePath: model.image,
//                             ),
//                           ),
//                           Padding(
//                             padding: EdgeInsets.only(
//                                 top: 6.v, bottom: 6.v, left: 12.h),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   model.number,
//                                   style: theme.textTheme.bodyLarge,
//                                 ),
//                                 SizedBox(height: 3.v),
//                                 Text(
//                                   model.price,
//                                   style: theme.textTheme.titleSmall,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     CustomImageView(
//                       imagePath: selectIndex == index
//                           ? ImageConstant.selectedRadio
//                           : ImageConstant.unSelectedRadio,
//                       height: 24.v,
//                       width: 25.h,
//                       margin: EdgeInsets.only(
//                         top: 16.v,
//                         right: 8.h,
//                         bottom: 15.v,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//       SizedBox(height: 16.v),
//       Container(
//           padding: EdgeInsets.symmetric(horizontal: 20.h, vertical: 16.v),
//           decoration: AppDecoration.fillWhiteA,
//           child: Column(children: [
//             SizedBox(height: 16.v),
//             CustomElevatedButton(
//                 text: appLocalization.lbl_continue,
//                 onPressed: () {
//                   onTapContinue();
//                 })
//           ]))
//     ]);
//   }

//   /// Navigates to the confirmOneScreen when the action is triggered.
//   onTapContinue() {
//     // Navigator.pop(context);
//   }
// }
