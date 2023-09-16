/// id : 1
/// title : "Test notification"
/// body : "This is a test notification"
/// status : 0

class CustomNotification {
  CustomNotification({
    this.id,
    this.title,
    this.body,
    this.status,
  });

  CustomNotification.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    body = json['body'];
    status = json['status'];
  }

  int? id;
  String? title;
  String? body;
  int? status;

  CustomNotification copyWith({
    int? id,
    String? title,
    String? body,
    int? status,
  }) =>
      CustomNotification(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        status: status ?? this.status,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    map['status'] = status;
    return map;
  }
}
