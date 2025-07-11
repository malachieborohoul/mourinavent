import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @lbl_payway.
  ///
  /// In en, this message translates to:
  /// **'Payway'**
  String get lbl_payway;

  /// No description provided for @lbl_make_it_simple.
  ///
  /// In en, this message translates to:
  /// **'Fast, Secure, and Easy'**
  String get lbl_make_it_simple;

  /// No description provided for @msg_money_transfer_generally.
  ///
  /// In en, this message translates to:
  /// **'Transfer Money Across Borders with Confidence'**
  String get msg_money_transfer_generally;

  /// No description provided for @lbl_new_banking.
  ///
  /// In en, this message translates to:
  /// **'Simplified Money Transfers'**
  String get lbl_new_banking;

  /// No description provided for @msg_trends_in_this_report.
  ///
  /// In en, this message translates to:
  /// **'Reliable and Affordable Cross-Border Transfers'**
  String get msg_trends_in_this_report;

  /// No description provided for @lbl_get_started.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get lbl_get_started;

  /// No description provided for @lbl_zero_fees.
  ///
  /// In en, this message translates to:
  /// **'Global Financial Solutions'**
  String get lbl_zero_fees;

  /// No description provided for @msg_zero_fee_merchant.
  ///
  /// In en, this message translates to:
  /// **'Send Money with Speed and Security'**
  String get msg_zero_fee_merchant;

  /// No description provided for @msg_please_valid_your.
  ///
  /// In en, this message translates to:
  /// **'Please valid your email address'**
  String get msg_please_valid_your;

  /// No description provided for @msg_please_valid_your2.
  ///
  /// In en, this message translates to:
  /// **'Please valid your password'**
  String get msg_please_valid_your2;

  /// No description provided for @lbl_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get lbl_forgot_password;

  /// No description provided for @msg_type_your_email.
  ///
  /// In en, this message translates to:
  /// **'Type your email, we will send you verification code via email'**
  String get msg_type_your_email;

  /// No description provided for @lbl_resend_code.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get lbl_resend_code;

  /// No description provided for @lbl_verify_code.
  ///
  /// In en, this message translates to:
  /// **'Verify code'**
  String get lbl_verify_code;

  /// No description provided for @lbl_verify_now.
  ///
  /// In en, this message translates to:
  /// **'Verify now'**
  String get lbl_verify_now;

  /// No description provided for @msg_don_t_get_the_code.
  ///
  /// In en, this message translates to:
  /// **'Don’t get the code?'**
  String get msg_don_t_get_the_code;

  /// No description provided for @msg_the_confimation.
  ///
  /// In en, this message translates to:
  /// **'The confimation code was sent to the number'**
  String get msg_the_confimation;

  /// No description provided for @msg_the_confimation2.
  ///
  /// In en, this message translates to:
  /// **'The confimation code was sent via email'**
  String get msg_the_confimation2;

  /// No description provided for @lbl_reset_password.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get lbl_reset_password;

  /// No description provided for @msg_create_your_new.
  ///
  /// In en, this message translates to:
  /// **'Create your new password to Login'**
  String get msg_create_your_new;

  /// No description provided for @lbl_ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get lbl_ok;

  /// No description provided for @msg_password_changed.
  ///
  /// In en, this message translates to:
  /// **'Password changed!'**
  String get msg_password_changed;

  /// No description provided for @msg_your_password_has.
  ///
  /// In en, this message translates to:
  /// **'Your password has been changed successfully use your new password to login'**
  String get msg_your_password_has;

  /// No description provided for @lbl_deutsch.
  ///
  /// In en, this message translates to:
  /// **'Deutsch'**
  String get lbl_deutsch;

  /// No description provided for @lbl_england.
  ///
  /// In en, this message translates to:
  /// **'England'**
  String get lbl_england;

  /// No description provided for @lbl_french.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get lbl_french;

  /// No description provided for @lbl_germany.
  ///
  /// In en, this message translates to:
  /// **'Germany'**
  String get lbl_germany;

  /// No description provided for @lbl_italian.
  ///
  /// In en, this message translates to:
  /// **'Italian'**
  String get lbl_italian;

  /// No description provided for @lbl_russian.
  ///
  /// In en, this message translates to:
  /// **'Russian'**
  String get lbl_russian;

  /// No description provided for @msg_country_of_residence.
  ///
  /// In en, this message translates to:
  /// **'Country of residence'**
  String get msg_country_of_residence;

  /// No description provided for @msg_the_terms_and_services.
  ///
  /// In en, this message translates to:
  /// **'The terms and services which apply to you, will depend on your country of residence'**
  String get msg_the_terms_and_services;

  /// No description provided for @lbl_create_pin.
  ///
  /// In en, this message translates to:
  /// **'Create pin'**
  String get lbl_create_pin;

  /// No description provided for @msg_enter_a_pin_number.
  ///
  /// In en, this message translates to:
  /// **'Enter a pin number to make your wallet more secure'**
  String get msg_enter_a_pin_number;

  /// No description provided for @lbl_verify_identity.
  ///
  /// In en, this message translates to:
  /// **'Verify identity'**
  String get lbl_verify_identity;

  /// No description provided for @msg_let_s_verify_your.
  ///
  /// In en, this message translates to:
  /// **'Let’s verify your identity!'**
  String get msg_let_s_verify_your;

  /// No description provided for @msg_we_are_required.
  ///
  /// In en, this message translates to:
  /// **'We are required to verify your identity before you can use the service. Your information will be encrypted and stored securely.'**
  String get msg_we_are_required;

  /// No description provided for @lbl_change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get lbl_change;

  /// No description provided for @lbl_identity_card.
  ///
  /// In en, this message translates to:
  /// **'Identity card'**
  String get lbl_identity_card;

  /// No description provided for @lbl_issued_in_india.
  ///
  /// In en, this message translates to:
  /// **'Issued in india'**
  String get lbl_issued_in_india;

  /// No description provided for @lbl_passport.
  ///
  /// In en, this message translates to:
  /// **'Passport'**
  String get lbl_passport;

  /// No description provided for @msg_method_of_verification.
  ///
  /// In en, this message translates to:
  /// **'Method of verification'**
  String get msg_method_of_verification;

  /// No description provided for @msg_my_info_digital.
  ///
  /// In en, this message translates to:
  /// **'My info digital document'**
  String get msg_my_info_digital;

  /// No description provided for @msg_proof_of_residency.
  ///
  /// In en, this message translates to:
  /// **'Proof of residency'**
  String get msg_proof_of_residency;

  /// No description provided for @lbl_photo_id_card.
  ///
  /// In en, this message translates to:
  /// **'Photo ID Card'**
  String get lbl_photo_id_card;

  /// No description provided for @lbl_retake.
  ///
  /// In en, this message translates to:
  /// **'Retake'**
  String get lbl_retake;

  /// No description provided for @msg_please_look_at_the.
  ///
  /// In en, this message translates to:
  /// **'Please look at the camera and hold still'**
  String get msg_please_look_at_the;

  /// No description provided for @msg_selfie_with_id_card.
  ///
  /// In en, this message translates to:
  /// **'Selfie with ID card'**
  String get msg_selfie_with_id_card;

  /// No description provided for @lbl_add_new_card.
  ///
  /// In en, this message translates to:
  /// **'Add new card'**
  String get lbl_add_new_card;

  /// No description provided for @lbl_no_cards_saved.
  ///
  /// In en, this message translates to:
  /// **'No cards saved!'**
  String get lbl_no_cards_saved;

  /// No description provided for @lbl_no_transfers_available.
  ///
  /// In en, this message translates to:
  /// **'No Transfers available!'**
  String get lbl_no_transfers_available;

  /// No description provided for @msg_no_notifications.
  ///
  /// In en, this message translates to:
  /// **'No notifications yet'**
  String get msg_no_notifications;

  /// No description provided for @msg_we_did_not_found.
  ///
  /// In en, this message translates to:
  /// **'We did not found any notification ‘lets start exploring'**
  String get msg_we_did_not_found;

  /// No description provided for @lbl_10_min_ago.
  ///
  /// In en, this message translates to:
  /// **'10 Min ago'**
  String get lbl_10_min_ago;

  /// No description provided for @lbl_1_min_ago.
  ///
  /// In en, this message translates to:
  /// **'1 Min ago'**
  String get lbl_1_min_ago;

  /// No description provided for @lbl_20_min_ago.
  ///
  /// In en, this message translates to:
  /// **'20 Min ago'**
  String get lbl_20_min_ago;

  /// No description provided for @lbl_2_min_ago.
  ///
  /// In en, this message translates to:
  /// **'2 Min ago'**
  String get lbl_2_min_ago;

  /// No description provided for @lbl_30_min_ago.
  ///
  /// In en, this message translates to:
  /// **'30 Min ago'**
  String get lbl_30_min_ago;

  /// No description provided for @lbl_40_min_ago.
  ///
  /// In en, this message translates to:
  /// **'40 Min ago'**
  String get lbl_40_min_ago;

  /// No description provided for @lbl_4_min_ago.
  ///
  /// In en, this message translates to:
  /// **'4 Min ago'**
  String get lbl_4_min_ago;

  /// No description provided for @lbl_just_now.
  ///
  /// In en, this message translates to:
  /// **'Just now'**
  String get lbl_just_now;

  /// No description provided for @lbl_hour.
  ///
  /// In en, this message translates to:
  /// **'hour'**
  String get lbl_hour;

  /// No description provided for @lbl_day.
  ///
  /// In en, this message translates to:
  /// **'day'**
  String get lbl_day;

  /// No description provided for @msg_airplane_mode_is.
  ///
  /// In en, this message translates to:
  /// **'Airplane mode is on either system or lo.'**
  String get msg_airplane_mode_is;

  /// No description provided for @msg_airplane_mode_is2.
  ///
  /// In en, this message translates to:
  /// **'Airplane mode is on either system or.'**
  String get msg_airplane_mode_is2;

  /// No description provided for @msg_clicking_the_allow.
  ///
  /// In en, this message translates to:
  /// **'Clicking the allow button online is trouble.'**
  String get msg_clicking_the_allow;

  /// No description provided for @msg_detecting_if_someone.
  ///
  /// In en, this message translates to:
  /// **'Detecting if someone reading  messages.'**
  String get msg_detecting_if_someone;

  /// No description provided for @msg_dubious_websites.
  ///
  /// In en, this message translates to:
  /// **'Dubious websites functionality for bell.'**
  String get msg_dubious_websites;

  /// No description provided for @msg_how_to_disable_push.
  ///
  /// In en, this message translates to:
  /// **'How to disable push notification android.'**
  String get msg_how_to_disable_push;

  /// No description provided for @msg_in_a_laoreet_purus.
  ///
  /// In en, this message translates to:
  /// **'In a laoreet purus Integer turpis laoreet.'**
  String get msg_in_a_laoreet_purus;

  /// No description provided for @msg_the_trend_shows.
  ///
  /// In en, this message translates to:
  /// **'The trend shows that these attacks are.'**
  String get msg_the_trend_shows;

  /// No description provided for @msg_websites_ask_for.
  ///
  /// In en, this message translates to:
  /// **'Websites ask for permission upon show.'**
  String get msg_websites_ask_for;

  /// No description provided for @lbl_scan_qr_code.
  ///
  /// In en, this message translates to:
  /// **'Scan QR code'**
  String get lbl_scan_qr_code;

  /// No description provided for @lbl_copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get lbl_copy;

  /// No description provided for @lbl_facebook.
  ///
  /// In en, this message translates to:
  /// **'Facebook'**
  String get lbl_facebook;

  /// No description provided for @lbl_instagram.
  ///
  /// In en, this message translates to:
  /// **'Instagram'**
  String get lbl_instagram;

  /// No description provided for @lbl_linkedin.
  ///
  /// In en, this message translates to:
  /// **'Linkedin'**
  String get lbl_linkedin;

  /// No description provided for @lbl_share.
  ///
  /// In en, this message translates to:
  /// **'Share '**
  String get lbl_share;

  /// No description provided for @lbl_snapchat.
  ///
  /// In en, this message translates to:
  /// **'Snapchat'**
  String get lbl_snapchat;

  /// No description provided for @lbl_watsapp.
  ///
  /// In en, this message translates to:
  /// **'Watsapp'**
  String get lbl_watsapp;

  /// No description provided for @msg_https_demo_dsrr.
  ///
  /// In en, this message translates to:
  /// **'https://demo.//dsrr'**
  String get msg_https_demo_dsrr;

  /// No description provided for @lbl_topup_success.
  ///
  /// In en, this message translates to:
  /// **'Topup success'**
  String get lbl_topup_success;

  /// No description provided for @msg_has_been_added_to.
  ///
  /// In en, this message translates to:
  /// **'Has been added to your Jazopay\nCard Balance.'**
  String get msg_has_been_added_to;

  /// No description provided for @lbl_withdraw_to.
  ///
  /// In en, this message translates to:
  /// **'Withdraw to'**
  String get lbl_withdraw_to;

  /// No description provided for @msg_withdrawal_success.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal success!'**
  String get msg_withdrawal_success;

  /// No description provided for @lbl_jan_26_2021.
  ///
  /// In en, this message translates to:
  /// **'Jan 26, 2021'**
  String get lbl_jan_26_2021;

  /// No description provided for @lbl_trasnfer_date.
  ///
  /// In en, this message translates to:
  /// **'Trasnfer date'**
  String get lbl_trasnfer_date;

  /// No description provided for @lbl_02_6727_8247.
  ///
  /// In en, this message translates to:
  /// **'(02) 6727 8247'**
  String get lbl_02_6727_8247;

  /// No description provided for @lbl_03_5398_1914.
  ///
  /// In en, this message translates to:
  /// **'(03) 5398 1914'**
  String get lbl_03_5398_1914;

  /// No description provided for @lbl_03_9050_5960.
  ///
  /// In en, this message translates to:
  /// **'(03) 9050 5960'**
  String get lbl_03_9050_5960;

  /// No description provided for @lbl_all_people.
  ///
  /// In en, this message translates to:
  /// **'Recipients'**
  String get lbl_all_people;

  /// No description provided for @lbl_ameer_harb.
  ///
  /// In en, this message translates to:
  /// **'Ameer Harb'**
  String get lbl_ameer_harb;

  /// No description provided for @lbl_atif_sayyar.
  ///
  /// In en, this message translates to:
  /// **'Atif Sayyar'**
  String get lbl_atif_sayyar;

  /// No description provided for @lbl_dhakwan_ghanem.
  ///
  /// In en, this message translates to:
  /// **'Dhakwan Ghanem'**
  String get lbl_dhakwan_ghanem;

  /// No description provided for @lbl_mazin_attia.
  ///
  /// In en, this message translates to:
  /// **'Mazin Attia'**
  String get lbl_mazin_attia;

  /// No description provided for @lbl_muti_issa.
  ///
  /// In en, this message translates to:
  /// **'Muti Issa'**
  String get lbl_muti_issa;

  /// No description provided for @lbl_nashwan.
  ///
  /// In en, this message translates to:
  /// **'Nashwan'**
  String get lbl_nashwan;

  /// No description provided for @lbl_qusay_thabit.
  ///
  /// In en, this message translates to:
  /// **'Qusay Thabit'**
  String get lbl_qusay_thabit;

  /// No description provided for @lbl_sahl_touma.
  ///
  /// In en, this message translates to:
  /// **'Sahl Touma'**
  String get lbl_sahl_touma;

  /// No description provided for @lbl_sariyah_sa.
  ///
  /// In en, this message translates to:
  /// **'Sariyah Sa'**
  String get lbl_sariyah_sa;

  /// No description provided for @lbl_search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get lbl_search;

  /// No description provided for @lbl_transfer2.
  ///
  /// In en, this message translates to:
  /// **'Transfer '**
  String get lbl_transfer2;

  /// No description provided for @lbl_ubaida_bit.
  ///
  /// In en, this message translates to:
  /// **'Ubaida Bit'**
  String get lbl_ubaida_bit;

  /// No description provided for @msg_recent_transfers.
  ///
  /// In en, this message translates to:
  /// **'Recent transfers'**
  String get msg_recent_transfers;

  /// No description provided for @lbl_back_to_home.
  ///
  /// In en, this message translates to:
  /// **'Back to home'**
  String get lbl_back_to_home;

  /// No description provided for @lbl_opps.
  ///
  /// In en, this message translates to:
  /// **'Opps!'**
  String get lbl_opps;

  /// No description provided for @msg_something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Something Went Wrong!'**
  String get msg_something_went_wrong;

  /// No description provided for @lbl_transfers2.
  ///
  /// In en, this message translates to:
  /// **'Transfers'**
  String get lbl_transfers2;

  /// No description provided for @lbl_no_transfers_made.
  ///
  /// In en, this message translates to:
  /// **'No transfers have been made '**
  String get lbl_no_transfers_made;

  /// No description provided for @msg_transfers_details.
  ///
  /// In en, this message translates to:
  /// **'Transfers details'**
  String get msg_transfers_details;

  /// No description provided for @lbl_amount_to_send.
  ///
  /// In en, this message translates to:
  /// **'Amount to send'**
  String get lbl_amount_to_send;

  /// No description provided for @lbl_amount_receivable.
  ///
  /// In en, this message translates to:
  /// **'Amount receivable'**
  String get lbl_amount_receivable;

  /// No description provided for @lbl_20.
  ///
  /// In en, this message translates to:
  /// **'20%'**
  String get lbl_20;

  /// No description provided for @lbl_8.
  ///
  /// In en, this message translates to:
  /// **'8%'**
  String get lbl_8;

  /// No description provided for @msg_feb_30_2011_apr.
  ///
  /// In en, this message translates to:
  /// **'Feb 30, 2011 - Apr 16, 2030'**
  String get msg_feb_30_2011_apr;

  /// No description provided for @msg_jan_30_2012_may.
  ///
  /// In en, this message translates to:
  /// **'Jan 30, 2012 - May 20, 2040'**
  String get msg_jan_30_2012_may;

  /// No description provided for @msg_jan_5_2010_may.
  ///
  /// In en, this message translates to:
  /// **'Jan 5, 2010 - May 15, 2020'**
  String get msg_jan_5_2010_may;

  /// No description provided for @msg_sep_30_2022_mar.
  ///
  /// In en, this message translates to:
  /// **'Sep 30, 2022 - Mar 23, 2010'**
  String get msg_sep_30_2022_mar;

  /// No description provided for @lbl_current_money.
  ///
  /// In en, this message translates to:
  /// **'Outflows'**
  String get lbl_current_money;

  /// No description provided for @msg_current_deposits.
  ///
  /// In en, this message translates to:
  /// **'Entries'**
  String get msg_current_deposits;

  /// No description provided for @lbl_1300_00.
  ///
  /// In en, this message translates to:
  /// **'1300.00'**
  String get lbl_1300_00;

  /// No description provided for @lbl_250_00.
  ///
  /// In en, this message translates to:
  /// **'250.00'**
  String get lbl_250_00;

  /// No description provided for @lbl_fridge.
  ///
  /// In en, this message translates to:
  /// **'Fridge'**
  String get lbl_fridge;

  /// No description provided for @lbl_mobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get lbl_mobile;

  /// No description provided for @msg_laptop_nothing_powar.
  ///
  /// In en, this message translates to:
  /// **'Laptop nothing powar'**
  String get msg_laptop_nothing_powar;

  /// No description provided for @lbl_open_deposit.
  ///
  /// In en, this message translates to:
  /// **'Open deposit'**
  String get lbl_open_deposit;

  /// No description provided for @lbl_open_deposits.
  ///
  /// In en, this message translates to:
  /// **'Open deposits'**
  String get lbl_open_deposits;

  /// No description provided for @msg_early_deposit_withdrawal.
  ///
  /// In en, this message translates to:
  /// **'Early deposit withdrawal'**
  String get msg_early_deposit_withdrawal;

  /// No description provided for @msg_please_enter_expiry_date.
  ///
  /// In en, this message translates to:
  /// **'Please enter Expiry date '**
  String get msg_please_enter_expiry_date;

  /// No description provided for @msg_invalid_expiry_date_format.
  ///
  /// In en, this message translates to:
  /// **'Invalid date format. Use MM/YY.'**
  String get msg_invalid_expiry_date_format;

  /// No description provided for @msg_invalid_expiry_date.
  ///
  /// In en, this message translates to:
  /// **'Invalid expiry date'**
  String get msg_invalid_expiry_date;

  /// No description provided for @msg_invalid_month.
  ///
  /// In en, this message translates to:
  /// **'The month must be between 01 and 12'**
  String get msg_invalid_month;

  /// No description provided for @msg_expiry_date_in_past.
  ///
  /// In en, this message translates to:
  /// **'The expiry date has already passed.'**
  String get msg_expiry_date_in_past;

  /// No description provided for @msg_top_up_amount_less.
  ///
  /// In en, this message translates to:
  /// **'You cannot top up an amount of less than '**
  String get msg_top_up_amount_less;

  /// No description provided for @msg_top_up_amount_greater.
  ///
  /// In en, this message translates to:
  /// **'You cannot recharge an amount greater than '**
  String get msg_top_up_amount_greater;

  /// No description provided for @msg_deposit_created.
  ///
  /// In en, this message translates to:
  /// **'Deposit created!'**
  String get msg_deposit_created;

  /// No description provided for @msg_your_deposit_has.
  ///
  /// In en, this message translates to:
  /// **'Your deposit has been created\nsuccessfully!'**
  String get msg_your_deposit_has;

  /// No description provided for @lbl_50_usd_per_day.
  ///
  /// In en, this message translates to:
  /// **'50 USD per day'**
  String get lbl_50_usd_per_day;

  /// No description provided for @lbl_amout_achieve.
  ///
  /// In en, this message translates to:
  /// **'Amout achieve'**
  String get lbl_amout_achieve;

  /// No description provided for @lbl_open_money_bank.
  ///
  /// In en, this message translates to:
  /// **'Open money bank'**
  String get lbl_open_money_bank;

  /// No description provided for @lbl_your_goal.
  ///
  /// In en, this message translates to:
  /// **'Your goal'**
  String get lbl_your_goal;

  /// No description provided for @msg_choose_installment.
  ///
  /// In en, this message translates to:
  /// **'Choose installment'**
  String get msg_choose_installment;

  /// No description provided for @msg_rounding_up_to_1.
  ///
  /// In en, this message translates to:
  /// **'Rounding up to 1 per transfer'**
  String get msg_rounding_up_to_1;

  /// No description provided for @msg_rounding_up_to_10.
  ///
  /// In en, this message translates to:
  /// **'Rounding up to 10 per transfer '**
  String get msg_rounding_up_to_10;

  /// No description provided for @msg_money_bank_created.
  ///
  /// In en, this message translates to:
  /// **'Money bank created!'**
  String get msg_money_bank_created;

  /// No description provided for @msg_your_money_bank.
  ///
  /// In en, this message translates to:
  /// **'Your money bank has been created\nsuccessfully!'**
  String get msg_your_money_bank;

  /// No description provided for @lbl_expenses.
  ///
  /// In en, this message translates to:
  /// **'Expenses'**
  String get lbl_expenses;

  /// No description provided for @lbl_income.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get lbl_income;

  /// No description provided for @lbl_days.
  ///
  /// In en, this message translates to:
  /// **'Days'**
  String get lbl_days;

  /// No description provided for @lbl_month.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get lbl_month;

  /// No description provided for @lbl_year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get lbl_year;

  /// No description provided for @lbl_20_month.
  ///
  /// In en, this message translates to:
  /// **'20 Month'**
  String get lbl_20_month;

  /// No description provided for @lbl_21.
  ///
  /// In en, this message translates to:
  /// **'21%'**
  String get lbl_21;

  /// No description provided for @lbl_24_month.
  ///
  /// In en, this message translates to:
  /// **'24 Month'**
  String get lbl_24_month;

  /// No description provided for @lbl_2500_00.
  ///
  /// In en, this message translates to:
  /// **'2500.00'**
  String get lbl_2500_00;

  /// No description provided for @lbl_25_month.
  ///
  /// In en, this message translates to:
  /// **'25 Month'**
  String get lbl_25_month;

  /// No description provided for @lbl_3500_00.
  ///
  /// In en, this message translates to:
  /// **'3500.00'**
  String get lbl_3500_00;

  /// No description provided for @lbl_loans.
  ///
  /// In en, this message translates to:
  /// **'Loans'**
  String get lbl_loans;

  /// No description provided for @lbl_monthly_payment.
  ///
  /// In en, this message translates to:
  /// **'Monthly payment'**
  String get lbl_monthly_payment;

  /// No description provided for @lbl_perioud.
  ///
  /// In en, this message translates to:
  /// **'Perioud'**
  String get lbl_perioud;

  /// No description provided for @lbl_rate.
  ///
  /// In en, this message translates to:
  /// **'Rate'**
  String get lbl_rate;

  /// No description provided for @lbl_total_period.
  ///
  /// In en, this message translates to:
  /// **'Total period'**
  String get lbl_total_period;

  /// No description provided for @lbl_open_new_loan.
  ///
  /// In en, this message translates to:
  /// **'Open new loan'**
  String get lbl_open_new_loan;

  /// No description provided for @msg_enter_monthly_repayment.
  ///
  /// In en, this message translates to:
  /// **'Enter monthly repayment'**
  String get msg_enter_monthly_repayment;

  /// No description provided for @msg_application_submited.
  ///
  /// In en, this message translates to:
  /// **'Application submited!'**
  String get msg_application_submited;

  /// No description provided for @msg_your_loan_application.
  ///
  /// In en, this message translates to:
  /// **'Your loan application was successfully\nsubmited!'**
  String get msg_your_loan_application;

  /// No description provided for @lbl_repay_success.
  ///
  /// In en, this message translates to:
  /// **'Repay success'**
  String get lbl_repay_success;

  /// No description provided for @msg_has_been_added_to2.
  ///
  /// In en, this message translates to:
  /// **'Has been added to your repay money\nsuccessfull.'**
  String get msg_has_been_added_to2;

  /// No description provided for @lbl_guest_profile.
  ///
  /// In en, this message translates to:
  /// **'Guest profile'**
  String get lbl_guest_profile;

  /// No description provided for @lbl_edit_profile.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get lbl_edit_profile;

  /// No description provided for @lbl_face_id.
  ///
  /// In en, this message translates to:
  /// **'Face ID'**
  String get lbl_face_id;

  /// No description provided for @msg_amet_minim_mollit.
  ///
  /// In en, this message translates to:
  /// **'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.'**
  String get msg_amet_minim_mollit;

  /// No description provided for @msg_amet_minim_mollit2.
  ///
  /// In en, this message translates to:
  /// **'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. '**
  String get msg_amet_minim_mollit2;

  /// No description provided for @msg_how_do_i_add_money.
  ///
  /// In en, this message translates to:
  /// **'How do I add money to my Pay Tel account?'**
  String get msg_how_do_i_add_money;

  /// No description provided for @msg_in_a_laoreet_purus2.
  ///
  /// In en, this message translates to:
  /// **'In a laoreet purus. Integer turpis quam, laoreet id orci nec, ultrices lacinia nunc. Aliquam erat volutpat. Curabitur fringilla in purus eget egestas. Etiam quis.'**
  String get msg_in_a_laoreet_purus2;

  /// No description provided for @msg_ivorem_ipsum_dolor.
  ///
  /// In en, this message translates to:
  /// **'IVorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. '**
  String get msg_ivorem_ipsum_dolor;

  /// No description provided for @msg_lorem_ipsum_dolor.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. '**
  String get msg_lorem_ipsum_dolor;

  /// No description provided for @msg_can_you_refund_on.
  ///
  /// In en, this message translates to:
  /// **'Can you refund on PayPal?'**
  String get msg_can_you_refund_on;

  /// No description provided for @msg_how_do_i_get_a_refund.
  ///
  /// In en, this message translates to:
  /// **'How do I get a refund from cash?'**
  String get msg_how_do_i_get_a_refund;

  /// No description provided for @msg_how_does_paytel.
  ///
  /// In en, this message translates to:
  /// **'How does Paytel messaging work?'**
  String get msg_how_does_paytel;

  /// No description provided for @msg_is_video_call_risky.
  ///
  /// In en, this message translates to:
  /// **'Is video call risky?'**
  String get msg_is_video_call_risky;

  /// No description provided for @msg_is_we_transfer_free.
  ///
  /// In en, this message translates to:
  /// **'Is we transfer free?'**
  String get msg_is_we_transfer_free;

  /// No description provided for @msg_lorem_ipsum_dolor2.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'**
  String get msg_lorem_ipsum_dolor2;

  /// No description provided for @msg_which_video_calls.
  ///
  /// In en, this message translates to:
  /// **'Which video calls are safe?'**
  String get msg_which_video_calls;

  /// No description provided for @msg_will_paypal_refund.
  ///
  /// In en, this message translates to:
  /// **'Will PayPal refund money scammed?'**
  String get msg_will_paypal_refund;

  /// No description provided for @msg_write_your_feedback.
  ///
  /// In en, this message translates to:
  /// **'Write your feedback...'**
  String get msg_write_your_feedback;

  /// No description provided for @msg_your_feedback_submitted.
  ///
  /// In en, this message translates to:
  /// **'Your feedback submitted'**
  String get msg_your_feedback_submitted;

  /// No description provided for @msg_your_review_has.
  ///
  /// In en, this message translates to:
  /// **'Your review has been submitted \nsuccessfully.'**
  String get msg_your_review_has;

  /// No description provided for @msg_disclosure_of_your.
  ///
  /// In en, this message translates to:
  /// **'Disclosure of your data'**
  String get msg_disclosure_of_your;

  /// No description provided for @msg_lorem_ipsum_dolor3.
  ///
  /// In en, this message translates to:
  /// **'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Donec ac odio tempor orci dapibus ultrices in iaculis Ac auctor augue mauris augue neque gravida. Velit ut tortor pretium viverra suspendisse. Volutpat commodo sed egestas egestas fringilla phasellus faucibus. '**
  String get msg_lorem_ipsum_dolor3;

  /// No description provided for @msg_torem_ipsum_dolor.
  ///
  /// In en, this message translates to:
  /// **'Torem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum '**
  String get msg_torem_ipsum_dolor;

  /// No description provided for @msg_types_of_data_we.
  ///
  /// In en, this message translates to:
  /// **'Types of data we collect'**
  String get msg_types_of_data_we;

  /// No description provided for @msg_use_of_your_personal.
  ///
  /// In en, this message translates to:
  /// **'Use of your personal data'**
  String get msg_use_of_your_personal;

  /// No description provided for @msg_by_submitting.
  ///
  /// In en, this message translates to:
  /// **'By submitting this form, you agree with'**
  String get msg_by_submitting;

  /// No description provided for @msg_conditions_of_uses.
  ///
  /// In en, this message translates to:
  /// **'Conditions of Uses'**
  String get msg_conditions_of_uses;

  /// No description provided for @msg_it_is_a_long_established.
  ///
  /// In en, this message translates to:
  /// **'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. \n\nMany desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).'**
  String get msg_it_is_a_long_established;

  /// No description provided for @msg_last_update_27_12_2023.
  ///
  /// In en, this message translates to:
  /// **'Last update: 27/12/2023'**
  String get msg_last_update_27_12_2023;

  /// No description provided for @msg_please_read_these.
  ///
  /// In en, this message translates to:
  /// **'Please read these terms of service, carefully before using our app operated by us.'**
  String get msg_please_read_these;

  /// No description provided for @lbl_yes_logout.
  ///
  /// In en, this message translates to:
  /// **'Yes’ logout'**
  String get lbl_yes_logout;

  /// No description provided for @msg_are_you_sure_you.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to logout?'**
  String get msg_are_you_sure_you;

  /// No description provided for @lbl_00.
  ///
  /// In en, this message translates to:
  /// **'|.00'**
  String get lbl_00;

  /// No description provided for @lbl_00_00.
  ///
  /// In en, this message translates to:
  /// **'00.00'**
  String get lbl_00_00;

  /// No description provided for @lbl_02_9378_5922.
  ///
  /// In en, this message translates to:
  /// **'(02) 9378 5922'**
  String get lbl_02_9378_5922;

  /// No description provided for @lbl_0333_050_4358.
  ///
  /// In en, this message translates to:
  /// **'0333 050 4358'**
  String get lbl_0333_050_4358;

  /// No description provided for @lbl_10.
  ///
  /// In en, this message translates to:
  /// **'10'**
  String get lbl_10;

  /// No description provided for @lbl_100_00.
  ///
  /// In en, this message translates to:
  /// **'100.00'**
  String get lbl_100_00;

  /// No description provided for @lbl_102.
  ///
  /// In en, this message translates to:
  /// **'10%'**
  String get lbl_102;

  /// No description provided for @lbl_10_00.
  ///
  /// In en, this message translates to:
  /// **'10|.00'**
  String get lbl_10_00;

  /// No description provided for @lbl_10_0002.
  ///
  /// In en, this message translates to:
  /// **'10.000'**
  String get lbl_10_0002;

  /// No description provided for @lbl_10_000_00.
  ///
  /// In en, this message translates to:
  /// **'10,000.00'**
  String get lbl_10_000_00;

  /// No description provided for @lbl_120_00.
  ///
  /// In en, this message translates to:
  /// **'120.00'**
  String get lbl_120_00;

  /// No description provided for @lbl_123_00.
  ///
  /// In en, this message translates to:
  /// **'123.00'**
  String get lbl_123_00;

  /// No description provided for @lbl_125412154123.
  ///
  /// In en, this message translates to:
  /// **'125412154123'**
  String get lbl_125412154123;

  /// No description provided for @lbl_145214521452.
  ///
  /// In en, this message translates to:
  /// **'145214521452'**
  String get lbl_145214521452;

  /// No description provided for @lbl_15.
  ///
  /// In en, this message translates to:
  /// **'15%'**
  String get lbl_15;

  /// No description provided for @lbl_1k.
  ///
  /// In en, this message translates to:
  /// **'1K'**
  String get lbl_1k;

  /// No description provided for @lbl_2000_00.
  ///
  /// In en, this message translates to:
  /// **'2000.00'**
  String get lbl_2000_00;

  /// No description provided for @lbl_200_00.
  ///
  /// In en, this message translates to:
  /// **'200.00'**
  String get lbl_200_00;

  /// No description provided for @lbl_20_00.
  ///
  /// In en, this message translates to:
  /// **'20.00'**
  String get lbl_20_00;

  /// No description provided for @lbl_20_000_00.
  ///
  /// In en, this message translates to:
  /// **'20,000.00'**
  String get lbl_20_000_00;

  /// No description provided for @lbl_213_00.
  ///
  /// In en, this message translates to:
  /// **'213.00'**
  String get lbl_213_00;

  /// No description provided for @lbl_256365214214.
  ///
  /// In en, this message translates to:
  /// **'256365214214'**
  String get lbl_256365214214;

  /// No description provided for @lbl_2k.
  ///
  /// In en, this message translates to:
  /// **'2K'**
  String get lbl_2k;

  /// No description provided for @lbl_3000_00.
  ///
  /// In en, this message translates to:
  /// **'3000.00'**
  String get lbl_3000_00;

  /// No description provided for @lbl_300_00.
  ///
  /// In en, this message translates to:
  /// **'300.00'**
  String get lbl_300_00;

  /// No description provided for @lbl_32_000.
  ///
  /// In en, this message translates to:
  /// **'32.000'**
  String get lbl_32_000;

  /// No description provided for @lbl_3k.
  ///
  /// In en, this message translates to:
  /// **'3K'**
  String get lbl_3k;

  /// No description provided for @lbl_4000_00.
  ///
  /// In en, this message translates to:
  /// **'4000.00'**
  String get lbl_4000_00;

  /// No description provided for @lbl_400_00.
  ///
  /// In en, this message translates to:
  /// **'400.00'**
  String get lbl_400_00;

  /// No description provided for @lbl_450_00.
  ///
  /// In en, this message translates to:
  /// **'450.00'**
  String get lbl_450_00;

  /// No description provided for @lbl_4k.
  ///
  /// In en, this message translates to:
  /// **'4K'**
  String get lbl_4k;

  /// No description provided for @lbl_500_00.
  ///
  /// In en, this message translates to:
  /// **'500.00'**
  String get lbl_500_00;

  /// No description provided for @lbl_50_000_00.
  ///
  /// In en, this message translates to:
  /// **'50,000.00'**
  String get lbl_50_000_00;

  /// No description provided for @lbl_52_00.
  ///
  /// In en, this message translates to:
  /// **'52.00'**
  String get lbl_52_00;

  /// No description provided for @lbl_587412266542.
  ///
  /// In en, this message translates to:
  /// **'587412266542'**
  String get lbl_587412266542;

  /// No description provided for @lbl_600_00.
  ///
  /// In en, this message translates to:
  /// **'600.00'**
  String get lbl_600_00;

  /// No description provided for @lbl_about_us.
  ///
  /// In en, this message translates to:
  /// **'About us'**
  String get lbl_about_us;

  /// No description provided for @lbl_abram.
  ///
  /// In en, this message translates to:
  /// **'Abram'**
  String get lbl_abram;

  /// No description provided for @lbl_add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get lbl_add;

  /// No description provided for @lbl_add_card.
  ///
  /// In en, this message translates to:
  /// **'Add card'**
  String get lbl_add_card;

  /// No description provided for @lbl_add_note.
  ///
  /// In en, this message translates to:
  /// **'Add note'**
  String get lbl_add_note;

  /// No description provided for @lbl_add_reason.
  ///
  /// In en, this message translates to:
  /// **'Add reason'**
  String get lbl_add_reason;

  /// No description provided for @lbl_card_created.
  ///
  /// In en, this message translates to:
  /// **'Card created!'**
  String get lbl_card_created;

  /// No description provided for @lbl_card_number.
  ///
  /// In en, this message translates to:
  /// **'Card number'**
  String get lbl_card_number;

  /// No description provided for @lbl_change_password.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get lbl_change_password;

  /// No description provided for @lbl_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get lbl_confirm;

  /// No description provided for @lbl_confirm_payment.
  ///
  /// In en, this message translates to:
  /// **'Confirm payment'**
  String get lbl_confirm_payment;

  /// No description provided for @lbl_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get lbl_continue;

  /// No description provided for @lbl_cvv.
  ///
  /// In en, this message translates to:
  /// **'CVV'**
  String get lbl_cvv;

  /// No description provided for @lbl_default_card.
  ///
  /// In en, this message translates to:
  /// **'Default card'**
  String get lbl_default_card;

  /// No description provided for @lbl_deposite.
  ///
  /// In en, this message translates to:
  /// **'Deposite'**
  String get lbl_deposite;

  /// No description provided for @lbl_deposits.
  ///
  /// In en, this message translates to:
  /// **'Deposits'**
  String get lbl_deposits;

  /// No description provided for @lbl_details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get lbl_details;

  /// No description provided for @lbl_done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get lbl_done;

  /// No description provided for @lbl_download_print.
  ///
  /// In en, this message translates to:
  /// **'Download print'**
  String get lbl_download_print;

  /// No description provided for @lbl_email_address.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get lbl_email_address;

  /// No description provided for @lbl_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get lbl_email;

  /// No description provided for @lbl_phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get lbl_phone_number;

  /// No description provided for @lbl_enter_amout.
  ///
  /// In en, this message translates to:
  /// **'Enter amout'**
  String get lbl_enter_amout;

  /// No description provided for @lbl_enter_your_pin.
  ///
  /// In en, this message translates to:
  /// **'Enter your pin'**
  String get lbl_enter_your_pin;

  /// No description provided for @lbl_expiray_date.
  ///
  /// In en, this message translates to:
  /// **'Expiray date'**
  String get lbl_expiray_date;

  /// No description provided for @lbl_feedback.
  ///
  /// In en, this message translates to:
  /// **'Feedback'**
  String get lbl_feedback;

  /// No description provided for @lbl_first_name.
  ///
  /// In en, this message translates to:
  /// **'First name'**
  String get lbl_first_name;

  /// No description provided for @lbl_fri.
  ///
  /// In en, this message translates to:
  /// **'Fri'**
  String get lbl_fri;

  /// No description provided for @lbl_help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get lbl_help;

  /// No description provided for @lbl_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get lbl_home;

  /// No description provided for @lbl_indonesia.
  ///
  /// In en, this message translates to:
  /// **'Indonesia'**
  String get lbl_indonesia;

  /// No description provided for @lbl_jane_cooper.
  ///
  /// In en, this message translates to:
  /// **'Jane cooper'**
  String get lbl_jane_cooper;

  /// No description provided for @lbl_john.
  ///
  /// In en, this message translates to:
  /// **'John'**
  String get lbl_john;

  /// No description provided for @lbl_john_abram.
  ///
  /// In en, this message translates to:
  /// **'John abram'**
  String get lbl_john_abram;

  /// No description provided for @lbl_john_abram2.
  ///
  /// In en, this message translates to:
  /// **'John Abram'**
  String get lbl_john_abram2;

  /// No description provided for @lbl_last_name.
  ///
  /// In en, this message translates to:
  /// **'Last name'**
  String get lbl_last_name;

  /// No description provided for @lbl_loan.
  ///
  /// In en, this message translates to:
  /// **'Loan'**
  String get lbl_loan;

  /// No description provided for @lbl_loan_deposite.
  ///
  /// In en, this message translates to:
  /// **'Loan deposite'**
  String get lbl_loan_deposite;

  /// No description provided for @lbl_log_in.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get lbl_log_in;

  /// No description provided for @lbl_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get lbl_logout;

  /// No description provided for @lbl_mon.
  ///
  /// In en, this message translates to:
  /// **'Mon'**
  String get lbl_mon;

  /// No description provided for @lbl_money_bank.
  ///
  /// In en, this message translates to:
  /// **'Money bank'**
  String get lbl_money_bank;

  /// No description provided for @lbl_mood_swings.
  ///
  /// In en, this message translates to:
  /// **'Mood swings'**
  String get lbl_mood_swings;

  /// No description provided for @lbl_my_profile.
  ///
  /// In en, this message translates to:
  /// **'My profile'**
  String get lbl_my_profile;

  /// No description provided for @lbl_new_loan.
  ///
  /// In en, this message translates to:
  /// **'New loan'**
  String get lbl_new_loan;

  /// No description provided for @lbl_new_password.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get lbl_new_password;

  /// No description provided for @lbl_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get lbl_next;

  /// No description provided for @lbl_notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get lbl_notifications;

  /// No description provided for @lbl_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get lbl_password;

  /// No description provided for @lbl_payment_with.
  ///
  /// In en, this message translates to:
  /// **'Payment with'**
  String get lbl_payment_with;

  /// No description provided for @lbl_privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get lbl_privacy_policy;

  /// No description provided for @lbl_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get lbl_profile;

  /// No description provided for @lbl_razor_bank.
  ///
  /// In en, this message translates to:
  /// **'Razor bank'**
  String get lbl_razor_bank;

  /// No description provided for @lbl_recipient.
  ///
  /// In en, this message translates to:
  /// **'Recipient'**
  String get lbl_recipient;

  /// No description provided for @lbl_repay.
  ///
  /// In en, this message translates to:
  /// **'Repay'**
  String get lbl_repay;

  /// No description provided for @lbl_restlessness.
  ///
  /// In en, this message translates to:
  /// **'Restlessness'**
  String get lbl_restlessness;

  /// No description provided for @lbl_sat.
  ///
  /// In en, this message translates to:
  /// **'Sat'**
  String get lbl_sat;

  /// No description provided for @lbl_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get lbl_save;

  /// No description provided for @lbl_scan.
  ///
  /// In en, this message translates to:
  /// **'Scan '**
  String get lbl_scan;

  /// No description provided for @lbl_security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get lbl_security;

  /// No description provided for @lbl_see_details.
  ///
  /// In en, this message translates to:
  /// **'See details'**
  String get lbl_see_details;

  /// No description provided for @lbl_select_bank.
  ///
  /// In en, this message translates to:
  /// **'Select bank'**
  String get lbl_select_bank;

  /// No description provided for @lbl_select_card.
  ///
  /// In en, this message translates to:
  /// **'Select card'**
  String get lbl_select_card;

  /// No description provided for @lbl_select_currency.
  ///
  /// In en, this message translates to:
  /// **'Select currency'**
  String get lbl_select_currency;

  /// No description provided for @lbl_send_from.
  ///
  /// In en, this message translates to:
  /// **'Send from'**
  String get lbl_send_from;

  /// No description provided for @lbl_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get lbl_settings;

  /// No description provided for @lbl_sign_up.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get lbl_sign_up;

  /// No description provided for @lbl_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get lbl_skip;

  /// No description provided for @lbl_sleeping.
  ///
  /// In en, this message translates to:
  /// **'Sleeping'**
  String get lbl_sleeping;

  /// No description provided for @lbl_spending.
  ///
  /// In en, this message translates to:
  /// **'Spending'**
  String get lbl_spending;

  /// No description provided for @lbl_statistic.
  ///
  /// In en, this message translates to:
  /// **'Statistic'**
  String get lbl_statistic;

  /// No description provided for @lbl_submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get lbl_submit;

  /// No description provided for @lbl_sun.
  ///
  /// In en, this message translates to:
  /// **'Sun'**
  String get lbl_sun;

  /// No description provided for @lbl_this_week.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get lbl_this_week;

  /// No description provided for @lbl_thu.
  ///
  /// In en, this message translates to:
  /// **'Thu'**
  String get lbl_thu;

  /// No description provided for @lbl_to_jane_cooper.
  ///
  /// In en, this message translates to:
  /// **'To: Jane cooper'**
  String get lbl_to_jane_cooper;

  /// No description provided for @lbl_today_1_20_pm.
  ///
  /// In en, this message translates to:
  /// **'Today, 1:20 Pm'**
  String get lbl_today_1_20_pm;

  /// No description provided for @lbl_top_up.
  ///
  /// In en, this message translates to:
  /// **'Top up'**
  String get lbl_top_up;

  /// No description provided for @lbl_topup_amout.
  ///
  /// In en, this message translates to:
  /// **'Topup amout'**
  String get lbl_topup_amout;

  /// No description provided for @lbl_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get lbl_total;

  /// No description provided for @lbl_total_balance.
  ///
  /// In en, this message translates to:
  /// **'Total balance'**
  String get lbl_total_balance;

  /// No description provided for @lbl_tranfer_to.
  ///
  /// In en, this message translates to:
  /// **'Tranfer to'**
  String get lbl_tranfer_to;

  /// No description provided for @lbl_transfer_id.
  ///
  /// In en, this message translates to:
  /// **'Transfer ID'**
  String get lbl_transfer_id;

  /// No description provided for @lbl_transfers.
  ///
  /// In en, this message translates to:
  /// **'Transfers '**
  String get lbl_transfers;

  /// No description provided for @lbl_transfer.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get lbl_transfer;

  /// No description provided for @lbl_transfer_amount.
  ///
  /// In en, this message translates to:
  /// **'Transfer amount'**
  String get lbl_transfer_amount;

  /// No description provided for @lbl_transfer_fees.
  ///
  /// In en, this message translates to:
  /// **'Transfer fees'**
  String get lbl_transfer_fees;

  /// No description provided for @lbl_fees.
  ///
  /// In en, this message translates to:
  /// **'Fees'**
  String get lbl_fees;

  /// No description provided for @lbl_exchange_rates.
  ///
  /// In en, this message translates to:
  /// **'Exchange rates'**
  String get lbl_exchange_rates;

  /// No description provided for @lbl_total_recipient.
  ///
  /// In en, this message translates to:
  /// **'Total for the recipient'**
  String get lbl_total_recipient;

  /// No description provided for @lbl_transfer_to.
  ///
  /// In en, this message translates to:
  /// **'Transfer to'**
  String get lbl_transfer_to;

  /// No description provided for @lbl_trouble.
  ///
  /// In en, this message translates to:
  /// **'Trouble'**
  String get lbl_trouble;

  /// No description provided for @lbl_tue.
  ///
  /// In en, this message translates to:
  /// **'Tue'**
  String get lbl_tue;

  /// No description provided for @lbl_view_all.
  ///
  /// In en, this message translates to:
  /// **'View all'**
  String get lbl_view_all;

  /// No description provided for @lbl_wed.
  ///
  /// In en, this message translates to:
  /// **'Wed'**
  String get lbl_wed;

  /// No description provided for @lbl_week.
  ///
  /// In en, this message translates to:
  /// **'Week'**
  String get lbl_week;

  /// No description provided for @lbl_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get lbl_welcome;

  /// No description provided for @lbl_welcome_back.
  ///
  /// In en, this message translates to:
  /// **'Welcome back!'**
  String get lbl_welcome_back;

  /// No description provided for @lbl_withdraw.
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get lbl_withdraw;

  /// No description provided for @lbl_withdraw_amout.
  ///
  /// In en, this message translates to:
  /// **'Withdraw amount'**
  String get lbl_withdraw_amout;

  /// No description provided for @lbl_withdraw_fees.
  ///
  /// In en, this message translates to:
  /// **'Withdraw fees'**
  String get lbl_withdraw_fees;

  /// No description provided for @lbl_withdraw_atm.
  ///
  /// In en, this message translates to:
  /// **'Withdraw ATM'**
  String get lbl_withdraw_atm;

  /// No description provided for @lbl_withdrawal.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal'**
  String get lbl_withdrawal;

  /// No description provided for @msg_20_march_2_10_am.
  ///
  /// In en, this message translates to:
  /// **'20 March, 2:10 Am'**
  String get msg_20_march_2_10_am;

  /// No description provided for @msg_2541.
  ///
  /// In en, this message translates to:
  /// **'**** **** **** 2541'**
  String get msg_2541;

  /// No description provided for @msg_2564.
  ///
  /// In en, this message translates to:
  /// **'**** **** **** 2564'**
  String get msg_2564;

  /// No description provided for @msg_4_january_4_00.
  ///
  /// In en, this message translates to:
  /// **'4 January, 4:00 Am'**
  String get msg_4_january_4_00;

  /// No description provided for @msg_adnanomran_gmail_com.
  ///
  /// In en, this message translates to:
  /// **'adnanomran@gmail.com'**
  String get msg_adnanomran_gmail_com;

  /// No description provided for @msg_card_holder_name.
  ///
  /// In en, this message translates to:
  /// **'Card holder name'**
  String get msg_card_holder_name;

  /// No description provided for @msg_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get msg_confirm_password;

  /// No description provided for @msg_enter_a_pin_number2.
  ///
  /// In en, this message translates to:
  /// **'Enter a pin number to make your card more secure'**
  String get msg_enter_a_pin_number2;

  /// No description provided for @msg_financial_transfer.
  ///
  /// In en, this message translates to:
  /// **'Financial transfer'**
  String get msg_financial_transfer;

  /// No description provided for @msg_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get msg_forgot_password;

  /// No description provided for @msg_from_adnan_omran.
  ///
  /// In en, this message translates to:
  /// **'From: Adnan omran'**
  String get msg_from_adnan_omran;

  /// No description provided for @msg_from_john_abram.
  ///
  /// In en, this message translates to:
  /// **'From: John abram'**
  String get msg_from_john_abram;

  /// No description provided for @msg_janecooper_gmail_com.
  ///
  /// In en, this message translates to:
  /// **'janecooper@gmail.com'**
  String get msg_janecooper_gmail_com;

  /// No description provided for @msg_jazopay_card_has.
  ///
  /// In en, this message translates to:
  /// **'Jazopay card has been created\nsuccessfully!'**
  String get msg_jazopay_card_has;

  /// No description provided for @msg_johnabram_gmail_com.
  ///
  /// In en, this message translates to:
  /// **'johnabram@gmail.com'**
  String get msg_johnabram_gmail_com;

  /// No description provided for @msg_nicotine_cravings.
  ///
  /// In en, this message translates to:
  /// **'Nicotine cravings'**
  String get msg_nicotine_cravings;

  /// No description provided for @msg_please_enter_pin.
  ///
  /// In en, this message translates to:
  /// **'Please enter PIN to confirm payment'**
  String get msg_please_enter_pin;

  /// No description provided for @msg_select_deposite.
  ///
  /// In en, this message translates to:
  /// **'Select deposite perioud'**
  String get msg_select_deposite;

  /// No description provided for @msg_terms_conditions.
  ///
  /// In en, this message translates to:
  /// **'Terms & conditions'**
  String get msg_terms_conditions;

  /// No description provided for @msg_to_wajih_taysir.
  ///
  /// In en, this message translates to:
  /// **'To: Wajih taysir'**
  String get msg_to_wajih_taysir;

  /// No description provided for @msg_transfer_details.
  ///
  /// In en, this message translates to:
  /// **'Transfer details'**
  String get msg_transfer_details;

  /// No description provided for @msg_transfer_success.
  ///
  /// In en, this message translates to:
  /// **'Transfer success'**
  String get msg_transfer_success;

  /// No description provided for @msg_upi_transfer.
  ///
  /// In en, this message translates to:
  /// **'UPI transfer ID'**
  String get msg_upi_transfer;

  /// No description provided for @msg_wajih_taysir_handal.
  ///
  /// In en, this message translates to:
  /// **'Wajih Taysir Handal'**
  String get msg_wajih_taysir_handal;

  /// No description provided for @msg_wajihtaysir_gmail_com.
  ///
  /// In en, this message translates to:
  /// **'wajihtaysir@gmail.com'**
  String get msg_wajihtaysir_gmail_com;

  /// No description provided for @msg_your_money_has_been.
  ///
  /// In en, this message translates to:
  /// **'Your money has Been transfered \nsuccessfully!'**
  String get msg_your_money_has_been;

  /// No description provided for @msg_network_err.
  ///
  /// In en, this message translates to:
  /// **'Network Error'**
  String get msg_network_err;

  /// No description provided for @err_msg_please_enter_valid_email.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid email'**
  String get err_msg_please_enter_valid_email;

  /// No description provided for @err_msg_please_enter_valid_password.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid password'**
  String get err_msg_please_enter_valid_password;

  /// No description provided for @err_msg_please_enter_valid_text.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid text'**
  String get err_msg_please_enter_valid_text;

  /// No description provided for @err_msg_please_enter_valid_number.
  ///
  /// In en, this message translates to:
  /// **'Please enter valid number'**
  String get err_msg_please_enter_valid_number;

  /// No description provided for @lbl_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get lbl_language;

  /// No description provided for @lbl_lg_english.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get lbl_lg_english;

  /// No description provided for @lbl_lg_french.
  ///
  /// In en, this message translates to:
  /// **'French'**
  String get lbl_lg_french;

  /// No description provided for @ipt_val_email_empty.
  ///
  /// In en, this message translates to:
  /// **'The e-mail address is required to continue. Please enter it.'**
  String get ipt_val_email_empty;

  /// No description provided for @ipt_val_email.
  ///
  /// In en, this message translates to:
  /// **'The e-mail address seems incorrect. Make sure it contains an \'@\' and a valid domain (e.g. exemple@domaine.com).'**
  String get ipt_val_email;

  /// No description provided for @ipt_val_email_login.
  ///
  /// In en, this message translates to:
  /// **'Invalid e-mail address. Check that it is correctly formatted '**
  String get ipt_val_email_login;

  /// No description provided for @ipt_val_password_empty.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid Password.'**
  String get ipt_val_password_empty;

  /// No description provided for @ipt_val_password.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters long, include an uppercase letter, a lowercase letter, a number, and a special character.'**
  String get ipt_val_password;

  /// No description provided for @ipt_val_firstName_empty.
  ///
  /// In en, this message translates to:
  /// **'This field is mandatory. Please enter your first name'**
  String get ipt_val_firstName_empty;

  /// No description provided for @ipt_val_firstName_min_length.
  ///
  /// In en, this message translates to:
  /// **'The first name must contain at least 2 characters'**
  String get ipt_val_firstName_min_length;

  /// No description provided for @ipt_val_firstName_max_length.
  ///
  /// In en, this message translates to:
  /// **'The first name must not exceed 50 characters'**
  String get ipt_val_firstName_max_length;

  /// No description provided for @ipt_val_firstName.
  ///
  /// In en, this message translates to:
  /// **'Only letters, spaces, hyphens or apostrophes are allowed.'**
  String get ipt_val_firstName;

  /// No description provided for @ipt_val_lastName_empty.
  ///
  /// In en, this message translates to:
  /// **'This field is mandatory. Please enter your last name'**
  String get ipt_val_lastName_empty;

  /// No description provided for @ipt_val_lastName_min_length.
  ///
  /// In en, this message translates to:
  /// **'The last name must contain at least 2 characters'**
  String get ipt_val_lastName_min_length;

  /// No description provided for @ipt_val_lastName_max_length.
  ///
  /// In en, this message translates to:
  /// **'The last name must not exceed 50 characters'**
  String get ipt_val_lastName_max_length;

  /// No description provided for @ipt_val_otp_empty.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid code'**
  String get ipt_val_otp_empty;

  /// No description provided for @phone_ipt_searchText.
  ///
  /// In en, this message translates to:
  /// **'Search country'**
  String get phone_ipt_searchText;

  /// No description provided for @phone_ipt_invalidNum.
  ///
  /// In en, this message translates to:
  /// **'Invalid Mobile Number'**
  String get phone_ipt_invalidNum;

  /// No description provided for @msg_registration_success_title.
  ///
  /// In en, this message translates to:
  /// **'Registration Complete'**
  String get msg_registration_success_title;

  /// No description provided for @msg_registration_success_desc.
  ///
  /// In en, this message translates to:
  /// **'Your account has been successfully created'**
  String get msg_registration_success_desc;

  /// No description provided for @msg_registration_success_button.
  ///
  /// In en, this message translates to:
  /// **'Continue to login'**
  String get msg_registration_success_button;

  /// No description provided for @msg_login_failure.
  ///
  /// In en, this message translates to:
  /// **'Invalid login credentials'**
  String get msg_login_failure;

  /// No description provided for @no_internet_connection.
  ///
  /// In en, this message translates to:
  /// **'No internet connection'**
  String get no_internet_connection;

  /// No description provided for @msg_session_expired.
  ///
  /// In en, this message translates to:
  /// **'Please log in, your session has expired'**
  String get msg_session_expired;

  /// No description provided for @lbl_already_have_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get lbl_already_have_account;

  /// No description provided for @lbl_dont_have_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get lbl_dont_have_account;

  /// No description provided for @lbl_let_get_started.
  ///
  /// In en, this message translates to:
  /// **'Let\'s get started'**
  String get lbl_let_get_started;

  /// No description provided for @lbl_oops_something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Oops, something went wrong !'**
  String get lbl_oops_something_went_wrong;

  /// No description provided for @lbl_please_try_again.
  ///
  /// In en, this message translates to:
  /// **'Please try again in a few seconds.'**
  String get lbl_please_try_again;

  /// No description provided for @lbl_try_again.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get lbl_try_again;

  /// No description provided for @lbl_payment_gateway.
  ///
  /// In en, this message translates to:
  /// **'Payment gateway'**
  String get lbl_payment_gateway;

  /// No description provided for @msg_please_choose_gateway.
  ///
  /// In en, this message translates to:
  /// **'Please choose the payment gateway you would like to use for your transfer.'**
  String get msg_please_choose_gateway;

  /// No description provided for @lbl_no_deposits_made.
  ///
  /// In en, this message translates to:
  /// **'No deposits have been made '**
  String get lbl_no_deposits_made;

  /// No description provided for @lbl_status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get lbl_status;

  /// No description provided for @lbl_deposits_amount.
  ///
  /// In en, this message translates to:
  /// **'Deposit amount'**
  String get lbl_deposits_amount;

  /// No description provided for @lbl_deposits_fees.
  ///
  /// In en, this message translates to:
  /// **'Deposit fees'**
  String get lbl_deposits_fees;

  /// No description provided for @msg_please_enter_amount.
  ///
  /// In en, this message translates to:
  /// **'Please enter amount '**
  String get msg_please_enter_amount;

  /// No description provided for @msg_please_enter_card_number.
  ///
  /// In en, this message translates to:
  /// **'Please enter card number '**
  String get msg_please_enter_card_number;

  /// No description provided for @msg_please_enter_ccv.
  ///
  /// In en, this message translates to:
  /// **'Please enter CVV code '**
  String get msg_please_enter_ccv;

  /// No description provided for @msg_please_holder_name.
  ///
  /// In en, this message translates to:
  /// **'Please enter Card holder name'**
  String get msg_please_holder_name;

  /// No description provided for @msg_transaction_processed.
  ///
  /// In en, this message translates to:
  /// **'Your transaction is being processed. You will receive a notification once it has been finalized'**
  String get msg_transaction_processed;

  /// No description provided for @msg_treatment_in_progress.
  ///
  /// In en, this message translates to:
  /// **'Treatment in progress'**
  String get msg_treatment_in_progress;

  /// No description provided for @lbl_delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get lbl_delivered;

  /// No description provided for @lbl_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get lbl_pending;

  /// No description provided for @lbl_rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get lbl_rejected;

  /// No description provided for @msg_successful_registration.
  ///
  /// In en, this message translates to:
  /// **'Successful registration!'**
  String get msg_successful_registration;

  /// No description provided for @msg_registration_now_complete.
  ///
  /// In en, this message translates to:
  /// **'Your account has been successfully created. Please check your mailbox and click on the validation link to activate your account. 📩'**
  String get msg_registration_now_complete;

  /// No description provided for @msg_username_or_email_already_exists.
  ///
  /// In en, this message translates to:
  /// **'This phone number or email is already in use. Please choose another one.'**
  String get msg_username_or_email_already_exists;

  /// No description provided for @msg_account_not_verified.
  ///
  /// In en, this message translates to:
  /// **'Your account is not verified. Check your e-mails to confirm your account.'**
  String get msg_account_not_verified;

  /// No description provided for @msg_error_occurred.
  ///
  /// In en, this message translates to:
  /// **'An error has occurred'**
  String get msg_error_occurred;

  /// No description provided for @msg_balance_insufficient.
  ///
  /// In en, this message translates to:
  /// **'Your balance is insufficient'**
  String get msg_balance_insufficient;

  /// No description provided for @lbl_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading'**
  String get lbl_loading;

  /// No description provided for @lbl_no_withdrawals_made.
  ///
  /// In en, this message translates to:
  /// **'No withdrawals have been made '**
  String get lbl_no_withdrawals_made;

  /// No description provided for @msg_withdraw_amount_less.
  ///
  /// In en, this message translates to:
  /// **'You cannot withdraw an amount of less than '**
  String get msg_withdraw_amount_less;

  /// No description provided for @msg_withdraw_amount_greater.
  ///
  /// In en, this message translates to:
  /// **'You cannot withdraw an amount greater than '**
  String get msg_withdraw_amount_greater;

  /// No description provided for @lbl_select_image.
  ///
  /// In en, this message translates to:
  /// **'Select your image '**
  String get lbl_select_image;

  /// No description provided for @lbl_verify_your_identity.
  ///
  /// In en, this message translates to:
  /// **'Verify Your Identity for Secure Access '**
  String get lbl_verify_your_identity;

  /// No description provided for @lbl_upload_photo_id.
  ///
  /// In en, this message translates to:
  /// **'Upload a clear photo of your ID or take a picture to complete your KYC verification and unlock full access.'**
  String get lbl_upload_photo_id;

  /// No description provided for @lbl_kyc_verification_successful.
  ///
  /// In en, this message translates to:
  /// **'✅ KYC Verification Successful! '**
  String get lbl_kyc_verification_successful;

  /// No description provided for @lbl_identity_verified.
  ///
  /// In en, this message translates to:
  /// **'Congratulations! Your identity has been successfully verified. You now have full access to our services. 🚀 '**
  String get lbl_identity_verified;

  /// No description provided for @lbl_kyc_verification_required.
  ///
  /// In en, this message translates to:
  /// **'KYC verification required'**
  String get lbl_kyc_verification_required;

  /// No description provided for @lbl_kyc_verify_identity.
  ///
  /// In en, this message translates to:
  /// **'For security reasons, we need to verify your identity before proceeding.'**
  String get lbl_kyc_verify_identity;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
