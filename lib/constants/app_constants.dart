import 'package:button_test_web/utils/enums.dart';

class AppConstants{
  static const Server _kCurrentServer = Server.prod;
  static final String kSignalRUrl = _kCurrentServer.signalRURL;
  static const String notificationChannelName = 'serve_notification_channel';
}