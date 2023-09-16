import 'package:button_test_web/constants/app_colors.dart';
import 'package:button_test_web/controllers/custom_notifications_state_controller.dart';
import 'package:button_test_web/models/custom_notification.dart';
import 'package:button_test_web/styles/app_text_styles.dart';
import 'package:button_test_web/utils/enums.dart';
import 'package:button_test_web/widgets/generic_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationCounter extends StatelessWidget {
  const NotificationCounter({super.key});

  @override
  Widget build(BuildContext context) {
    final CustomNotificationStateController customNotificationStateController = Get.find();
    return Container(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const Icon(Icons.notifications),
          Positioned(
            top: -5,
            right: -5,
            child: GetBuilder<CustomNotificationStateController>(
              init: customNotificationStateController,
              id: CustomNotificationStateController.kCustomNotificationIdMapKey,
              builder: (controller) {
                final List unreadNotifications = controller.getNotificationsByStatus(notificationStatus: NotificationStatus.unread);
                final int unreadNotificationsCount = unreadNotifications.length;
                if (unreadNotificationsCount > 0) {
                  return Container(
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      color: AppColors.kDanger,
                      shape: BoxShape.circle,
                    ),
                    child: GenericText(
                      text: '$unreadNotificationsCount',
                      style: AppTextStyles.normalText.copyWith(
                        color: AppColors.kFair,
                      ),
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
