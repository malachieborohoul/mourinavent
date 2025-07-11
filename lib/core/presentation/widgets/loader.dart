import 'package:flutter/material.dart';
import 'package:rinavent/core/l10n/app_localizations.dart';
import 'package:rinavent/core/theme/theme_helper.dart';
import 'package:rinavent/core/utils/size_utils.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    var appLocalization = AppLocalizations.of(context);

    return  Center(
      
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          CircularProgressIndicator(color: ColorSchemes.primaryColorScheme.primary,),
              SizedBox(height: 42.v),

          Text(appLocalization!.lbl_loading,
                      style: theme.textTheme.bodyLarge)

        ],
      ),
    );
  }
}