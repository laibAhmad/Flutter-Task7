import 'package:flutter/material.dart';
import 'package:task7/callsList.dart';
import 'package:task7/screens/chat_person.dart';

class Chats extends StatefulWidget {
  const Chats({Key key}) : super(key: key);

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chats'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          separatorBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Divider(),
          ),
          itemCount: getCallsList().length,

          //listtile
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PersonChat(name: getCallsList()[index].name)));
            },
            child: ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.purple[100],
                child: Text(
                  getCallsList()[index].name.substring(0, 1),
                ),
              ),

              //name and time row
              title: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      getCallsList()[index].name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      getCallsList()[index].time,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
