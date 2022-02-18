import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:instagram_clone/util/account_images_json.dart';

import '../theme/colors.dart';
import '../util/constant.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int lengthHighlights = 5;
  int selectedIndex = 0;
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
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Feather.lock,
                    size: 18,
                  ),
                  SizedBox(width: 10),
                  Text(
                    username,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    splashRadius: 15,
                    onPressed: () {},
                    icon: Icon(AntDesign.plus),
                  ),
                  IconButton(
                    splashRadius: 15,
                    onPressed: () {},
                    icon: Icon(FontAwesome.bars),
                  ),
                ],
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
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: (size.width - 20) * 0.3,
                    child: Stack(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 1, color: bgGrey),
                            image: DecorationImage(
                                image: NetworkImage(profileAccount),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 21,
                          child: Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primary,
                              border: Border.all(width: 1, color: bgWhite),
                            ),
                            child: Icon(
                              Icons.add,
                              color: bgWhite,
                              size: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: (size.width - 20) * 0.7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "10",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Posts",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "3,460",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "110",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Following",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Text(instagramName + " 🗿"),
              Text(instagramBio),
              SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    height: 35,
                    width: (size.width - 20) * 0.86,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: bgGrey),
                      borderRadius: BorderRadius.circular(5),
                      color: bgLightGrey,
                    ),
                    child: Center(
                      child: Text("Edit Profile",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(width: 7),
                  Container(
                    height: 35,
                    width: (size.width - 20) * 0.12,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: bgGrey),
                      borderRadius: BorderRadius.circular(5),
                      color: bgLightGrey,
                    ),
                    child: Center(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Feather.user_plus,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Story Highlights",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    FontAwesome.angle_up,
                    size: 20,
                  ),
                ],
              ),
              Text("Keep your favorite stories on your profile"),
              SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    width: (size.width - 20) * 1,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: bgWhite,
                                    shape: BoxShape.circle,
                                    border:
                                        Border.all(width: 1, color: bgGrey)),
                                child: Icon(Feather.plus, color: bgGrey),
                              ),
                              Text("New"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: List.generate(
                              lengthHighlights,
                              (index) => Padding(
                                padding: const EdgeInsets.only(top: 5, left: 8),
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  decoration: BoxDecoration(
                                      color: bgGrey,
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(width: 1, color: bgGrey)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: IconButton(
                      icon: Icon(FontAwesome.th, color: selectedIndex == 0 ? textBlack : textBlack.withOpacity(0.5)),
                      splashRadius: 15,
                      onPressed: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(FontAwesome.user_circle_o, color: selectedIndex == 1 ? textBlack : textBlack.withOpacity(0.5)),
                      splashRadius: 15,
                      onPressed: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                    height: 1,
                    width: size.width * 0.474,
                    decoration: BoxDecoration(
                      color: selectedIndex == 0 ? bgDark : Colors.transparent,
                    ),
                  ),
                  Container(
                    height: 1,
                    width: size.width * 0.474,
                    decoration: BoxDecoration(
                      color: selectedIndex == 0 ? Colors.transparent : bgDark,
                    ),
                  ),
                    ],
                  ),
                  Container(
                    height: 0.5,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: bgGrey.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 3,
        ),
        IndexedStack(
          index: selectedIndex,
          children: [
            getImages(size),
            getTagImages(size),
          ],
        ),
      ],
    );
  }

  Widget getImages(size) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 2,
      runSpacing: 2,
      children: List.generate(images.length, (index) => Container(
          height: 132,
          width: (size.width - 6) / 3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(images[index]),
              fit: BoxFit.cover,
            ),
          ),
        ),),
    );
  }

  Widget getTagImages(size) {
    return Wrap(
      direction: Axis.horizontal,
      spacing: 2,
      runSpacing: 2,
      children: List.generate(imageWithTags.length, (index) => Container(
          height: 132,
          width: (size.width - 6) / 3,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageWithTags[index]),
              fit: BoxFit.cover,
            ),
          ),
        ),),
    );
  }
}
