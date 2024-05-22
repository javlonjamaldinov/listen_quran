import 'package:bloc/bloc.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AudioCubit extends Cubit<PlayerState> {
  final AudioPlayer _player;
  String? _currentAudioPath;

  AudioCubit()
      : _player = AudioPlayer(),
        super(PlayerState.stopped) {
    _player.onPlayerStateChanged.listen((state) {
      if (state == AudioPlayerState.COMPLETED) {
        pause();
      } else {
        emit(PlayerState.stopped); // Обработка других состояний
      }
    });
  }

  Future<void> play(String audioPath) async {
    try {
      if (_currentAudioPath != null && _currentAudioPath != audioPath) {
        // Если текущий аудио не равно новому аудио, останавливаем его
        stop();
      }
      int result = await _player.play(audioPath);
      if (result == 1) {
        _currentAudioPath = audioPath; // Устанавливаем текущий аудио
        emit(PlayerState.playing);
      } else {
        emit(PlayerState.stopped); // Обработка ошибки воспроизведения
      }
    } catch (e) {
      emit(PlayerState.stopped); // Обработка ошибки
    }
  }

  void pause() {
    _player.pause();
    emit(PlayerState.paused);
  }

  void stop() {
    _player.stop();
    emit(PlayerState.stopped);
  }

  @override
  Future<void> close() {
    _player.dispose();
    return super.close();
  }

  void toggleBookmark() {}
}
