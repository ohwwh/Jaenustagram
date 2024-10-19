import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jaenuestagram/src/components/avatar.dart';
import 'package:jaenuestagram/src/components/image_data.dart';
import 'package:jaenuestagram/src/controller/bottom_nav_controller.dart';
import 'package:jaenuestagram/src/pages/home.dart';
import 'package:jaenuestagram/src/pages/mypage.dart';

class App extends GetView<BottomNavController> {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, Object? result) async {
        if (didPop) {
          return;
        }
      },
      child: Obx(() => Scaffold(
        backgroundColor: Colors.white,
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: const [
              Home(),
              Home(),
              Home(),
              Home(),
              MyPage(),
            ]
          ),
          bottomNavigationBar: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              currentIndex: controller.pageIndex.value,
            onTap: (index) {
              if (index == 4) {
                Get.to(() => const MyPage());
              } else {
                controller.changeBottomNav(index);
              }
            },
              items: [
            BottomNavigationBarItem(
                icon: ImageData(IconsPath.homeOff),
                activeIcon: ImageData(IconsPath.homeOn),
                label: "home"
            ),
            BottomNavigationBarItem(
                icon: ImageData(IconsPath.searchOff),
                activeIcon: ImageData(IconsPath.searchOn),
                label: "search"
            ),
            BottomNavigationBarItem(
                icon: ImageData(IconsPath.uploadIcon),
                label: "upload"
            ),
            BottomNavigationBarItem(
                icon: ImageData(IconsPath.activeOff),
                activeIcon: ImageData(IconsPath.activeOn),
                label: "active"
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
                        thumbPath: 'assets/photos/240px-Jordan_by_Lipofsky_16577.jpg',
                        type: AvatarType.TYPE2,
                        size: 70
                    )),
                label: "avatar"
            ),
          ],
      ),
      ),
      ),
    );
  }
}