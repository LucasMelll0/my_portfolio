import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

const String imgsPath = "assets/imgs/";
const String myPhotoPath = "${imgsPath}my_photo.jpeg";
const String androidPath = "${imgsPath}android.png";
const String jetpackPath = "${imgsPath}jetpack_compose.png";
const String springBootPath = "${imgsPath}spring_boot.png";
const String flutterPath = "${imgsPath}flutter.png";
const String gymLogPath = "${imgsPath}gymlog.png";
const String gymLogPresentationPath = "${imgsPath}gym_log_presentation.png";
const String musicPlayerPath = "${imgsPath}music_player.png";
const String musicPlayerPresentationPath = "${imgsPath}my_music_player_presentation.png";
const String myCookBookPath = "${imgsPath}mycookbook.png";
const String myCookBookPresentationPath = "${imgsPath}my_cook_book_presentation.png";
const String valorantWikiPath = "${imgsPath}valorant_wiki.png";
const String valorantWikiPresentationPath = "${imgsPath}valorant_wiki_presentation.png";


Future<Image> loadImageAsset(String path,
    {double? width, double? height, BoxFit? fit}) async {
  return Image.asset(
    path,
    fit: fit ?? BoxFit.cover,
    width: width,
    height: height,
  );
}

Future<void> launchUrlFromString(String url) async {
  Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception("Could not launch $url");
  }
}
