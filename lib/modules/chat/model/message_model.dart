class MessageModel {
  MessageModel({this.user, this.message});

  final String? user;
  String? message;

  Map<String, dynamic> toJson() {
    return {
      'user': user,
      'message': message,
    };
  }

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    user: json['user'],
    message: json['message'],
  );
}