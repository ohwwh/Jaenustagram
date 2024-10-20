import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jaenuestagram/src/app.dart';
import 'package:jaenuestagram/src/components/image_data.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final String correctUsername = "김재희";
  final String correctPassword = "910224";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageData(IconsPath.logo, width: 850),
            const SizedBox(height: 50),
            // 사용자 이름 입력 필드
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username: 당신의 이름',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // 비밀번호 입력 필드
            TextField(
              controller: passwordController,
              obscureText: true,  // 비밀번호 입력시 텍스트 숨기기
              decoration: InputDecoration(
                labelText: 'Password: 당신의 집 비밀번호',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // 입력된 사용자 이름 및 비밀번호를 가져옴
                  String enteredUsername = usernameController.text;
                  String enteredPassword = passwordController.text;

                  // 하드코딩된 값과 비교
                  if (enteredUsername == correctUsername
                      && enteredPassword == correctPassword) {
                    // 일치하면 App 위젯으로 이동
                    Get.to(() => App());
                  } else {
                    // 일치하지 않으면 오류 메시지 출력
                    Get.snackbar(
                      'Login Failed',
                      'Incorrect username or password',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text('로그인',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '로그인 하기 전 소리를 켜 주세요',
              style: TextStyle(
                color: Colors.black,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
