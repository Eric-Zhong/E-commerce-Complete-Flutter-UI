import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ParameterListTile extends StatelessWidget {
  const ParameterListTile({
    super.key,
    required this.title,
    this.isShowBottomBorder = false,
    this.svgSrc,
    required this.press,
  });

  final String? svgSrc;
  final String title;
  final bool isShowBottomBorder;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          const Divider(height: 1),
          ListTile(
            onTap: press,
            minLeadingWidth: 24,
            leading: svgSrc == null
                ? null
                : SvgPicture.asset(
                    svgSrc ?? '',
                    height: 24,
                    color: Theme.of(context).textTheme.bodyLarge!.color,
                  ),
            title: Text(title),
            trailing: SvgPicture.asset(
              "assets/icons/miniRight.svg",
              color: Theme.of(context).textTheme.bodyMedium!.color,
            ),
          ),
          if (isShowBottomBorder) const Divider(height: 1),
        ],
      ),
    );
  }
}
