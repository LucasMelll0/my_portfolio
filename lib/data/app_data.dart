import 'package:my_portifolio/model/social_network.dart';
import 'package:my_portifolio/res/strings.dart';
import 'package:my_portifolio/utils/assets.dart';

import '../model/project.dart';
import '../model/technology.dart';

abstract class AppData {
  static List<SocialNetwork> socialNetworks = [
    SocialNetwork(
      "https://github.com/LucasMelll0",
      "https://img.icons8.com/material-rounded/308/ffffff/github.png",
    ),
    SocialNetwork(
      "https://www.linkedin.com/in/lucas-mello-a43887188/",
      "https://img.icons8.com/metro/400/ffffff/linkedin.png",
    )
  ];

  static const List<Technology> mainTechnologies = [
    Technology(androidPath, StringRes.androidTechnologyTitle,
        StringRes.androidTechnologyDescription),
    Technology(jetpackPath, StringRes.jetpackComposeTitle,
        StringRes.jetpackComposeDescription),
    Technology(
        flutterPath, StringRes.flutterTitle, StringRes.flutterDescription),
    Technology(springBootPath, StringRes.springBootTitle,
        StringRes.springBootDescription)
  ];

  static List<Project> mainProjects = [
    Project(gymLogPath, StringRes.gymLogTitle, StringRes.gymLogDescription,
        StringRes.gymLogRepoUrl, gymLogPresentationPath),
    Project(
        valorantWikiPath,
        StringRes.valorantWikiTitle,
        StringRes.valorantWikiDescription,
        StringRes.valorantWikiRepoUrl,
        valorantWikiPresentationPath),
    Project(
        musicPlayerPath,
        StringRes.musicPlayerTitle,
        StringRes.musicPlayerDescription,
        StringRes.musicPlayerRepoUrl,
        musicPlayerPresentationPath),
    Project(
        myCookBookPath,
        StringRes.myCookBookTitle,
        StringRes.myCookBookDescription,
        StringRes.myCookBookRepoUrl,
        myCookBookPresentationPath),
    Project(
        springBootPath,
        StringRes.valorantMapsApiTitle,
        StringRes.valorantMapsApiDescription,
        StringRes.valorantMapsApiRepoUrl,
        null),
    Project(flutterPath, StringRes.portfolioTitle,
        StringRes.portfolioDescription, StringRes.portfolioRepoUrl, null)
  ];
}
