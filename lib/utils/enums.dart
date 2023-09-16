enum Server{
  dev,
  prod
}

extension ServerExtension on Server{
  String get name{
    switch(this){
      case Server.dev:
        return 'DEVELOPMENT';
      case Server.prod:
        return 'PRODUCTION';
    }
  }
  //TODO: Replace URLs
  String get url{
    switch(this){
      case Server.dev:
        return 'https://www.abc.com';
      case Server.prod:
        return 'https://www.abc.com';
    }
  }
  //TODO: Replace signalingRUrls
  String get signalRURL{
    switch(this){
      case Server.dev:
        return 'https://www.abc.com';
      case Server.prod:
        return 'https://www.abc.com';
    }
  }
}

enum NotificationStatus{
  read,
  unread,
}

extension NotificationStatusExtension on NotificationStatus{
  int get value{
    switch(this){
      case NotificationStatus.read:
        return 1;
      case NotificationStatus.unread:
        return 0;
    }
  }
}