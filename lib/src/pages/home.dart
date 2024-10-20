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
      thumbPath: 'assets/photos/nunu_profile.jpeg',
      imageUrl: getImagePath("ring.jpg"),
    ));
  }

  void _onScroll() {

    if (_scrollController.position.atEdge && !_hasReachedEnd) {
      if (_scrollController.position.pixels != 0) {
        setState(() {
          _avatars.add(AvatarWidget(
            type: AvatarType.TYPE4,
            nickname: "뉴뉴",
            thumbPath: 'assets/photos/nunu_profile.jpeg',
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
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Widget _myStory() {
    return Stack(
        children: [
          AvatarWidget(
              thumbPath: 'assets/photos/jaehee_profile.jpeg',
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
      children: [
        PostWidget(
            nickName: "뉴뉴",
            thumbPath: "assets/photos/nunu_profile.jpeg",
            imageUrls: [
              getImagePath("202105.jpg"),
            ],
            firstHash: "#두근두근 첫 손 잡기",
            comment: "오늘부터 1일!"
        ),
        PostWidget(
            nickName: "뉴뉴",
            thumbPath: "assets/photos/nunu_profile.jpeg",
            imageUrls: [
              getImagePath("sheep_1.jpg"),
              getImagePath("sheep_2.jpg"),
            ],
            firstHash: "#몽토랑 양떼목장",
            comment: "나를 노리는 양떼들과 알프스 소녀 같은 재희"
        ),
        PostWidget(
            nickName: "뉴뉴",
            thumbPath: "assets/photos/nunu_profile.jpeg",
            imageUrls: [
              getImagePath("hoccance_1.jpg"),
              getImagePath("hoccance_2.jpg"),
            ],
            firstHash: "#호캉스 #그랜드조선호텔",
            comment: "맛있는 조식! 헬스장과 수영장까지 즐기려니 몸이 두개라도 모자라"
        ),
        PostWidget(
            nickName: "뉴뉴",
            thumbPath: "assets/photos/nunu_profile.jpeg",
            imageUrls: [
              getImagePath("100_1.jpg"),
              getImagePath("100_2.jpg"),
              getImagePath("100_3.jpg"),
            ],
            firstHash: "#100일 #첫 기념일 #앙꼬야 누나 잘 지켜주고 있니",
            comment: "사귀고 처음 맞는 기념일! 꽃을 받고 기뻐하는 너의 모습이 너무 예뻐"
        ),
        PostWidget(
            nickName: "뉴뉴",
            thumbPath: "assets/photos/nunu_profile.jpeg",
            imageUrls: [
              getImagePath("jaeheebirthday_1.jpg"),
              getImagePath("jaeheebirthday_2.jpg"),
              getImagePath("jaeheebirthday_3.jpg"),
            ],
            firstHash: "#째히생일 #바로이걸보는오늘",
            comment: "처음 챙겨준 생일. 서프라이즈 선물을 좋아할까?"
        ),
        PostWidget(
            nickName: "뉴뉴",
            thumbPath: "assets/photos/nunu_profile.jpeg",
            imageUrls: [
              getImagePath("autumnleaves_1.jpg"),
              getImagePath("autumnleaves_2.jpg"),
              getImagePath("autumnleaves_3.jpg"),
            ],
            firstHash: "#태백 #철암 #단풍놀이",
            comment: "같이 철암으로 단풍놀이 간 날. 날씨도 좋고, 단풍도 내 옆의 그녀도 예쁜 완벽한 하루"
        ),
        PostWidget(
            nickName: "뉴뉴",
            thumbPath: "assets/photos/nunu_profile.jpeg",
            imageUrls: [
              getImagePath("aquarium_1.jpg"),
              getImagePath("aquarium_2.jpg"),
              getImagePath("aquarium_3.jpg"),
            ],
            firstHash: "#잠실 #롯데월드 #아쿠아리움",
            comment: "아쿠아리움에 갔다. 펭귄이 귀여웠다. 하지만 너는 더 귀엽다"
        ),
        PostWidget(
            nickName: "뉴뉴",
            thumbPath: "assets/photos/nunu_profile.jpeg",
            imageUrls: [
              getImagePath("chrismas_1.jpg"),
              getImagePath("christmas_2.jpg"),
              getImagePath("christmas_3.jpg"),
            ],
            firstHash: "#메리크리스마스",
            comment: "크리스마스 파티! 지금 보면 어찌나 좁은지, 하지만 어찌나 행복해 보이는지"
        ),
        PostWidget(
            nickName: "뉴뉴",
            thumbPath: "assets/photos/nunu_profile.jpeg",
            imageUrls: [
              getImagePath("aquarium_1.jpg"),
              getImagePath("aquarium_2.jpg"),
              getImagePath("aquarium_3.jpg"),
            ],
            firstHash: "#잠실 #롯데월드 #아쿠아리움",
            comment: "아쿠아리움에 갔다. 펭귄이 귀여웠다. 하지만 너는 더 귀엽다"
        ),
        PostWidget(
            nickName: "뉴뉴",
            thumbPath: "assets/photos/nunu_profile.jpeg",
            imageUrls: [
              getImagePath("aquarium_1.jpg"),
              getImagePath("aquarium_2.jpg"),
              getImagePath("aquarium_3.jpg"),
            ],
            firstHash: "#잠실 #롯데월드 #아쿠아리움",
            comment: "아쿠아리움에 갔다. 펭귄이 귀여웠다. 하지만 너는 더 귀엽다"
        ),
        PostWidget(
            nickName: "뉴뉴",
            thumbPath: "assets/photos/nunu_profile.jpeg",
            imageUrls: [
              getImagePath("aquarium_1.jpg"),
              getImagePath("aquarium_2.jpg"),
              getImagePath("aquarium_3.jpg"),
            ],
            firstHash: "#잠실 #롯데월드 #아쿠아리움",
            comment: "아쿠아리움에 갔다. 펭귄이 귀여웠다. 하지만 너는 더 귀엽다"
        ),
        PostWidget(
            nickName: "뉴뉴",
            thumbPath: "assets/photos/nunu_profile.jpeg",
            imageUrls: [
              getImagePath("aquarium_1.jpg"),
              getImagePath("aquarium_2.jpg"),
              getImagePath("aquarium_3.jpg"),
            ],
            firstHash: "#잠실 #롯데월드 #아쿠아리움",
            comment: "아쿠아리움에 갔다. 펭귄이 귀여웠다. 하지만 너는 더 귀엽다"
        ),
        PostWidget(
            nickName: "뉴뉴",
            thumbPath: "assets/photos/nunu_profile.jpeg",
            imageUrls: [
              getImagePath("aquarium_1.jpg"),
              getImagePath("aquarium_2.jpg"),
              getImagePath("aquarium_3.jpg"),
            ],
            firstHash: "#잠실 #롯데월드 #아쿠아리움",
            comment: "아쿠아리움에 갔다. 펭귄이 귀여웠다. 하지만 너는 더 귀엽다"
        ),
      ],
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


