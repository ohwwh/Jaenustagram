import 'dart:async';
import 'package:flutter/material.dart';

class DosScreen extends StatefulWidget {
  @override
  _DosScreenState createState() => _DosScreenState();
}

class _DosScreenState extends State<DosScreen> {
  List<String> lines = [];
  List<String> linesToAdd = [
    "첫 만남: 2021/05/14",
    "우리가 만난지: 1252일",
    "저와 함께 새로운 1일을 시작하시겠습니까?",
    "문을 열고 밖으로 나와주세요"
  ];
  int currentLine = 0;
  String currentText = ""; // 현재 출력 중인 텍스트
  int charIndex = 0; // 현재 출력 중인 글자의 인덱스
  Timer? typingTimer; // 타이핑 타이머
  Timer? eraseTimer;  // 지우기 타이머
  bool isErasing = false; // 지우는 중인지 여부
  bool lineModified = false; // 특정 줄이 수정되었는지 여부

  final String prefixText = "우리가 만난지: "; // 고정된 텍스트
  final Duration initialDelay = const Duration(seconds: 5); // 타이핑 속도
  final Duration typingInterval = const Duration(milliseconds: 100); // 타이핑 속도
  final Duration eraseInterval = const Duration(milliseconds: 300);  // 지우기 속도
  final Duration lineInterval = const Duration(seconds: 1); // 다음 줄로 넘어가는 시간

  @override
  void initState() {
    super.initState();
    Future.delayed(initialDelay, () {
      // 초기 대기 후 타이핑 시작
      startTyping();
    });
  }

  void startTyping() {
    typingTimer = Timer.periodic(typingInterval, (timer) {
      setState(() {
        if (currentLine < linesToAdd.length) {
          // 두 번째 줄("우리가 만난지: 1252일")에서 텍스트 수정
          if (currentLine == 1 && !lineModified) {
            if (!isErasing) {
              // 1252일을 타이핑
              if (charIndex < linesToAdd[currentLine].length) {
                currentText += linesToAdd[currentLine][charIndex];
                charIndex++;
              } else {
                // 타이핑이 완료되면 지우기 시작 (고정 텍스트 제외하고 숫자 부분만 지움)
                startErasing();
                typingTimer?.cancel(); // 타이핑 타이머 중지
              }
            }
          } else {
            // 일반적인 타이핑 동작
            if (charIndex < linesToAdd[currentLine].length) {
              currentText += linesToAdd[currentLine][charIndex];
              charIndex++;
            } else {
              // 한 줄이 다 출력되면 다음 줄로 넘어가기 전에 대기
              lines.add(currentText);
              currentLine++;
              charIndex = 0;
              currentText = "";
              typingTimer?.cancel();
              Future.delayed(lineInterval, () {
                startTyping(); // 다음 줄 타이핑 시작
              });
            }
          }
        } else {
          typingTimer?.cancel(); // 모든 줄이 다 출력되면 타이머 종료
        }
      });
    });
  }

  void startErasing() {
    eraseTimer = Timer.periodic(eraseInterval, (timer) {
      setState(() {
        if (charIndex > prefixText.length) {
          // 숫자 부분 "1252"를 한 글자씩 지움
          currentText = currentText.substring(0, charIndex - 1);
          charIndex--;
        } else {
          // 다 지워졌으면 0일을 타이핑하기 시작
          eraseTimer?.cancel(); // 지우기 타이머 중지
          linesToAdd[1] = prefixText + "0일";
          charIndex = prefixText.length; // 0일을 타이핑할 준비
          lineModified = true; // 수정 완료 표시
          startTyping(); // 0일 타이핑 시작
        }
      });
    });
  }

  @override
  void dispose() {
    typingTimer?.cancel();
    eraseTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...lines.map((line) => Text(
              line,
              style: const TextStyle(
                color: Colors.green,
                fontFamily: 'Courier',
                fontSize: 20,
              ),
            )),
            // 현재 출력 중인 줄을 표시 (완성되기 전)
            if (currentLine < linesToAdd.length)
              Text(
                currentText,
                style: const TextStyle(
                  color: Colors.green,
                  fontFamily: 'Courier',
                  fontSize: 20,
                ),
              ),
            // 타이핑 중일 때 커서 모양을 추가
            if (currentLine < linesToAdd.length)
              const Text(
                '_',
                style: TextStyle(
                  color: Colors.green,
                  fontFamily: 'Courier',
                  fontSize: 20,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
