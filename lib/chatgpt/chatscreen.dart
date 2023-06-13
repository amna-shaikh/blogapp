import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'chatmessagesscreen.dart';
import 'message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}
Future<String> generateResponse(String prompt) async {
  const apikey ="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";
  var url = Uri.https("api.openai.com" , "/v1/completions");
  final response = await http.post(
    url,
    headers: {
  "Content-Type" : "application/json",
   "Authorization" : "Bearer $apikey"
  },
    body: json.encode({
      "model": "text-davinci-003",
      "prompt": prompt,
      "temperature": 1,
      "max_tokens": 4000,
      "top_p":1,
      "frequency_penalty":0.0,
      "presence_penalty":0.0
    }),

  );
  Map<String,dynamic> newresponse = jsonDecode(response.body);
  return newresponse["choices"][0]["text"];
}

class _ChatScreenState extends State<ChatScreen> {

  final textController = TextEditingController();
  final scrollController = ScrollController();
  final List<ChatMessage> messages = [];
  late bool isLoading= false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoading = false;
    
  }
  void scrollsown(){
    scrollController.animateTo(
        scrollController.position.maxScrollExtent,
         duration: Duration(milliseconds: 300), curve: Curves.easeOut);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: Text("AI"),
            backgroundColor: Color.fromRGBO(16, 163, 167, 1),
            elevation: 0,
            centerTitle: true,
          ),
      body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: messages.length,
                      itemBuilder: (context  ,index){
                        var message;
                      if(index==0){}
                      else{ message = messages[index];}
                        return WidgetChatMessage(text: message.text, chatMessageType:message.chatMessageType);
                        
                      })),
               Visibility(
                   visible: isLoading,
                   child: Padding(padding: EdgeInsets.all(8),
               child: CircularProgressIndicator(
                 color: Colors.white,
               ),

               )),
        Padding(padding: EdgeInsets.all(8),
          child: Row(
            children: [
              Expanded(child: TextField(
                textCapitalization: TextCapitalization.sentences,
                controller: textController,
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  fillColor: Color(0xff4444654),
                  focusedBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none
                ),
              )),
              Visibility(
                  visible: !isLoading,
                  child: Container(
                    color: Color(0xff4444654),
                    child: IconButton(onPressed: ()async {
                      setState(() {
                        messages.add(ChatMessage(text: textController.text,
                            chatMessageType: ChatMessageType.user),
                        );
                        isLoading = true;
                      });
                      var input = textController.text;
                     // textController.clear();
                      Future.delayed(Duration(milliseconds: 50)).then((_) => scrollsown());
                      generateResponse(input).then((value) {
                        setState(() {
                          isLoading = false;
                          messages.add(
                              ChatMessage(text: value,
                                  chatMessageType: ChatMessageType.bot)
                          );
                        });
                      });
                      textController.clear();
                      Future.delayed(Duration(milliseconds: 50)).then((_) => scrollsown());





                    }, icon: Icon(Icons.send_rounded)),
                  ))
            ],
          ),



        )

            ],
          )

      ),
    );
  }
}
