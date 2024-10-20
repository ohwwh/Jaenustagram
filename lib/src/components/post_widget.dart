import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:jaenuestagram/src/components/avatar.dart';
import 'package:jaenuestagram/src/components/image_data.dart';
import 'package:jaenuestagram/src/components/likebutton.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PostWidget extends StatelessWidget {
  final String nickName;
  final String thumbPath;
  final List<String> imageUrls;
  final String firstHash;
  final String comment;
  final PageController _pageController = PageController();
  PostWidget({super.key,
    required this.nickName,
    required this.imageUrls,
    required this.thumbPath,
    required this.firstHash,
    required this.comment
  });


  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(
              thumbPath: thumbPath,
              type: AvatarType.TYPE3,
              nickname: nickName,
              size: 40,
          ),
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
                child: ImageData(
              IconsPath.postMoreIcon,
              width: 30,
            )
          )),
        ],
      ),
    );
  }

/*  Widget _image() {
    return CachedNetworkImage(
      imageUrl: imageUrl,
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
    );
  }*/
  Widget _image() {
    return Column(
      children: [
        SizedBox(
          height: 250,
          width: double.infinity,
          child: PageView.builder(
            controller: _pageController,
            itemCount: imageUrls.length,
            itemBuilder: (context, index) {
              return CachedNetworkImage(
                imageUrl: imageUrls[index],
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
              );
            },
          ),
        ),
        const SizedBox(height: 10),
        SmoothPageIndicator(
          controller: _pageController,
          count: imageUrls.length,
          effect: const ScrollingDotsEffect(
            dotHeight: 6,
            dotWidth: 6,
            activeDotColor: Colors.blue,
          ),
        ),
      ],
    );
  }

  Widget _infoCount() {
    return Padding(
      padding: const EdgeInsets.only(left: 1.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Likebutton(width: 65, isContrast: false),
              const SizedBox(width: 5),
              ImageData(
                IconsPath.replyIcon,
                width: 60,
              ),
              const SizedBox(width: 15),
              ImageData(
                IconsPath.directMessage,
                width: 55,
              ),
              const SizedBox(width: 15),
            ],
          ),
          ImageData(
            IconsPath.bookMarkOffIcon,
            width: 50,
          ),
        ],
      ),
    );
  }

  Widget _infoDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '좋아요 2개',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          ExpandableText(
            "$firstHash\n$comment\n",
            prefixText: '뉴뉴',
            onPrefixTap: () {},
            prefixStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            expandText: '더 보기',
            collapseText: '접기',
            maxLines: 1,
            expandOnTextTap: true,
            collapseOnTextTap: true,
            linkColor: Colors.grey,
          ),
        ],
      ),
    );
  }

  Widget _replyTextBtn(){
    return GestureDetector(
      onTap: (){},
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          '댓글 0개',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _dateAgo(){
      return const Padding(
           padding: EdgeInsets.symmetric(horizontal: 15),
        child: Text(
          '1일 전',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 11,
          ),
        )
      );

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _header(),
          SizedBox(height: 15),
          _image(),
          SizedBox(height: 15),
          _infoCount(),
          SizedBox(height: 5),
          _infoDescription(),
          SizedBox(height: 5),
          _replyTextBtn(),
          SizedBox(height: 5),
          _dateAgo(),
        ],
      )
    );
  }
}
