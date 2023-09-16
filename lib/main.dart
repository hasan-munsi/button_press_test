import 'dart:math';

import 'package:button_test_web/constants/app_constants.dart';
import 'package:button_test_web/controllers/custom_notifications_state_controller.dart';
import 'package:button_test_web/utils/enums.dart';
import 'package:button_test_web/views/components/notification_counter.dart';
import 'package:button_test_web/widgets/common_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'models/custom_notification.dart';
import 'services/signal_r_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDefault().then((_) => runApp(const MyApp()));
}

Future initDefault() async {
  ///Initialize services
  Get.put(SignalRService());
  ///Initialize controllers
  Get.put(CustomNotificationStateController());

  ///Start listening to server notification
  final SignalRService signalRService = Get.find();
  signalRService.startListening(functionName: AppConstants.notificationChannelName);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Button press demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Poke home page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: const [
          NotificationCounter(),
          SizedBox(width: 20),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have poked me this many times',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 40,
            ),
            CommonButton(
              text: 'Poke me',
              onPressed: _incrementCounter,
              autoFocus: true,
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
