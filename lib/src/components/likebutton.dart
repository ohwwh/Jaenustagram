import 'package:flutter/material.dart';
import 'package:jaenuestagram/src/components/image_data.dart';

class Likebutton extends StatefulWidget {
  const Likebutton({super.key, this.width = 100, this.isContrast = false});

  final double? width;
  final bool isContrast;

  @override
  State<Likebutton> createState() => _LikebuttonState();
}

class _LikebuttonState extends State<Likebutton> {
  @override
  void initState() {
    super.initState();
    currentIcon = ImageData(
      IconsPath.likeOffIcon,
      isContrast: widget.isContrast,
      width: widget.width ?? 100, // 기본값을 100으로 설정
    );
  }
  late ImageData currentIcon;
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return  IconButton(
      icon: currentIcon,
      onPressed: () {
        setState(() {
          // Change the icon to activeOn when clicked
          if (isLiked == true) {
            currentIcon = ImageData(
                IconsPath.likeOffIcon, isContrast: widget.isContrast,
                width: widget.width);
            isLiked = false;
          }
          else{
            currentIcon = ImageData(
                IconsPath.likeOnIcon2,
                isContrast: false,
                width: widget.width
            );
            isLiked = true;
          }
        });
      },
    );
  }
}
