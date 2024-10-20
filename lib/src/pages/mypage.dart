import 'package:flutter/material.dart';
import 'package:jaenuestagram/src/components/avatar.dart';
import 'package:jaenuestagram/src/components/image_data.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  bool _isEditing = false;
  String profileText = '안녕하세요 기요미입니다';

  final TextEditingController _textController = TextEditingController();

  Widget _statisticsOne(String title, int value){
    return Column(
      children: [
        Text(value.toString(),
          style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black
        ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        )
      ],
    );
  }

  Widget _information(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
            children: [
              AvatarWidget(thumbPath: 'assets/photos/jaehee_profile.jpeg',
                  type: AvatarType.TYPE3,
                size: 80
              ),
              const SizedBox(width: 20),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(child: _statisticsOne("Post", 0)),
                    Expanded(child: _statisticsOne("Followers", 1)),
                    Expanded(child: _statisticsOne("Following", 1)),
                  ],
                ),
              )
            ],
        ),
        const SizedBox(height: 15),
        _isEditing
            ? TextField(
          controller: _textController,
          decoration: const InputDecoration(
            hintText: '소개글을 작성해보세요',
            hintStyle: TextStyle(decoration: TextDecoration.none)
          ),
          onSubmitted: (newValue) {
            setState(() {
              _isEditing = false;
              profileText = newValue;
            });
          },
        )
            : Text(
          profileText,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ]
      ),
    );
  }

  Widget _menu(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xffdedede),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                setState(() {
                  _isEditing = !_isEditing;
                });
            },
            child: const Text(
                'Edit profile',
                textAlign: TextAlign.center,
                style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
                ),
              ) ,
            ),
          ),
          const SizedBox(width: 8),
          Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3),
                  border: Border.all(
                    color: const Color(0xffdedede),
                  ),
                color: const Color(0xffefefef)
              ),
            child: ImageData(IconsPath.addFriend,
            width: 85
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: const Text('째히',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.black
        )
        ),
        actions: [
          GestureDetector(
            onTap: () {},
              child: ImageData(
                    IconsPath.uploadIcon,
                    width: 50
                ),
              ),
          GestureDetector(
            onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ImageData(
                    IconsPath.menuIcon,
                    width: 50
                ),
              ),
          )
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0),
        child: SingleChildScrollView(
            child: Column(
              children: [
                _information(),
                _menu()
              ],
            ),
        ),
      )
    );
  }
}
