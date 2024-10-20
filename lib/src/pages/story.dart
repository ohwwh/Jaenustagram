import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:jaenuestagram/src/components/avatar.dart';
import 'package:jaenuestagram/src/components/image_data.dart';
import 'package:jaenuestagram/src/components/likebutton.dart';
import 'package:jaenuestagram/src/pages/dosscreen.dart';

class Story extends StatefulWidget {
  Story({Key? key, required this.avatarWidget, required this.imageUrl, required this.isSecret}) : super(key: key);

  final AvatarWidget avatarWidget;
  final String imageUrl;
  bool isSecret = false;

  @override
  _StoryState createState() => _StoryState(avatarWidget: avatarWidget, imageUrl: imageUrl, isSecret: isSecret);
}

class _StoryState extends State<Story> {
  _StoryState({required this.avatarWidget, required this.imageUrl, this.isSecret = false});
  final AvatarWidget avatarWidget;
  final String imageUrl;
  ImageData currentIcon = ImageData(IconsPath.activeOff, isContrast: true, width: 100);
  bool isLiked = false;
  bool isSecret;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            // 1. 사진이 있고
            Positioned.fill(
              child: ClipRRect(
                //borderRadius: BorderRadius.circular(15.0),
                child: isSecret ? DosScreen() : CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => Container(
                      color: Colors.black,
                      height: 250,
                      width: double.infinity,
                      child: Center(
                        child: Text(
                          'Image load error: $error',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                ),
              ),
            ),
            // 2. 죄측 상단에는 AvatarWidget과 닉네임이 뜨고
            Positioned(
              top: 30,
              left: 10,
              child: Row(
                children: [
                  SizedBox(
                    width: avatarWidget.size! * 0.8,
                    height: avatarWidget.size! * 0.8,
                    child: avatarWidget,
                  ),
                  const SizedBox(width: 10),
                  // Positioned 제거
                  Text(
                    avatarWidget.nickname ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // 우측 상단에는 세로로 점 3개가 띡띡 찍혀 있는 화면
            Positioned(
              top: 30,
              right: 1,
              child: IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Handle more options
                },
              ),
            ),
            Positioned(
              top: 20, // 흰 줄의 위치
              left: 0,
              right: 0,
              child: Container(
                height: 2.0, // 원하는 높이 설정
                color: Colors.white.withOpacity(0.5), // 흰색 줄
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: ImageData(
                        IconsPath.replyIcon,
                        isContrast: true,
                        width: 100,
                      ),
                      onPressed: () {
                        // Handle camera icon press
                      },
                    ),
                    Flexible(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 300),
                        child: TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: '  메시지 입력',
                            hintStyle: const TextStyle(color: Colors.white),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25.0),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Likebutton(isContrast: true,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
