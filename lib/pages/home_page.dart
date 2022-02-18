import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone/pages/chat_page.dart';
import 'package:instagram_clone/theme/colors.dart';
import 'package:instagram_clone/util/new_feed_json.dart';
import 'package:instagram_clone/util/story_json.dart';

import '../util/constant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool likeButton = false;
  bool bookmarkButton = true;
  bool isHeartAnimating = false;
  bool isLiked = false;

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
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                "assets/images/logo.svg",
                width: 90,
              ),
              IconButton(
                splashRadius: 15,
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => ChatPage()));
                },
                icon: Icon(FontAwesome5Brands.facebook_messenger),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getBody(size) {
    return ListView(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(top: 5, left: 5, right: 5),
          child: Row(
            children: List.generate(
              stories.length,
              (index) => Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  width: 88,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          stories[index]['isStory']
                              ? Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: bgStoryColors,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      height: 70,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          width: 2,
                                          color: bgWhite,
                                        ),
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              stories[index]['imageUrl']),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: bgGrey,
                                      ),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            stories[index]['imageUrl']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                          stories[index]['isAdd']
                              ? Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    height: 20,
                                    width: 20,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: primary,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: bgWhite,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                        stories[index]['username'],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Divider(),
        Column(
          children: List.generate(newFeeds.length, (index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient:
                                        LinearGradient(colors: bgStoryColors),
                                  ),
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(width: 1, color: bgWhite),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                            newFeeds[index]['profile']),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  newFeeds[index]['username'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              FontAwesome.ellipsis_v,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                                              child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 400,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      NetworkImage(newFeeds[index]['imageUrl']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // Icon(FontAwesome.heart, color: bgWhite, size: 100),
                          ],
                        ),
                        // onDoubleTap: (){
                        //   setState(() {
                        //     isHeartAnimating = true;
                        //     isLiked = true;
                        //   });},
                        
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8.0,
                          right: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                IconButton(
                                    splashRadius: 15,
                                    onPressed: () {
                                      setState(() {
                                        likeButton = !likeButton;
                                      });
                                    },
                                    icon: likeButton
                                        ? Icon(
                                            FontAwesome5Solid.heart,
                                            color: Colors.red,
                                            size: 25,
                                          )
                                        : Icon(
                                            FontAwesome5.heart,
                                            size: 25,
                                          )),
                                IconButton(
                                  splashRadius: 15,
                                  onPressed: () {},
                                  icon: Icon(
                                    FontAwesome5.comment,
                                    size: 25,
                                  ),
                                ),
                                IconButton(
                                  splashRadius: 15,
                                  onPressed: () {},
                                  icon: Icon(
                                    FontAwesome5.paper_plane,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    bookmarkButton = !bookmarkButton;
                                  });
                                },
                                icon: bookmarkButton
                                    ? Icon(FontAwesome5.bookmark, size: 25)
                                    : Icon(FontAwesome5Solid.bookmark,
                                        size: 25)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15, left: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${newFeeds[index]['likes']} likes',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 3),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: newFeeds[index]['username'],
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  TextSpan(
                                    text: newFeeds[index]['caption'],
                                    style: TextStyle(height: 1.5),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              newFeeds[index]['comments'],
                              style: TextStyle(color: textGrey),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Container(
                                  width: (size.width - 30) * 0.7,
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 20,
                                        width: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              width: 1, color: bgGrey),
                                          image: DecorationImage(
                                            image: NetworkImage(profileAccount),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 25,
                                        width: (size.width - 70) * 0.7,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, left: 10, right: 10),
                                          child: TextField(
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: "Add a comment",
                                              hintStyle: TextStyle(
                                                color:
                                                    textBlack.withOpacity(0.5),
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: (size.width - 30) * 0.3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("🔥"),
                                      SizedBox(width: 10),
                                      Text("😍"),
                                      SizedBox(width: 10),
                                      Text("❤️"),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.add_circle_outline_rounded,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Text(
                              newFeeds[index]['dateTime'],
                              style: TextStyle(fontSize: 15, color: textGrey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
              ],
            );
          }),
        ),
      ],
    );
  }
}
