import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipe_app/pages/On%20open/see_all.dart';
import 'package:recipe_app/pages/home_page.dart';
import 'package:recipe_app/widgets/pageAnimationFade.dart';

class HomeView extends StatefulWidget {
  const HomeView({
    super.key,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 64, right: 146),
            child: Text(
              "Find best ricepes\for cooking",
              style: TextStyle(
                color: Color(0xFF303030),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 28, right: 20, left: 20, bottom: 20),
            child: Container(
              width: size.width / 0.7.w,
              height: size.height / 13.h,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(20)),
              child: const TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 13),
                  hintText: 'Search recipes',
                  isDense: false,
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Uzbek Milliy Taom🔥',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(SlideTransition1(
                          const see_all(),
                        ));
                      },
                      child: Row(
                        children: [
                          const Text(
                            'See All',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.red),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: SvgPicture.asset(
                              'assets/svg/Belgi.svg',
                              width: 10,
                              height: 15,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(flex: 2, child: builder(posts)),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Trending Now🔥',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'See All',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.red),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/svg/Belgi.svg',
                            width: 30,
                            height: 20,
                          ),
                          color: Colors.red,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
