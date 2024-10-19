import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaenuestagram/src/components/image_data.dart';
import 'package:jaenuestagram/src/components/post_widget.dart';

import '../components/avatar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  List<Widget> _avatars = [];
  bool _hasReachedEnd = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _avatars.add(AvatarWidget(
      type: AvatarType.TYPE4,
      nickname: "뉴뉴",
      thumbPath: 'assets/photos/Caitlin-Clark-Indiana-Fever-Minnesota-Linx-WNBA-Getty-2162026714-H-MAIN-2024.webp',
    ));
  }

  void _onScroll() {

    if (_scrollController.position.atEdge && !_hasReachedEnd) {
      if (_scrollController.position.pixels != 0) {
        setState(() {
          _avatars.add(AvatarWidget(
            type: AvatarType.TYPE4,
            nickname: "뉴뉴",
            thumbPath: 'assets/photos/Caitlin-Clark-Indiana-Fever-Minnesota-Linx-WNBA-Getty-2162026714-H-MAIN-2024.webp',
            isSecret: true,
          ));
          _hasReachedEnd = true;
          _showStoryAlert();
          //_scrollController.jumpTo(0);
        });
      }
    }
  }

  void _showStoryAlert() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('New Story Available'),
          content: const Text('Check out the new story!'),
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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _myStory() {
    return Stack(
        children: [
          AvatarWidget(
              thumbPath: 'assets/photos/240px-Jordan_by_Lipofsky_16577.jpg',
              type: AvatarType.TYPE2,
              size: 70
          ),
          Positioned(
              right: 5,
              bottom: 0,
              child: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                  border: Border.all(
                    color: Colors.white,
                    width: 2,

                  )
                ),
                child: const Center(
                  child: Text(
                      '+',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        height: 1.1
                      )
                  ),
                )
              ),
          )
        ],
    );
  }

  Widget _storyBoardList(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
        child: Row(
            children: [
              const SizedBox(width: 20),
                _myStory(),
              const SizedBox(width: 5),
            ] + _avatars,
      ),
    );
  }

  Widget _postList () {
    return Column(
      children: List.generate(10, (index) => PostWidget()).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(

        top:true,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          body: CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                automaticallyImplyLeading: false,
                scrolledUnderElevation: 0,
                floating: true,
                pinned: true,
                snap: false,
                elevation: 0,
                backgroundColor: Colors.white,
                title: ImageData(IconsPath.logo, width: 470),
                actions: [
                  GestureDetector(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ImageData(
                        IconsPath.directMessage,
                        width: 50,
                      ),
                    ),
                  ),
                ],
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    _storyBoardList(),
                    _postList(),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
/*  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
    );
  }*/
}


