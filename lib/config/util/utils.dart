import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void openInstagramProfile(String username) async {
    final url = Uri.parse("https://www.instagram.com/$username");

    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
