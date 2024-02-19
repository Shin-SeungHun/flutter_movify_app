import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movify/data/model/cast_item.dart';
import 'package:flutter_movify/data/model/ott_item.dart';
import 'package:flutter_movify/ui/info/movie_info_view_model.dart';
import 'package:flutter_movify/ui/layout/background_widget.dart';
import 'package:flutter_movify/ui/layout/credits_profile_widget.dart';
import 'package:flutter_movify/ui/layout/movie_back_drop_widget.dart';
import 'package:flutter_movify/ui/layout/movie_info_poster_widget.dart';
import 'package:flutter_movify/ui/layout/movie_poster_dialog.dart';
import 'package:flutter_movify/ui/layout/ott_list_widget.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieInfoScreen extends StatefulWidget {
  const MovieInfoScreen({super.key});

  @override
  State<MovieInfoScreen> createState() => _MovieInfoScreenState();
}

class _MovieInfoScreenState extends State<MovieInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieInfoViewModel>(
      builder: (BuildContext context, MovieInfoViewModel viewModel, Widget? child) {
        return Scaffold(
          body: Stack(children: [
            const BackgroundWidget(),
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 200.0,
                  backgroundColor: Colors.black,
                  flexibleSpace: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      double top = constraints.biggest.height;
                      return FlexibleSpaceBar(
                        title: AnimatedOpacity(
                          duration: const Duration(milliseconds: 300),
                          opacity: top < kToolbarHeight * 2.2 ? 1.0 : 0.0,
                          child: Text(
                            viewModel.movieItem.title,
                            style: const TextStyle(color: CupertinoColors.systemYellow, fontWeight: FontWeight.bold),
                          ),
                        ),
                        background: MovieBackDropWidget(movieItem: viewModel.movieItem),
                      );
                    },
                  ),
                  pinned: true,
                  floating: false,
                  snap: false,
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      const SizedBox(height: 20),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => MoviePosterDialog(
                                        movieItem: viewModel.movieItem,
                                      ),
                                    ),
                                  );
                                },
                                child: MovieInfoPosterWidget(movieItem: viewModel.movieItem),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          viewModel.movieItem.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(viewModel.movieItem.overview),
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Text(
                              '주요 출연진',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 250, // 가로 스크롤 가능한 영역을 제한하기 위한 높이 설정
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: viewModel.castList.length,
                              itemBuilder: (context, index) {
                                final CastItem castItem = viewModel.castList[index];
                                return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CreditsProfileWidget(castItem: castItem),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Text(
                              'OTT',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 100, // 가로 스크롤 가능한 영역을 제한하기 위한 높이 설정
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: viewModel.ottList.length,
                              itemBuilder: (context, index) {
                                final OttItem ottItem = viewModel.ottList[index];
                                return Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                          onTap: () {
                                            int ottId = ottItem.providerId;
                                            String packageName = ottPackage()[ottId]!;
                                            openGooglePlayStore(packageName: packageName);
                                          },
                                          child: OttListWidget(ottItem: ottItem)),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        );
      },
    );
  }

  /// OTT 패키지 이름
  Map<int, String> ottPackage() {
    Map<int, String> ottPackageNames = {};

    ottPackageNames[8] = 'com.netflix.mediaclient'; // Netflix
    ottPackageNames[1796] = 'com.netflix.mediaclient'; // Netflix basic with Ads
    ottPackageNames[97] = 'com.frograms.wplay'; // Watcha
    ottPackageNames[337] = 'com.disney.disneyplus'; // Disney+
    ottPackageNames[356] = 'kr.co.captv.pooqV2'; // Wavve
    ottPackageNames[119] = 'com.amazon.amazonvideo.livingroom'; // prime video
    ottPackageNames[350] = 'com.apple.atve.androidtv.appletv'; // apple tv
    ottPackageNames[2] = 'com.apple.atve.androidtv.appletv'; // apple tv
    ottPackageNames[701] = 'com.spiintl.filmbox'; // film box

    return ottPackageNames;
  }

  /// 구글 플레이스토어로 이동
  void openGooglePlayStore({required String packageName}) async {
    // 패키지 이름에 따른 Play Store 링크 생성
    String url = 'market://details?id=$packageName';

    // Play Store 링크 열기 시도
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      // Play Store 앱이 없는 경우 웹사이트를 여는 링크 생성
      url = 'https://play.google.com/store/apps/details?id=$packageName';
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
