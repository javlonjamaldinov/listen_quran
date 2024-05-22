import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listen_quran/components/audio_plaer.dart';
import 'package:listen_quran/components/custom_divider.dart';
import 'package:listen_quran/constants/audio_constants.dart';
import 'package:listen_quran/content.dart';
import 'package:listen_quran/cubit/audio_cubit.dart';
import 'package:listen_quran/cubit/not_book.dart';

class KoranPage extends StatefulWidget {
  const KoranPage({
    super.key,
  });

  @override
  State<KoranPage> createState() => _KoranPageState();
}

class _KoranPageState extends State<KoranPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: ContentColors.white,
      appBar: AppBar(
        backgroundColor: ContentColors.white,
        title: const Center(
          child: Text(
            "Курандагы дуалар",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      body: BlocBuilder<AudioCubit, PlayerState>(
        builder: (context, playerState) {
          return BlocBuilder<NotBook, BookmarkState>(
            builder: (context, isBookmarked) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    for (int i = 0;
                        i < AudioConstants.audioPathsPage.length;
                        i++)
                      AudioPlayerWidget(
                        audioPath: AudioConstants.audioPathsPage[i],
                        text: '${i + 1}/22',
                      ),
                    SizedBox(height: screenWidth * 0.05),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.04,
                      ),
                      child: Text(
                        "رَبِّ اجۡعَلۡ ہٰذَا بَلَدًا اٰمِنًا وَّ ارۡزُقۡ اَہۡلَہٗ مِنَ الثَّمَرٰتِ مَنۡ",
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.005),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.05,
                      ),
                      child: Text(
                        "اٰمَنَ مِنۡہُمۡ بِاللّٰہِ وَ الۡیَوۡمِ الۡاٰخِرِ",
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.04),
                    const CustomDivider(),
                    SizedBox(height: screenWidth * 0.04),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.10,
                      ),
                      child: Text(
                        "“Оо, Раббим! Бул жерди тынч шаар кыла көр жана анын элинин арасынан Аллаhка жана Акырет күнгө ишенген адамдарды   (ар түркүн)   мөмө-жемиштер менен ырыскылант!”",
                        style: TextStyle(
                          fontSize: screenWidth * 0.040,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.04),
                    const CustomDivider(),
                    SizedBox(height: screenWidth * 0.04),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.1,
                      ),
                      child: Text(
                        "Раббиж-’ал  хаза  Баладан  Ами-нау-уарзук ахлаху минас-самарати манн амана  минхум  бил-ЛЛахи уал Йаумил-Ахир",
                        style: TextStyle(
                          fontSize: screenWidth * 0.040,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
