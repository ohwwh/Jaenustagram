import 'package:cached_network_image/cached_network_image.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:jaenuestagram/src/components/avatar.dart';
import 'package:jaenuestagram/src/components/image_data.dart';
import 'package:jaenuestagram/src/components/likebutton.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});


  Widget _header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AvatarWidget(
              thumbPath: 'assets/photos/240px-Jordan_by_Lipofsky_16577.jpg',
              type: AvatarType.TYPE3,
              nickname: '째히',
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

  Widget _image() {
/*    return CachedNetworkImage(
        imageUrl: "https://img.hankyung.com/photo/202309/PAF20230902302901009_P4.jpg"
     );*/

    return const ImageData(
        'assets/photos/PAF20230902302901009_P4.jpg'
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
            '#두근두근 첫 손 잡기\n오늘부터 1일!\n',
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
