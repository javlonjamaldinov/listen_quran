import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listen_quran/components/audio_plaer.dart';
import 'package:listen_quran/components/custom_divider.dart';
import 'package:listen_quran/constants/audio_constants.dart';
import 'package:listen_quran/content.dart';
import 'package:listen_quran/cubit/audio_cubit.dart';
import 'package:listen_quran/cubit/not_book.dart';

class ListenPage extends StatelessWidget {
  const ListenPage({super.key});

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
                    for (int i = 0; i < AudioConstants.audioPathsPage2.length; i++)
                     AudioPlayerWidget(
                     audioPath: AudioConstants.audioPathsPage2[i],
                       text: '${i + 1}/22',
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Container(
                        height: screenWidth * 0.13,
                        width: screenWidth * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            "Аят аль-Курси",
                            style: TextStyle(
                                color: ContentColors.blue, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.010),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.09,
                      ),
                      child: Text(
                        "ٱللَّهُ لَآ إِلَٰهَ إِلَّا هُوَ ٱلۡحَيُّ ٱلۡقَيُّومُۚ لَا تَأۡخُذُهُۥ سِنَةٌ وَلَا نَوۡمٌ لَّهُۥ مَا فِي ٱلسَّمَٰوَٰتِ وَمَا فِي ٱلۡأَرۡضِۗ مَن ذَا ٱلَّذِي يَشۡفَعُ عِندَهُۥٓ إِلَّا بِإِذۡنِهِۦۚ يَعۡلَمُ مَا بَيۡنَ أَيۡدِيهِمۡ وَمَا خَلۡفَهُمۡۖ وَلَا يُحِيطُونَ بِشَيۡءٖ مِّنۡ عِلۡمِهِۦٓ إِلَّا بِمَا شَآءَۚ وَسِعَ كُرۡسِيُّهُ ٱلسَّمَٰوَٰتِ وَٱلۡأَرۡضَۖ وَلَا يَـُٔودُهُۥ حِفۡظُهُمَاۚ وَهُوَ ٱلۡعَلِيُّ ٱلۡعَظِيمُ.",
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
                        "“Аллах – андан башка сыйынууга татыктуу эч бир зат жок, Ал – түбөлүк Тирүү, Жашоо Берүүчү! Аны үргүлөө да, уйку да кармабайт. Асмандардагы жана жердегинин баары Аныкы. Анын алдында Өзүнүн уруксатысыз ким шапаат-колдоочулук кыла алат?! Ал алардын (макулуктардын)  келечегиндеги жана өтмүшүндөгү бардык нерселерди билет. Ал эми алар болсо Ал Өзү каалагандан башка эч нерсе билишпейт. Анын Курсийи асмандар жана Жерден да кенен. Ал экөөнү (асмандар менен жерди) сактап туруу Аны такыр чарчатпайт. Ал – эң Жогорку жана эң Улук.",
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
                        "Аллооху лаа илааха иллаа хува-ль-Хаййул Коййуум. Лаа та’хузуху синатув ва лаа навм. Лаху маа фис-самааваати ва маа фил ард. Ман зал-лазии йашфаъу ъиндаху иллаа би-изних. Йаъламу маа байна айдиихим ва маа холфахум. Ва лаа йухиитууна би шайим-мин ъильмихи иллаа би маа шаааа‘а. Васиъа курсиййуху-с-самааваати вал-ард. Ва лаа йа‘уудуху хифзухумаа. Ва хувал-Ъалиййул Ъазыым.",
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
