import 'package:dragonai/constants.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required this.subtitle,
    this.title = "执行",
    this.comment = "平均生成时长(秒)",
    required this.press,
  });

  final String subtitle;
  final String title, comment;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding, vertical: defaultBorderRadious / 2),
        child: SizedBox(
          height: 64,
          child: Material(
            color: primaryColor,
            clipBehavior: Clip.hardEdge,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(defaultBorderRadious),
              ),
            ),
            child: InkWell(
              onTap: press,
              child: Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subtitle,
                            style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
                          ),
                          Text(
                            comment,
                            style: const TextStyle(color: Colors.white54, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      alignment: Alignment.center,
                      height: double.infinity,
                      color: Colors.black.withValues(alpha: 0.15),
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
