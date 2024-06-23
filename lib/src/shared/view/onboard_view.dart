import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodmania/src/core/storage/secure_storage.dart';
import 'package:foodmania/src/shared/widgets/onboard_button.dart';
import 'package:foodmania/src/shared/widgets/onboard_widget.dart';

import '../../utils/constants/text_theme.dart';

@RoutePage()
class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends State<OnBoardView> {
  late List<OnBoard> list;
  final PageController _pageController = PageController(initialPage: 0);
  final ValueNotifier _pageIndex = ValueNotifier(0);

  @override
  void initState() {
    list = [
      OnBoard(
        imageUrl: 'assets/components/food1.png',
        title: 'İnqrediyent sizdən, yemək resepti bizdən',
      ),
      OnBoard(
        imageUrl: 'assets/components/food2.png',
        title: 'Özünün aşçısı ol',
      ),
      OnBoard(
        imageUrl: 'assets/components/food3.png',
        title: 'Axtardığınız reseptlər burada',
      ),
      OnBoard(
        imageUrl: 'assets/components/food4.png',
        title: 'Kulinariya sehrini öz mətbəxinizdə kəşf edin',
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.w),
              child: Container(
                height: 129.h,
                padding: EdgeInsets.only(top: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Text(
                            'Keç',
                            style: ConstantTextTheme.displayLarge!.copyWith(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.sp,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 430.h,
              width: size.width,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                onPageChanged: (value) {
                  _pageIndex.value = value;
                },
                controller: _pageController,
                itemCount: 4,
                itemBuilder: (context, index) {
                  String image = list[index].imageUrl;
                  String title = list[index].title;
                  return OnBoardWidget(image: image, title: title);
                },
              ),
            ),
            SizedBox(height: 100.h),
            SizedBox(
              width: 361.w,
              height: 56.h,
              child: ValueListenableBuilder(
                valueListenable: _pageIndex,
                builder: (context, value, child) {
                  return OnboardButton(
                    text: value == 3 ? 'Ana səhifə' : 'Növbəti',
                    fun: () {
                      if (value != 3) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      } else {
                        Future.microtask(
                          () {
                            SecureStorage.saveOnBoard('state');
                          },
                        );
                        context.router.replaceNamed('/login-general');
                      }
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OnBoard {
  String imageUrl;
  String title;
  OnBoard({
    required this.imageUrl,
    required this.title,
  });
}
