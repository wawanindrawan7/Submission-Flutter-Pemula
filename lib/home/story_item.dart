import 'package:flutter/material.dart';

class StoryItem extends StatelessWidget {
  const StoryItem({Key? key, required this.imgAvatar, required this.title})
      : super(key: key);

  final String imgAvatar;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                image: DecorationImage(
                    image: AssetImage(imgAvatar), fit: BoxFit.fill)),
          ),
          Container(
            margin: EdgeInsets.only(top: 3),
            child: Text(title),
          )
        ],
      ),
    );
  }
}
