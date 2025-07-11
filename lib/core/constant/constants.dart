import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:rinavent/core/utils/image_constant.dart';

class Constant {
  static closeApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    });
  }

  static backToPrev(BuildContext context) {
    Navigator.pop(context);
  }

  static sendToNextScreen(BuildContext context, String routes,
      {var arguments}) {
    if (arguments != null) {
      // Get.toNamed(routes, arguments: arguments);
    } else {
      // Get.toNamed(routes);
    }
  }
}

AppBar getInVisibleAppBar(
    {Color color = Colors.transparent,
    Brightness? statusBarBrightness,
    Brightness? statusBarIconBrightness}) {
  return AppBar(
    toolbarHeight: 0,
    elevation: 0,
    backgroundColor: color,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: statusBarIconBrightness,
      statusBarBrightness: statusBarBrightness,
    ),
  );
}

// Widget animationFunction(
//   index,
//   child, {
//   Duration? listAnimation,
//   Duration? slideDuration,
//   Duration? slideDelay,
// }) {
//   return AnimationConfiguration.staggeredList(
//     position: index,
//     duration: listAnimation ?? const Duration(milliseconds: 800),
//     child: SlideAnimation(
//       duration: slideDuration ?? const Duration(milliseconds: 500),
//       delay: slideDelay ?? const Duration(milliseconds: 50),
//       child: FadeInAnimation(
//         child: child,
//       ),
//     ),
//   );
// }


final NumberFormat formatter = NumberFormat("#,##0.00", "fr_FR");

String formatNumber(num value) {
  return formatter.format(value).replaceAll(',', '.'); // Remplace la virgule par un point
}



List<Country> phoneCountry = [
  const Country(
    name: "Cameroon",
    nameTranslations: {
      "sk": "Kamerun",
      "se": "Kamerun",
      "pl": "Kamerun",
      "no": "Kamerun",
      "ja": "カメルーン",
      "it": "Camerun",
      "zh": "喀麦隆",
      "nl": "Kameroen",
      "de": "Kamerun",
      "fr": "Cameroun",
      "es": "Camerún",
      "en": "Cameroon",
      "pt_BR": "Camarões",
      "sr-Cyrl": "Камерун",
      "sr-Latn": "Kamerun",
      "zh_TW": "喀麥隆",
      "tr": "Kamerun",
      "ro": "Camerun",
      "ar": "الكاميرون",
      "fa": "کامرون",
      "yue": "喀 麥 隆"
    },
    flag: "🇨🇲",
    code: "CM",
    dialCode: "237",
    minLength: 9,
    maxLength: 9,
  ),

];
    
