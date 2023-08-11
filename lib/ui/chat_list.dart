import 'package:flutter/material.dart';
import 'package:untitled1/datamodels/chat_model.dart';

import '../apis/chat_api.dart';
import '../widgets/chat_screen_widget.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({ Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {



  List<ChatMessage>? chatList=null;




  @override
  void setState(VoidCallback fn) {
    chatList;
    super.setState(fn);
  }





  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Chat app'),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search))
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text('Personal Chats',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.w500),),
                ],
              ),
               SizedBox(height: 5,),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                height: MediaQuery.of(context).size.height * 0.84,
                child: FutureBuilder<List<ChatMessage>>(
                  future: ChatApiService.fetchData(),
                  builder: (context, snapshot) {

    if (snapshot.connectionState == ConnectionState.waiting) {
    return CircularProgressIndicator();
    } else if (snapshot.hasError) {
    return Text('Error: ${snapshot.error}');
    } else {

      if(snapshot.data.toString().isNotEmpty){

        chatList = snapshot.data;


        return  ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (context, index) =>customListTile(chatList![index]),


        );
      }
      return  Center(child:  CircularProgressIndicator());

    }



                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }
}
