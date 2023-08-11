import 'package:flutter/material.dart';
import 'package:untitled1/datamodels/chat_model.dart';


Widget customListTile(ChatMessage chatList) {
  final timestamp = DateTime.parse(chatList.timeSent);
  final formattedTime = '${timestamp.hour}:${timestamp.minute.toString().padLeft(2, '0')} ${timestamp.hour >= 12 ? 'PM' : 'AM'}';

  return  ListTile(
    leading:CircleAvatar(
      backgroundImage: NetworkImage(chatList.profileImage),
      radius: 25.0,
      backgroundColor: Colors.transparent, // Add this line
    ),
    title: Text("${chatList.userName}"),
    subtitle: Text('${chatList.message}'),
    trailing: Text('${formattedTime}',style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey),),
  );
}
