import 'dart:math';

import 'package:button_test_web/constants/app_constants.dart';
import 'package:button_test_web/controllers/custom_notifications_state_controller.dart';
import 'package:button_test_web/models/custom_notification.dart';
import 'package:button_test_web/utils/enums.dart';
import 'package:button_test_web/utils/my_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:signalr_netcore/signalr_client.dart';

class SignalRService extends GetxService {
  HubConnection? hubConnection;

  Future connect() async {
    try {
      // Creates the connection by using the HubConnectionBuilder.
      hubConnection = HubConnectionBuilder().withUrl(AppConstants.kSignalRUrl).build();
      await hubConnection?.start();
    } catch (e) {
      if (kDebugMode) {
        MyLogger.log.e(e);
      }
    }
  }

  Future startListening({required String functionName}) async {
    try {
      await connect();
      hubConnection!.on(functionName, _handleAClientProvidedFunction);
    } catch (e) {
      if (kDebugMode) {
        MyLogger.log.e(e);
      }
    }
  }

  _handleAClientProvidedFunction(List? eventData) {
    try {
      if (eventData != null) {
        final CustomNotificationStateController customNotificationStateController = Get.find();
        //TODO: Build notification from event data
        customNotificationStateController.addNewNotification(
          customNotification: CustomNotification(
            id: Random().nextInt(999999),
            title: 'Custom notification',
            body: 'Custom notification body',
            status: NotificationStatus.unread.value,
          ),
          withUpdate: true,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        MyLogger.log.e(e);
      }
    }
  }
}
