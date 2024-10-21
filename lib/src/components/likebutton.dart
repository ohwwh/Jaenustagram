import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaenuestagram/src/components/image_data.dart';

class Likebutton extends StatefulWidget {
  const Likebutton({super.key, this.width = 100, this.isContrast = false, this.isSecret = false, this.scrollController = null});

  final double? width;
  final bool isContrast;
  final bool isSecret;
  final ScrollController? scrollController;

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
      width: widget.width ?? 100,
    );
    isSecret = widget.isSecret;
    _scrollController = widget.scrollController;
  }
  late ImageData currentIcon;
  bool isLiked = false;
  bool isSecret = false;
  ScrollController? _scrollController;

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
                _scrollController?.jumpTo(0);
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
            if (isSecret = true && _scrollController != null)
              _showStoryAlert();
          }
        });
      },
    );
  }
}
