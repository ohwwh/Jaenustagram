import 'package:flutter/material.dart';
import 'package:get/get.dart';
export 'package:jaenuestagram/src/components/image_data.dart' show getImagePath;

class ImageData extends StatelessWidget {
  final String icon;
  final double? width;
  final bool isContrast;
  final bool isFit;
  const ImageData(this.icon, {super.key, this.isFit = false, this.width=55, this.isContrast=false});

  @override build(BuildContext context) {
    var fit = isFit ? BoxFit.cover : null;
    var result = Image.asset(
    icon,
    width: width! / Get.mediaQuery.devicePixelRatio,
      fit: fit,);
    if (isContrast == true) {
      return ColorFiltered(
        colorFilter: const ColorFilter.matrix([
          -1,  0,  0,  0, 255, // Red
          0, -1,  0,  0, 255, // Green
          0,  0, -1,  0, 255, // Blue
          0,  0,  0,  1,   0, // Alpha
        ]),
        child: result
      );
    }
    else
    {
      return result;
    }
  }
}

String getImagePath(String fileName) {
  const String prefix = "https://raw.githubusercontent.com/ohwwh/JaenustagramPhotos/master/";
  return prefix + fileName;
}

class thumPath {
  // 기존의 개별 이미지 관리 (여기서는 getImagePath를 사용)
  static Map<String, String Function()> imageUrls = {
    'sheep_1': () => getImagePath("sheep_1.jpg"),
    'sheep_2': () => getImagePath("sheep_2.jpg"),
    'hoccance_1': () => getImagePath("hoccance_1.jpg"),
    'hoccance_2': () => getImagePath("hoccance_2.jpg"),
    'hundred_1': () => getImagePath("hundred_1.jpg"),
    'hundred_2': () => getImagePath("hundred_2.jpg"),
    'hundred_3': () => getImagePath("hundred_3.jpg"),
    'jaeheebirthday_1': () => getImagePath("jaeheebirthday_1.jpg"),
    'jaeheebirthday_2': () => getImagePath("jaeheebirthday_2.jpg"),
    'autumnleaves_1': () => getImagePath("autumnleaves_1.jpg"),
    'autumnleaves_2': () => getImagePath("autumnleaves_2.jpg"),
    'aquarium_1': () => getImagePath("aquarium_1.jpg"),
    'aquarium_2': () => getImagePath("aquarium_2.jpg"),
    'aquarium_2': () => getImagePath("aquarium_3.jpg"),
    'christmas_1': () => getImagePath("christmas_1.jpg"),
    'christmas_2': () => getImagePath("christmas_2.jpg),
    'christmas_3': () => getImagePath("christmas_3.jpg"),
    'ski_1': () => getImagePath("ski_1.jpg"),
    'ski_2': () => getImagePath("ski_2.jpg"),
    'graduation_1': () => getImagePath("graduation_1.jpg"),
    'graduation_2': () => getImagePath("graduation_2.jpg"),
    'nunubirthday_1': () => getImagePath("nunubirthday_1.jpg"),
    'nunubirthday_2': () => getImagePath("nunubirthday_2.jpg"),
    'nunubirthday_2': () => getImagePath("nunubirthday_3.jpg"),
    'jeonju_1': () => getImagePath("jeonju_1.jpg"),
    'jeonju_2': () => getImagePath("jeonju_2.jpg"),
    'waterpark_1': () => getImagePath("waterpark_1.jpg"),
    'waterpark_2': () => getImagePath("waterpark_2.jpg"),
    'everland_1': () => getImagePath("everland_1.jpg"),
    'everland_2': () => getImagePath("everland_2.jpg"),
    'snowfestival_1': () => getImagePath("snowfestival_1.jpg"),
    'snowfestival_2': () => getImagePath("snowfestival_2.jpg"),
    'japan_1': () => getImagePath("japan_1.jpg"),
    'japan_2': () => getImagePath("japan_2.jpg"),
    'gangneung_1': () => getImagePath("gangneung_1.jpg"),
    'gangneung_2': () => getImagePath("gangneung_2.jpg"),
    'thousand_1': () => getImagePath("thousand_1.jpg"),
    'thousand_2': () => getImagePath("thousand_2.jpg"),
    'climbing_1': () => getImagePath("climbing_1.jpg"),
    'climbing_2': () => getImagePath("climbing_2.jpg"),
    'coco_1': () => getImagePath("coco_1.jpg"),
    'coco_2': () => getImagePath("coco_2.jpg"),
    'third_1': () => getImagePath("third_1.jpg"),
    'third_2': () => getImagePath("third_2.jpg"),
    'busan_1': () => getImagePath("busan_1.jpg"),
    'busan_2': () => getImagePath("busan_2.jpg"),
    'busan_2': () => getImagePath("busan_3.jpg"),
  };

  static List<String> getAllImageUrls() {
    return imageUrls.values.map((getImagePathFunc) => getImagePathFunc()).toList();
  }

  static String getImageUrl(String key) {
    return thumPath.imageUrls[key]?.call() ?? 'default_image_path.jpg';
  }
}

class IconsPath {
  static String get homeOff => 'assets/images/bottom_nav_home_off_icon.jpg';
  static String get homeOn => 'assets/images/bottom_nav_home_on_icon.jpg';
  static String get searchOff => 'assets/images/bottom_nav_search_off_icon.jpg';
  static String get searchOn => 'assets/images/bottom_nav_search_on_icon.jpg';
  static String get uploadIcon => 'assets/images/bottom_nav_upload_icon.jpg';
  static String get activeOff => 'assets/images/bottom_nav_active_off_icon.jpg';
  static String get activeOn => 'assets/images/bottom_nav_active_on_icon.jpg';
  static String get logo => 'assets/images/logo_2.png';
  static String get directMessage => 'assets/images/direct_msg_icon.jpg';
  static String get plusIcon => 'assets/images/plus_icon.png';
  static String get postMoreIcon => 'assets/images/more_icon.jpg';
  static String get likeOffIcon => 'assets/images/like_off_icon.jpg';
  static String get likeOnIcon => 'assets/images/like_on_icon.jpg';
  static String get likeOnIcon2 => 'assets/images/like_on_icon2.png';
  static String get replyIcon => 'assets/images/reply_icon.jpg';
  static String get bookMarkOffIcon => 'assets/images/book_mark_off_icon.jpg';
  static String get bookMarkOnIcon => 'assets/images/book_mark_on_icon.jpg';
  static String get backBtnIcon => 'assets/images/back_icon.jpg';
  static String get menuIcon => 'assets/images/menu_icon.jpg';
  static String get addFriend => 'assets/images/add_friend_icon.jpg';
  static String get gridViewOff => 'assets/images/grid_view_off_icon.jpg';
  static String get gridViewOn => 'assets/images/grid_view_on_icon.jpg';
  static String get myTagImageOff => 'assets/images/my_tag_image_off_icon.jpg';
  static String get myTagImageOn => 'assets/images/my_tag_image_on_icon.jpg';
  static String get nextImage => 'assets/images/upload_next_icon.jpg';
  static String get closeImage => 'assets/images/close_icon.jpg';
  static String get imageSelectIcon => 'assets/images/image_select_icon.jpg';
  static String get cameraIcon => 'assets/images/camera_icon.jpg';
  static String get uploadComplete => 'assets/images/upload_complete_icon.jpg';
  static String get mypageBottomSheet01 =>
      'assets/images/mypage_bottom_sheet_01.jpg';
  static String get mypageBottomSheet02 =>
      'assets/images/mypage_bottom_sheet_02.jpg';
  static String get mypageBottomSheet03 =>
      'assets/images/mypage_bottom_sheet_03.jpg';
  static String get mypageBottomSheet04 =>
      'assets/images/mypage_bottom_sheet_04.jpg';
  static String get mypageBottomSheet05 =>
      'assets/images/mypage_bottom_sheet_05.jpg';
  static String get mypageBottomSheetSetting01 =>
      'assets/images/mypage_bottom_sheet_setting_01.jpg';
  static String get mypageBottomSheetSetting02 =>
      'assets/images/mypage_bottom_sheet_setting_02.jpg';
  static String get mypageBottomSheetSetting03 =>
      'assets/images/mypage_bottom_sheet_setting_03.jpg';
  static String get mypageBottomSheetSetting04 =>
      'assets/images/mypage_bottom_sheet_setting_04.jpg';
  static String get mypageBottomSheetSetting05 =>
      'assets/images/mypage_bottom_sheet_setting_05.jpg';
  static String get mypageBottomSheetSetting06 =>
      'assets/images/mypage_bottom_sheet_setting_06.jpg';
  static String get mypageBottomSheetSetting07 =>
      'assets/images/mypage_bottom_sheet_setting_07.jpg';
}