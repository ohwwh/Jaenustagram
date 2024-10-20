import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaenuestagram/src/components/image_data.dart';
import 'package:jaenuestagram/src/pages/dosscreen.dart';

import '../pages/story.dart';

enum AvatarType { TYPE1, TYPE2, TYPE3, TYPE4 }

class AvatarWidget extends StatelessWidget {
  bool? hasStory;
  String thumbPath;
  String imageUrl;
  String? nickname;
  AvatarType type;
  double? size;
  bool isSecret;

  AvatarWidget ({
    Key? key,
    this.hasStory,
    required this.thumbPath,
    this.nickname,
    required this.type,
    this.size = 65,
    this.isSecret = false,
    this.imageUrl = ''
  }) : super(key: key);

  Widget type1Widget(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.all(2),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.purple, Colors.orange]
        ),
        shape: BoxShape.circle
      ),
      child: type2Widget()
    );
  }

  Widget type2Widget () {
      return Container(
          padding: const EdgeInsets.all(2),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(size!),
              child: SizedBox(
                  width: size,
                  height: size,
                  child: ImageData(
                      thumbPath, isFit: true
                  )
              )
          )
      );
  }

  Widget type3Widget(){
    return Row(
      children: [
        type1Widget(),
        Text(
          nickname??'',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          )
        )
      ]
    );
  }

  Widget type4Widget(String? nickname, String imageUrl){
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(2),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.purple, Colors.orange]
            ),
            shape: BoxShape.circle
        ),
      child: GestureDetector(
        onTap: () {
          Get.to(() => Story(avatarWidget: this,
              imageUrl: imageUrl,
              isSecret: isSecret));
        },
        child: type2Widget(),
      ),
    );
  }

  @override
  Widget build(BuildContext context){
    switch (type){
      case AvatarType.TYPE1:
        return type1Widget();
      case AvatarType.TYPE2:
        return type2Widget();
      case AvatarType.TYPE3:
        return type3Widget();
      case AvatarType.TYPE4:
        return type4Widget(nickname, imageUrl);
    }
    return Container();
  }
}