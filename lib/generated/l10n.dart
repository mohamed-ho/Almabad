// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Email cannot be empty.`
  String get emailConnotBeEmpty {
    return Intl.message(
      'Email cannot be empty.',
      name: 'emailConnotBeEmpty',
      desc: '',
      args: [],
    );
  }

  /// `please enter you email`
  String get enterEmail {
    return Intl.message(
      'please enter you email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `please enter your passWord`
  String get enterPassword {
    return Intl.message(
      'please enter your passWord',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter a valid email address.`
  String get enterVaildEmail {
    return Intl.message(
      'Enter a valid email address.',
      name: 'enterVaildEmail',
      desc: '',
      args: [],
    );
  }

  /// `Password cannot be empty.`
  String get passwordConnotEmpty {
    return Intl.message(
      'Password cannot be empty.',
      name: 'passwordConnotEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long.`
  String get passwordMostBeAtLeast8char {
    return Intl.message(
      'Password must be at least 8 characters long.',
      name: 'passwordMostBeAtLeast8char',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one uppercase letter.`
  String get passwordMustContainOneUpperLetter {
    return Intl.message(
      'Password must contain at least one uppercase letter.',
      name: 'passwordMustContainOneUpperLetter',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one lowercase letter.`
  String get passwordMustContainOneLowerLetter {
    return Intl.message(
      'Password must contain at least one lowercase letter.',
      name: 'passwordMustContainOneLowerLetter',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one digit.`
  String get passwordMustContainOnedigit {
    return Intl.message(
      'Password must contain at least one digit.',
      name: 'passwordMustContainOnedigit',
      desc: '',
      args: [],
    );
  }

  /// `Password must contain at least one special character.`
  String get passwordMustContainOneSpecialChar {
    return Intl.message(
      'Password must contain at least one special character.',
      name: 'passwordMustContainOneSpecialChar',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `please enter your Full Name`
  String get enterFullName {
    return Intl.message(
      'please enter your Full Name',
      name: 'enterFullName',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `I don\'t have an account `
  String get iNotHaveAccount {
    return Intl.message(
      'I don\\\'t have an account ',
      name: 'iNotHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `I already have an account `
  String get iAlreadyHaveAccount {
    return Intl.message(
      'I already have an account ',
      name: 'iAlreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get OK {
    return Intl.message(
      'OK',
      name: 'OK',
      desc: '',
      args: [],
    );
  }

  /// `Try Again`
  String get tryAgain {
    return Intl.message(
      'Try Again',
      name: 'tryAgain',
      desc: '',
      args: [],
    );
  }

  /// `please verify your email`
  String get verifyYourEmail {
    return Intl.message(
      'please verify your email',
      name: 'verifyYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `TEMPLES`
  String get temples {
    return Intl.message(
      'TEMPLES',
      name: 'temples',
      desc: '',
      args: [],
    );
  }

  /// `The most important landmarks`
  String get landMark {
    return Intl.message(
      'The most important landmarks',
      name: 'landMark',
      desc: '',
      args: [],
    );
  }

  /// `The person`
  String get person {
    return Intl.message(
      'The person',
      name: 'person',
      desc: '',
      args: [],
    );
  }

  /// `The price`
  String get price {
    return Intl.message(
      'The price',
      name: 'price',
      desc: '',
      args: [],
    );
  }

  /// `Egyption Student`
  String get egyptionStudent {
    return Intl.message(
      'Egyption Student',
      name: 'egyptionStudent',
      desc: '',
      args: [],
    );
  }

  /// `Egyption`
  String get egyption {
    return Intl.message(
      'Egyption',
      name: 'egyption',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Forgein`
  String get forgein {
    return Intl.message(
      'Forgein',
      name: 'forgein',
      desc: '',
      args: [],
    );
  }

  /// `the music that play in background`
  String get musicThatPlayInBackground {
    return Intl.message(
      'the music that play in background',
      name: 'musicThatPlayInBackground',
      desc: '',
      args: [],
    );
  }

  /// `music`
  String get music {
    return Intl.message(
      'music',
      name: 'music',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `the application language`
  String get theApplicationLanguage {
    return Intl.message(
      'the application language',
      name: 'theApplicationLanguage',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete an account`
  String get doYouWantToDeleteAccount {
    return Intl.message(
      'Do you want to delete an account',
      name: 'doYouWantToDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `login with another way`
  String get loginWithanotherWay {
    return Intl.message(
      'login with another way',
      name: 'loginWithanotherWay',
      desc: '',
      args: [],
    );
  }

  /// `location`
  String get location {
    return Intl.message(
      'location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `open time`
  String get openTime {
    return Intl.message(
      'open time',
      name: 'openTime',
      desc: '',
      args: [],
    );
  }

  /// `close Time`
  String get closeTime {
    return Intl.message(
      'close Time',
      name: 'closeTime',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
