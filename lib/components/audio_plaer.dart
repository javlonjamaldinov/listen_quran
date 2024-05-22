import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listen_quran/cubit/audio_cubit.dart';
import 'package:listen_quran/cubit/not_book.dart';

class AudioPlayerWidget extends StatelessWidget {
  final String text;
  final String audioPath;

  const AudioPlayerWidget({
    Key? key,
    required this.text,
    required this.audioPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return BlocBuilder<AudioCubit, PlayerState>(
      builder: (context, playerState) {
        final isBookmarked = context.read<NotBook>().state;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenWidth * 0.07,
          ),
          child: Container(
            height: screenWidth * 0.13,
            width: screenWidth * 0.9,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.share_outlined,
                        color: Colors.blue,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        final audioBloc = context.read<AudioCubit>();
                        final currentAudioState = audioBloc.state;
                        if (currentAudioState != PlayerState.stopped) {
                          audioBloc.stop();
                        }
                        audioBloc.play(audioPath);
                      },
                      icon: Icon(
                        playerState == PlayerState.playing
                            ? Icons.pause_outlined
                            : Icons.play_arrow_outlined,
                        color: Colors.blue,
                        size: screenWidth * 0.08,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<NotBook>().toggleBookmark();
                      },
                      icon: Icon(
                        isBookmarked == BookmarkState.bookmarked
                            ? Icons.bookmark_outlined
                            : Icons.bookmark_outline_sharp,
                        color: Colors.blue,
                        size: screenWidth * 0.07,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
