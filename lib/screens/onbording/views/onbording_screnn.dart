import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dragonai/components/dot_indicators.dart';
import 'package:dragonai/constants.dart';
import 'package:dragonai/route/route_constants.dart';

import 'components/onbording_content.dart';

class OnBordingScreen extends StatefulWidget {
  const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;
  final List<Onbord> _onbordData = [
    Onbord(
      image: "assets/Illustration/ComfyUI_Onboard_0.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_0.png",
      title: "欢迎来到AI设计新纪元！",
      description: "这款APP专为室内设计师打造，利用先进的AI技术，将您的设计灵感转化为逼真的效果图。",
    ),
    Onbord(
      image: "assets/Illustration/ComfyUI_Onboard_1.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_1.png",
      title: "智能空间布局，一键生成！",
      description: "只需上传室内空间照片，AI即可智能分析空间结构，快速生成多种布局方案，为您节省大量设计时间。",
    ),
    Onbord(
      image: "assets/Illustration/ComfyUI_Onboard_2.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_2.png",
      title: "风格随心变，创意无限！",
      description: "从现代简约到古典奢华，各种室内设计风格应有尽有。输入文字描述或上传参考图，AI助您轻松实现个性化设计。",
    ),
    Onbord(
      image: "assets/Illustration/ComfyUI_Onboard_3.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_3.png",
      title: "材质纹理，逼真呈现！",
      description: "AI能够模拟各种室内装饰材料的真实质感，从木质地板到大理石墙面，让您的效果图更具说服力。",
    ),
    Onbord(
      image: "assets/Illustration/ComfyUI_Onboard_4.png",
      imageDarkTheme: "assets/Illustration/Illustration_darkTheme_4.png",
      title: "实时渲染，所见即所得！",
      description: "告别漫长的渲染等待，AI实时呈现设计效果，让您随时调整，即刻看到最终成果。",
    ),
  ];

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            children: [
              // 欢迎页面右上角 Skip 按钮
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, logInScreenRoute);
                  },
                  child: Text(
                    // "Skip",
                    "跳过",
                    style: TextStyle(color: Theme.of(context).textTheme.bodyLarge!.color),
                  ),
                ),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _onbordData.length,
                  onPageChanged: (value) {
                    setState(() {
                      _pageIndex = value;
                    });
                  },
                  itemBuilder: (context, index) => OnbordingContent(
                    title: _onbordData[index].title,
                    description: _onbordData[index].description,
                    image: (Theme.of(context).brightness == Brightness.dark && _onbordData[index].imageDarkTheme != null) ? _onbordData[index].imageDarkTheme! : _onbordData[index].image,
                    isTextOnTop: index.isOdd,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(
                    _onbordData.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: defaultPadding / 2),
                      child: DotIndicator(isActive: index == _pageIndex),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding * 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // const Spacer(),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_pageIndex < _onbordData.length - 1) {
                          _pageController.nextPage(curve: Curves.ease, duration: defaultDuration);
                        } else {
                          Navigator.pushNamed(context, logInScreenRoute);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Arrow - Right.svg",
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: defaultPadding * 2),
            ],
          ),
        ),
      ),
    );
  }
}

class Onbord {
  final String image, title, description;
  final String? imageDarkTheme;

  Onbord({
    required this.image,
    required this.title,
    this.description = "",
    this.imageDarkTheme,
  });
}
