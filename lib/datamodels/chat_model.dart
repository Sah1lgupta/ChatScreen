class ChatMessage {
  final String userId;
  final String profileImage;
  final String userName;
  final String message;
  final String timeSent;
  final bool hasNewStatus;

  ChatMessage({
    required this.userId,
    required this.profileImage,
    required this.userName,
    required this.message,
    required this.timeSent,
    required this.hasNewStatus,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      userId: json['userId'],
      profileImage: json['profileImage'],
      userName: json['userName'],
      message: json['message'],
      timeSent: json['timeSent'],
      hasNewStatus: json['hasNewStatus'],
    );
  }
}