class MessageModel {
  String senderId;
  String receiverId;
  String dateTime;
  String text;

  MessageModel({
    this.receiverId,
    this.senderId,
    this.dateTime,
    this.text,

  });

  MessageModel.fromJson(Map<String, dynamic> json)
  {
    receiverId = json['receiverId'];
    dateTime = json['dateTime'];
    text = json['text'];
    senderId = json['senderId'];
  }

  Map<String, dynamic> toMap()
  {
    return {
      'senderId':senderId,
      'receiverId':receiverId,
      'text':text,
      'dateTime':dateTime,
    };
  }
}