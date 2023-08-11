import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

const String imgsPath = "assets/imgs/";
const String myPhotoPath = "${imgsPath}my_photo.jpeg";
const String androidPath = "${imgsPath}android.png";
const String jetpackPath = "${imgsPath}jetpack_compose.png";
const String springBootPath = "${imgsPath}spring_boot.png";
const String flutterPath = "${imgsPath}flutter.png";

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