List<Country> phoneCountries = [
  const Country(
    name: "Senegal",
    nameTranslations: {
      "sk": "Senegal",
      "se": "Senegal",
      "pl": "Senegal",
      "no": "Senegal",
      "ja": "セネガル",
      "it": "Senegal",
      "zh": "塞内加尔",
      "nl": "Senegal",
      "de": "Senegal",
      "fr": "Sénégal",
      "es": "Senegal",
      "en": "Senegal",
      "pt_BR": "Senegal",
      "sr-Cyrl": "Сенегал",
      "sr-Latn": "Senegal",
      "zh_TW": "塞內加爾",
      "tr": "Senegal",
      "ro": "Senegal",
      "ar": "السنغال",
      "fa": "سنگال",
      "yue": "塞內加爾"
    },
    flag: "🇸🇳",
    code: "SN",
    dialCode: "221",
    minLength: 9,
    maxLength: 9,
  ),
  const Country(
    name: "Comoros",
    nameTranslations: {
      "sk": "Komory",
      "se": "Komoros",
      "pl": "Komory",
      "no": "Komorene",
      "ja": "コモロ",
      "it": "Comore",
      "zh": "科摩罗",
      "nl": "Comoren",
      "de": "Komoren",
      "fr": "Comores",
      "es": "Comoras",
      "en": "Comoros",
      "pt_BR": "Comores",
      "sr-Cyrl": "Комори",
      "sr-Latn": "Komori",
      "zh_TW": "科摩羅",
      "tr": "Komor Adaları",
      "ro": "Comore",
      "ar": "جزر القمر",
      "fa": "جزیره کومور",
      "yue": "科摩羅"
    },
    flag: "🇰🇲",
    code: "KM",
    dialCode: "269",
    minLength: 7,
    maxLength: 7,
  ),
  const Country(
    name: "Cameroon",
    nameTranslations: {
      "sk": "Kamerun",
      "se": "Kamerun",
      "pl": "Kamerun",
      "no": "Kamerun",
      "ja": "カメルーン",
      "it": "Camerun",
      "zh": "喀麦隆",
      "nl": "Kameroen",
      "de": "Kamerun",
      "fr": "Cameroun",
      "es": "Camerún",
      "en": "Cameroon",
      "pt_BR": "Camarões",
      "sr-Cyrl": "Камерун",
      "sr-Latn": "Kamerun",
      "zh_TW": "喀麥隆",
      "tr": "Kamerun",
      "ro": "Camerun",
      "ar": "الكاميرون",
      "fa": "کامرون",
      "yue": "喀 麥 隆"
    },
    flag: "🇨🇲",
    code: "CM",
    dialCode: "237",
    minLength: 9,
    maxLength: 9,
  ),
  const Country(
    name: "United States",
    nameTranslations: {
      "sk": "Spojené štáty",
      "se": "Amerihká ovttastuvvan stáhtat",
      "pl": "Stany Zjednoczone",
      "no": "USA",
      "ja": "アメリカ合衆国",
      "it": "Stati Uniti",
      "zh": "美国",
      "nl": "Verenigde Staten",
      "de": "Vereinigte Staaten",
      "fr": "États-Unis",
      "es": "Estados Unidos",
      "en": "United States",
      "pt_BR": "Estados Unidos",
      "sr-Cyrl": "Сједињене Америчке Државе",
      "sr-Latn": "Sjedinjene Američke Države",
      "zh_TW": "美國",
      "tr": "Amerika Birleşik Devletleri",
      "ro": "Statele Unite ale Americii",
      "ar": "الولايات المتحدة",
      "fa": "ایالات متحده آمریکا",
      "yue": "美利堅郃眾囯"
    },
    flag: "🇺🇸",
    code: "US",
    dialCode: "1",
    minLength: 10,
    maxLength: 10,
  ),
const Country(
    name: "Canada",
    nameTranslations: {
      "sk": "Kanada",
      "se": "Kanáda",
      "pl": "Kanada",
      "no": "Canada",
      "ja": "カナダ",
      "it": "Canada",
      "zh": "加拿大",
      "nl": "Canada",
      "de": "Kanada",
      "fr": "Canada",
      "es": "Canadá",
      "en": "Canada",
      "pt_BR": "Canadá",
      "sr-Cyrl": "Канада",
      "sr-Latn": "Kanada",
      "zh_TW": "加拿大",
      "tr": "Kanada",
      "ro": "Canada",
      "ar": "كندا",
      "fa": "کانادا",
      "yue": "加拿大"
    },
    flag: "🇨🇦",
    code: "CA",
    dialCode: "1",
    minLength: 10,
    maxLength: 10,
  ),
];



    String getGatewayLogo(String title) {
  if (title == "paypal") return "${ImageConstant.imagePath}/paypal.png";
  if (title == "stripe") return "${ImageConstant.imagePath}/stripe.png";
  if (title == "orange") return "${ImageConstant.imagePath}/om.png";
  if (title == "bank") return "${ImageConstant.imagePath}/bank.png";
  if (title == "wave") return "${ImageConstant.imagePath}/wave.png";
  if (title == "cash") return "${ImageConstant.imagePath}/cash.png";
 
  return  "${ImageConstant.imagePath}/om.png";
}