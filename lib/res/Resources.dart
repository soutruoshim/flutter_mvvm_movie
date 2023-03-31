import 'package:flutter/cupertino.dart';
import 'package:flutter_mvvm_movie/res/strings/FrenchStrings.dart';
import 'package:flutter_mvvm_movie/res/strings/Strings.dart';


import 'colors/AppColors.dart';
import 'dimentions/AppDimension.dart';
import 'strings/EnglishStrings.dart';

class Resources {
  BuildContext _context;

  Resources(this._context);

  Strings get strings {
    // It could be from the user preferences or even from the current locale
    Locale locale = Localizations.localeOf(_context);
    switch (locale.languageCode) {
      case 'fr':
        return FrenchStrings();
      default:
        return EnglishStrings();
    }
  }

  AppColors get color {
    return AppColors();
  }

  AppDimension get dimension {
    return AppDimension();
  }

  static Resources of(BuildContext context){
    return Resources(context);
  }
}