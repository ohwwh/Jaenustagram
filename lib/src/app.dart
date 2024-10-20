import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaenuestagram/src/components/avatar.dart';
import 'package:jaenuestagram/src/components/image_data.dart';
import 'package:jaenuestagram/src/controller/bottom_nav_controller.dart';
import 'package:jaenuestagram/src/pages/home.dart';
import 'package:jaenuestagram/src/pages/mypage.dart';

import 'controller/audio_player_controller.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  @override
  void initState() {
    super.initState();
    Get.put(AudioPlayerController());
    Get.find<AudioPlayerController>().playMusic();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _preloadImages();
  }

  void _preloadImages() {
    for (var url in thumPath.getAllImageUrls()) {
      precacheImage(CachedNetworkImageProvider(url), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => IndexedStack(
            index: Get.find<BottomNavController>().pageIndex.value,
            children: const [
              Home(),
              Home(),
              Home(),
              Home(),
              MyPage(),
            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: Get.find<BottomNavController>().pageIndex.value,
        onTap: (index) async {
          if (index == 4) {
            Get.to(() => const MyPage());
          } else {
            Get.find<BottomNavController>().changeBottomNav(index);
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: ImageData(IconsPath.homeOff),
            activeIcon: ImageData(IconsPath.homeOn),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: ImageData(IconsPath.searchOff),
            activeIcon: ImageData(IconsPath.searchOn),
            label: "search",
          ),
          BottomNavigationBarItem(
            icon: ImageData(IconsPath.uploadIcon),
            label: "upload",
          ),
          BottomNavigationBarItem(
            icon: ImageData(IconsPath.activeOff),
            activeIcon: ImageData(IconsPath.activeOn),
            label: "active",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 30,
              height: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey,
              ),
              child: AvatarWidget(
                thumbPath: 'assets/photos/jaehee_profile.jpeg',
                type: AvatarType.TYPE2,
                size: 70,
              ),
            ),
            label: "avatar",
          ),
        ],
      ),
    );
  }
}
