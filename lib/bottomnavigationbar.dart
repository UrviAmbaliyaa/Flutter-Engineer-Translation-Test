import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/Pages/Favorite.dart';
import 'package:demo/Pages/Search.dart';
import 'package:demo/Pages/profile.dart';

import 'Pages/Home.dart';
import 'Pages/chat.dart';

class bottomnavigationbar extends StatefulWidget {
  const bottomnavigationbar({super.key});

  @override
  State<bottomnavigationbar> createState() => _bottomnavigationbarState();
}

class _bottomnavigationbarState extends State<bottomnavigationbar> {
  int _SelectedTab = 2;
  List navibarIcons = [CupertinoIcons.map,Icons.message,CupertinoIcons.home,Icons.favorite,Icons.person];
  List navibarpages = [MapWidget(),chat(),HomePageWidget(),Favorite(),profile()];
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            navibarpages[_SelectedTab],
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                margin: EdgeInsets.only(left: 30,right: 30,bottom: 30),
                decoration: BoxDecoration(
                    color: Color(0xFF2b2b2b),
                    borderRadius: BorderRadius.circular(50)
                ),
                clipBehavior: Clip.antiAlias,
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(navibarIcons.length, (index) =>
                      InkWell(
                        onTap: () => setState(() {
                          _SelectedTab = index;
                        }),
                        child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _SelectedTab == index? Color(0xFFFC9E12) : Colors.black,
                          ),
                          padding: EdgeInsets.all(5),
                          child: Icon(navibarIcons[index],color:  Colors.white,size: 25,),
                        ),
                      ),
                  ),
                ),
              ),

            )
          ],
        ),
      ),
    );
  }
}
