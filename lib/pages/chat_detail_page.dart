import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import 'package:instagram_clone/theme/colors.dart';
import 'package:instagram_clone/util/constant.dart';

import '../util/chat_detail_json.dart';
import '../util/chat_json.dart';

class ChatDetailPage extends StatefulWidget {
  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(size),
    );
  }

  Widget getAppBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(55),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  splashRadius: 20,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: textBlack,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 33,
                  width: 33,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: bgGrey,
                    border: Border.all(width: 1, color: bgWhite),
                    image: DecorationImage(
                      image: NetworkImage(chats[0]['profile']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  chats[0]['username'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  splashRadius: 20,
                  onPressed: () {},
                  icon: Icon(Feather.video),
                ),
                SizedBox(width: 5),
                IconButton(
                  splashRadius: 20,
                  onPressed: () {},
                  icon: Icon(Feather.info),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody(size) {
    return ListView(
      children: [
        Container(
          height: size.height * 0.83,
          child: ListView(
            children: List.generate(
              chatDetails.length,
              (index) => Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: ChatBars(
                  isMe: chatDetails[index]['isMe'],
                  profile: chatDetails[index]['profile'],
                  message: chatDetails[index]['message'],
                  messageNo: chatDetails[index]['messageNo'],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 10, right: 10, bottom: 10, top: 5),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: bgGrey.withOpacity(0.5),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Container(
                      width: (size.width - 20) * 0.1,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primary,
                      ),
                      child: Center(
                        child: Icon(
                          FontAwesome.camera,
                          color: textWhite,
                          size: 20,
                        ),
                      ),
                    ),
                    Container(
                      width:(size.width - 40) * 0.6,
                      child: TextField(
                        cursorColor: textBlack.withOpacity(0.5),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: " Message....",
                          hintStyle: TextStyle(fontSize: 16, color: textBlack.withOpacity(0.5)),

                        ),
                      ),
                    ),
                    Container(
                      width: (size.width - 40) * 0.3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(SimpleLineIcons.microphone),
                          Icon(Feather.image),
                          Icon(MaterialCommunityIcons.sticker_emoji),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ChatBars extends StatelessWidget {
  final bool isMe;
  final String profile, message;
  final int messageNo;

  const ChatBars({
    Key key,
    this.isMe,
    this.message,
    this.messageNo,
    this.profile,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (!isMe) {
      return Padding(
        padding: const EdgeInsets.only(top: 1.5, bottom: 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            messageNo != 1
                ? Container(
                    height: 33,
                    width: 33,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(chatDetails[1]['profile']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Container(),
            SizedBox(width: 10),
            messageNo != 1
                ? Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 75,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: getBorderRadiusMessage(messageNo),
                          color: bgGrey.withOpacity(0.3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            message,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  )
                : Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 75, left: 32),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: getBorderRadiusMessage(messageNo),
                          color: bgGrey.withOpacity(0.3),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            message,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 1.5, bottom: 1.5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: getBorderRadiusMessage(messageNo),
                color: bgGrey.withOpacity(0.8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  message,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  BorderRadius getBorderRadiusMessage(messageNo) {
    if (!isMe) {
      if (messageNo == 1) {
        return BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20));
      } else if (messageNo == 2) {
        return BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(5),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20));
      } else if (messageNo == 3) {
        return BorderRadius.only(
            topLeft: Radius.circular(5),
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(20));
      } else
        return BorderRadius.circular(20);
    } else {
      if (messageNo == 1) {
        return BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomRight: Radius.circular(5));
      } else if (messageNo == 2) {
        return BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(5));
      } else if (messageNo == 3) {
        return BorderRadius.only(
            topLeft: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            topRight: Radius.circular(5),
            bottomRight: Radius.circular(20));
      } else
        return BorderRadius.circular(20);
    }
  }
}
