import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petapp/Page/Home.dart';
import 'package:petapp/model/Pet.dart';

import '../petInsert/pet_api.dart';
import 'package:petapp/Page/petlist/petList_cat.dart';
import 'package:petapp/Page/petlist/petList_dog.dart';
import 'package:petapp/Page/petlist/petList_mouse.dart';
import 'package:petapp/Page/petlist/petList_others.dart';

class PetOverview extends StatefulWidget {
  @override
  _PetOverview createState() => _PetOverview();
}

class _PetOverview extends State<PetOverview> {
  PetRepository repository = PetRepository();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '寵物總覽',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.menu),
              tooltip: 'menu',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('This is a menu')));
              },
            ),
          ],
        ),
        body: Scrollbar(
            thumbVisibility: true,
            child: ListView.builder(
                primary: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      ...List.generate(
                        OverViewNavs.length,
                            (index) => Center(
                          child: Container(
                            margin: EdgeInsets.only(
                                left: 25, top: 30, right: 25, bottom: 0),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                padding: EdgeInsets.zero, // 去除內部填充
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(15.0), // 設置圓角
                                ),
                                elevation: 0,
                                backgroundColor: Colors.transparent, // 設置背景為透明
                              ),
                              child: AspectRatio(
                                aspectRatio: 31 / 18,
                                child: Ink.image(
                                  image: AssetImage(
                                      OverViewNavs[index].src), // 按鈕背景圖片
                                  fit: BoxFit.cover, // 圖片填充方式
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        OverViewNavs[index].route
                                      );
                                      // 按鈕點擊事件處理
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                })));
  }
}
class OverViewAsset {
  final String src;
  final Route route;
  final String type;
  OverViewAsset(this.src,this.type,
      {required this.route});
}

List<OverViewAsset> OverViewNavs = [
  OverViewAsset("assets/images/dog_type.png",
      route: MaterialPageRoute(builder: (context) => PetList_dog())),
  OverViewAsset("assets/images/cat_type.png",
      route: MaterialPageRoute(builder: (context) => PetList_cat())),
  OverViewAsset("assets/images/mouse_type.png",
      route: MaterialPageRoute(builder: (context) => PetList_mouse())),
  OverViewAsset("assets/images/other_type.png",
      route: MaterialPageRoute(builder: (context) => PetList_others())),
  OverViewAsset("assets/images/dog_type.png","dog",
      route: MaterialPageRoute(builder: (context) => HomePage())),
  OverViewAsset("assets/images/cat_type.png","cat",
      route: MaterialPageRoute(builder: (context) => HomePage())),
  OverViewAsset("assets/images/mouse_type.png","mouse",
      route: MaterialPageRoute(builder: (context) => HomePage())),
  OverViewAsset("assets/images/other_type.png","other",
      route: MaterialPageRoute(builder: (context) => HomePage())),
];
