import 'package:flutter/material.dart';
import 'package:jaenuestagram/src/components/image_data.dart';

class Likebutton extends StatefulWidget {
  const Likebutton({super.key, this.width = 100, this.isContrast = false, this.isSecret = false});

  final double? width;
  final bool isContrast;
  final bool isSecret;

  @override
  State<Likebutton> createState() => _LikebuttonState();
}

class _LikebuttonState extends State<Likebutton> {
  final ScrollController _scrollController = ScrollController();

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

  void _showStoryAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('New Story Available'),
          content: const Text('새로운 스토리를 확인하세요!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Get.back();
                _scrollController.jumpTo(0);
              },
            ),
          ],
        );
      },
    );
  }

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
            _showStoryAlert()
          }
        });
      },
    );
  }
}
