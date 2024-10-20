import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerController extends GetxController {
  final AudioPlayer _audioPlayer = AudioPlayer();
  AudioPlayer get audioPlayer => _audioPlayer;

  // 음악 재생
  Future<void> playMusic() async {
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);
    await _audioPlayer.play(AssetSource('audio/AllINeed.mp3'));
  }

  // 음악 멈추기
  Future<void> stopMusic() async {
    await _audioPlayer.stop();
  }

  // 음악 뮤트
  Future<void> muteMusic() async {
    await _audioPlayer.setVolume(0.0);  // 소리 끄기
  }

  // 음악 소리 키기
  Future<void> unmuteMusic() async {
    await _audioPlayer.setVolume(1.0);  // 소리 다시 켜기
  }

  @override
  void onClose() {
    _audioPlayer.dispose();
    super.onClose();
  }
}
