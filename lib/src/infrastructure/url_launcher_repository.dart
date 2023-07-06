import 'package:url_launcher/url_launcher.dart' as url_launcher;

class UrlLauncherService {
  Future<void> launchUrl(String url) async {
    final uri = Uri.parse(url);
    bool canLaunch = await url_launcher.canLaunchUrl(uri);
    if (canLaunch) {
      await url_launcher.launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }
}
