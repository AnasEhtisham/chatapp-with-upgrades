import 'package:flutter/material.dart';
import '../models/chatUsersModel.dart';
import '../widgets/conversationList.dart';
import 'screens/chatDetailPage.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatUsers> chatUsers = [
    ChatUsers(name: "Umair", messageText: "Assignment bhj bahi", imageURL: "assets/umair.jpg", time: "Now"),
    ChatUsers(name: "Adeel Choi Sab", messageText: "Postal Colony isb ka hissa ha maan le", imageURL: "assets/adeel.jpg", time: "Yesterday"),
    ChatUsers(name: "Shahzaib Khalil", messageText: "Hey where are you? You missed the venue...", imageURL: "assets/shahzy.jpg", time: "31 Mar"),
    ChatUsers(name: "Basil", messageText: "Bahi maan le mai nerd ni hoo", imageURL: "assets/basil.jpg", time: "28 Mar"),
    ChatUsers(name: "P Diddy", messageText: "I've got special discounts on baby oil..", imageURL: "assets/p diddy.jpg", time: "23 Mar"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Conversations",
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blueGrey[50],
                      ),
                      // child: Row(
                      //   children: <Widget>[
                      //     Icon(Icons.add, color: Colors.blueGrey, size: 20),
                      //     SizedBox(width: 2),
                      //     Text(
                      //       "Add New",
                      //       style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      //     ),
                      //   ],
                      // ),
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(top: 16, left: 16, right: 16),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       hintText: "Search...",
            //       hintStyle: TextStyle(color: Colors.grey.shade600),
            //       prefixIcon: Icon(Icons.search, color: Colors.grey.shade600, size: 20),
            //       filled: true,
            //       fillColor: Colors.grey.shade100,
            //       contentPadding: EdgeInsets.all(8),
            //       enabledBorder: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(20),
            //         borderSide: BorderSide(color: Colors.grey.shade100),
            //       ),
            //     ),
            //   ),
            // ),
            ListView.builder(
              itemCount: chatUsers.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigate to ChatDetailPage with name and imageUrl passed correctly
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => ChatDetailPage(
                          name: chatUsers[index].name,
                          imageUrl: chatUsers[index].imageURL,
                        ),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                      ),
                    );
                  },
                  child: ConversationList(
                    name: chatUsers[index].name,
                    messageText: chatUsers[index].messageText,
                    imageUrl: chatUsers[index].imageURL,
                    time: chatUsers[index].time,
                    isMessageRead: (index == 0 || index == 3),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
