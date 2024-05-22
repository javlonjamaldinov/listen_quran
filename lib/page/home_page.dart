import 'package:flutter/material.dart';
import 'package:listen_quran/content.dart';
import 'package:listen_quran/page/koran_page.dart';
import 'package:listen_quran/page/listen_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatelessWidget {
  final _controller = PageController();

  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ContentColors.white,
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              height: 800,
              child: PageView(
                controller: _controller,
                children: const [
                  KoranPage(),
                  ListenPage(),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 2,
              effect: const SwapEffect(
                activeDotColor: ContentColors.blue,
                dotColor: ContentColors.grey,
                spacing: 30,
                dotWidth: 10,
                dotHeight: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
