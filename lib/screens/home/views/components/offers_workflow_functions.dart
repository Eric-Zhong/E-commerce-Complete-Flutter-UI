import 'package:dragonai/constants.dart';
import 'package:dragonai/screens/home/views/components/workflow_functions_categories.dart';
import 'package:flutter/material.dart';
import 'offers_carousel.dart';

class OffersWorkflowFunctions extends StatelessWidget {
  const OffersWorkflowFunctions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // While loading use 👇
        // const OffersSkelton(),
        const OffersCarousel(),
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "分类",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading use 👇
        // const CategoriesSkelton(),
        const WorkflowFunctionCategories(),
      ],
    );
  }
}
