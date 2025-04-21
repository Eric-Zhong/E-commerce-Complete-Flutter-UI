import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../constants.dart';

class BatchSize extends StatelessWidget {
  const BatchSize({
    super.key,
    required this.size,
    required this.onIncrement,
    required this.onDecrement,
    required this.min,
    required this.max,
  });

  final int size;
  final int min;
  final int max;
  final VoidCallback onIncrement, onDecrement;

  @override
  Widget build(BuildContext context) {
    var iconColor = Theme.of(context).iconTheme.color ?? Colors.black;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "图片数量",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: OutlinedButton(
                onPressed: size > min ? onDecrement : null,
                style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(defaultPadding / 2)),
                child: SvgPicture.asset(
                  "assets/icons/Minus.svg",
                  color: iconColor,
                ),
              ),
            ),
            SizedBox(
              width: 40,
              child: Center(
                child: Text(
                  size.toString(),
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: OutlinedButton(
                onPressed: size < max ? onIncrement : null,
                style: OutlinedButton.styleFrom(padding: const EdgeInsets.all(defaultPadding / 2)),
                child: SvgPicture.asset(
                  "assets/icons/Plus1.svg",
                  color: iconColor,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
