import 'package:url_launcher/url_launcher_string.dart';

const String _repositoryURL = 'https://github.com/sunderee/collector';

Future<void> launchRepositoryURL() async {
  final canLaunch = await canLaunchUrlString(_repositoryURL);
  if (canLaunch) {
    await launchUrlString(_repositoryURL);
  }
}
