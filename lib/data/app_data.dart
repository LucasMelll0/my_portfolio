import 'package:my_portifolio/res/strings.dart';
import 'package:my_portifolio/utils/assets.dart';

import '../model/technology.dart';

abstract class AppData {
  static const List<Technology> mainTechnologies = [
    Technology(androidPath, StringRes.androidTechnologyTitle,
        StringRes.androidTechnologyDescription),
    Technology(jetpackPath, StringRes.jetpackComposeTitle,
        StringRes.jetpackComposeDescription),
    Technology(flutterPath, StringRes.flutterTitle, StringRes.flutterDescription),
    Technology(springBootPath, StringRes.springBootTitle,
        StringRes.springBootDescription)
  ];
}
