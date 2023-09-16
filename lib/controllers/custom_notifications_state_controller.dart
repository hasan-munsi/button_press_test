import 'package:button_test_web/models/custom_notification.dart';
import 'package:button_test_web/utils/enums.dart';
import 'package:get/get.dart';

class CustomNotificationStateController extends GetxController{

  static const String kCustomNotificationIdMapKey = 'kCustomNotificationIdMapKey';
  ///Custom notification id: Custom notification
  final Map<int, CustomNotification> _customNotificationIdMap = {};

  ///Returns all notifications
  List<CustomNotification> getAllNotifications(){
    return _customNotificationIdMap.values.toList();
  }

  ///returns all notifications by status Read/Unread
  List<CustomNotification> getNotificationsByStatus({required NotificationStatus notificationStatus}){
    return getAllNotifications().where((element) => element.status==notificationStatus.value).toList();
  }

  ///Add new notification into map Read/Unread
  void addNewNotification({required CustomNotification customNotification, bool withUpdate = false}){
    _customNotificationIdMap.addAll({(customNotification.id??-1): customNotification});
    if(withUpdate){
      update([kCustomNotificationIdMapKey]);
    }
  }
}