import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dragonai/components/buy_full_ui_kit.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("消息通知"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/icons/DotsV.svg",
                colorFilter: ColorFilter.mode(
                  Theme.of(context).iconTheme.color!,
                  BlendMode.srcIn,
                ),
              ),
            )
          ],
        ),
        body: const BuyFullKit(
          images: ["assets/screens/Notification.png"],
        ));
  }
}
