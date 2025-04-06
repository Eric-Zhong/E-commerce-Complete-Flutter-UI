import 'dart:async';

import 'package:dragonai/components/Banner/M/banner_m_style_0.dart';
import 'package:dragonai/constants.dart';
import 'package:flutter/material.dart';
import 'package:dragonai/components/dot_indicators.dart';

class OffersCarousel extends StatefulWidget {
  const OffersCarousel({
    super.key,
  });

  @override
  State<OffersCarousel> createState() => _OffersCarouselState();
}

class _OffersCarouselState extends State<OffersCarousel> {
  int _selectedIndex = 0;
  late PageController _pageController;
  late Timer _timer;

  void stopTimer() {
    _timer.cancel();
  }

  // Offers List (Offers: 商品特价) 轮播栏
  List offers = [
    BannerMStyle0(
      text: "新增内蒙谷机房 \n24个4090GPU",
      image: 'https://pic.to8to.com/tb/case/2a8c285b707148bfbcd9f77dcfe8f109_284.jpg',
      press: () {},
    ),
    BannerMStyle0(
      text: "上月新注册用户 \n326人",
      image: 'https://pic.to8to.com/tb/case/10d85f26d37544adbb0b4ba8e3a31ae2_284.jpg',
      press: () {},
    ),
    BannerMStyle0(
      text: "AI服务器在线率 \n46%",
      image: 'https://pic.to8to.com/tb/case/8ae819073b974ee4b561541837c1638c_284.jpg',
      press: () {},
    ),
    BannerMStyle0(
      text: "GPU使用效率 \n69%",
      image: 'https://pic.to8to.com/tb/case/abd477de19a244b3bca1cffb671cdd0e_284.jpg',
      press: () {},
    ),
    BannerMStyle0(
      text: "本周AI绘图 \n3957张图片",
      image: 'https://pic.to8to.com/tb/case/6bb0f90b429643668aafbbd1aef368b2_284.png',
      press: () {},
    ),

    // BannerMStyle2(
    //   title: "Black \nfriday",
    //   subtitle: "Collection",
    //   discountParcent: 50,
    //   press: () {},
    // ),
    // BannerMStyle3(
    //   title: "Grab \nyours now",
    //   discountParcent: 50,
    //   press: () {},
    // ),
    // BannerMStyle4(
    //   // image: , user your image
    //   title: "SUMMER \nSALE",
    //   subtitle: "SPECIAL OFFER",
    //   discountParcent: 80,
    //   press: () {},
    // ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_selectedIndex < offers.length - 1) {
        _selectedIndex++;
      } else {
        _selectedIndex = 0;
      }
      _pageController.animateToPage(
        _selectedIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.87,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: offers.length,
            onPageChanged: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            itemBuilder: (context, index) => offers[index],
          ),
          FittedBox(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: SizedBox(
                height: 16,
                child: Row(
                  children: List.generate(
                    offers.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: defaultPadding / 2),
                        child: DotIndicator(
                          isActive: index == _selectedIndex,
                          activeColor: Colors.white70,
                          inActiveColor: Colors.white54,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
