import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/pages/chat_detail_page.dart';
import 'package:instagram_clone/util/chat_detail_json.dart';

import '../theme/colors.dart';
import '../util/chat_json.dart';

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: getAppBar(),
      body: getBody(size),
      bottomSheet: getBottomSheet(size),
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new, color: textBlack),
                ),
                SizedBox(width: 10),
                Text(
                  "Chats",
                  style: TextStyle(
                      color: textBlack,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  splashRadius: 15,
                  icon: Icon(Feather.video),
                ),
                SizedBox(width: 5),
                IconButton(
                  onPressed: () {},
                  splashRadius: 15,
                  icon: Icon(Feather.edit),
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
        Column(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 45,
                  width: (size.width - 2) * 0.5,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });
                    },
                    child: Center(
                      child: Text(
                        'Chats',
                        style: TextStyle(
                            color: selectedIndex == 0
                                ? textBlack
                                : textBlack.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 45,
                  width: (size.width - 2) * 0.5,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    child: Center(
                      child: Text(
                        'Rooms',
                        style: TextStyle(
                            color: selectedIndex == 1
                                ? textBlack
                                : textBlack.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: (size.width) * 0.5,
                  height: 1,
                  decoration: BoxDecoration(
                      color:
                          selectedIndex == 0 ? textBlack : Colors.transparent),
                ),
                Container(
                  width: (size.width) * 0.5,
                  height: 1,
                  decoration: BoxDecoration(
                      color:
                          selectedIndex == 1 ? textBlack : Colors.transparent),
                ),
              ],
            ),
            Container(
              width: size.width,
              height: 1,
              decoration: BoxDecoration(
                color: bgGrey,
              ),
            ),
          ],
        ),
        IndexedStack(
          index: selectedIndex,
          children: [
            getChats(size),
            getRooms(size),
            getBottomSheet(size),
          ],
        ),
      ],
    );
  }

  Widget getChats(size) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 15, left: 10, right: 10),
          child: Container(
            height: 41,
            width: (size.width - 20),
            decoration: BoxDecoration(
              color: bgGrey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 5),
              child: TextField(
                cursorColor: textBlack,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon:
                      Icon(Icons.search, color: textBlack.withOpacity(0.5)),
                  hintText: "Search",
                  hintStyle: TextStyle(color: textBlack.withOpacity(0.5)),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Column(
          children: List.generate(
            chats.length,
            (index) => InkWell(
              onTap:() {
                Navigator.push(context, MaterialPageRoute(builder: (_) => ChatDetailPage()));
              },
                          child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8, top: 8, right: 10, bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: (size.width - 20) * 0.15,
                                  width: (size.width - 20) * 0.15,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: bgGrey,
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(chats[index]['profile']),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                chats[index]['online']
                                    ? Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          height: 16,
                                          width: 16,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: bgWhite),
                                            shape: BoxShape.circle,
                                            color: success,
                                          ),
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                                top: 8,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    chats[index]['username'],
                                    style: TextStyle(
                                        color: textBlack,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    "${chats[index]['description']} • ${chats[index]['dateTime']}",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: textBlack.withOpacity(0.5),
                                      height: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Icon(Feather.camera, color: textBlack.withOpacity(0.5)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        
      ],
    );
  }

  Widget getRooms(size) {
    return Center(
      child: Padding(
        padding: EdgeInsets.only(top: 30, left: 20, right: 20),
        child: Column(
          children: [
            SvgPicture.asset("assets/images/video.svg", width: 100),
            SizedBox(height: 20),
            Text(
              "Video Chat with Anyone",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),
            Text(
              "Invite upto 50 people to join a video chat, even if they don't have Instagram or Messenger.",
              style: TextStyle(
                fontSize: 14,
                height: 1.5,
                color: textBlack.withOpacity(0.8),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: primary,
              ),
              child: Center(
                child: Text(
                  "Create Room",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: textWhite,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBottomSheet(size) {
    if (selectedIndex == 0) {
      return Container(
        height: 60,
        decoration: BoxDecoration(
          color: bgLightGrey,
          border:
              Border(top: BorderSide(width: 1, color: bgGrey.withOpacity(0.3))),
        ),
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                FontAwesome.camera,
                color: primary,
              ),
              SizedBox(width: 10),
              Text(
                'Camera',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: primary,
                ),
              ),
            ],
          ),
        ),
      );
    } else
      return Container(height: 1);
  }
}
