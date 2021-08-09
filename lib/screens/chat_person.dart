import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task7/Lists/msgList.dart';

class PersonChat extends StatefulWidget {
  const PersonChat({Key key, this.name}) : super(key: key);
  final String name;

  @override
  _PersonChatState createState() => _PersonChatState();
}

class _PersonChatState extends State<PersonChat> {
  TextEditingController myController = TextEditingController();
  Color clr = Colors.purple[100];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
      ),
      body: Column(
        children: [
          //msg area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: msgArea(size),
            ),
          ),
          msgRow(size),
        ],
      ),
    );
  }

  ListView msgArea(Size size) {
    return ListView.separated(
        physics: BouncingScrollPhysics(),

        //seprator
        separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
            ),
        itemCount: msg.length,

        //containers
        itemBuilder: (context, index) => Align(
              alignment: FractionalOffset.topRight,
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: size.width * 0.7,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                  color: Colors.purple[50],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    msg[index],
                  ),
                ),
              ),
            ));
  }

  Container msgRow(Size size) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      width: size.width,
      height: size.height * 0.1,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 1,
            color: Colors.grey[200],
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //msg enter field
          Container(
            width: size.width * 0.8,
            child: TextField(
              onChanged: (text) {
                setState(() {
                  myController.value != null
                      ? clr = Colors.purple
                      : clr = Colors.purple[100];
                });
              },
              controller: myController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                hintText: 'Type Message Here..',
              ),
            ),
          ),

          //send button
          GestureDetector(
            onTap: () {
              if (myController.text.isEmpty == false) {
                setState(() {
                  msg.add(myController.text);
                  myController.clear();
                  clr = Colors.purple[100];
                });
              }
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: clr,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.send_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
