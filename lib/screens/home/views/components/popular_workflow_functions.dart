import 'package:dragonai/components/workflow/workflow_card.dart';
import 'package:dragonai/constants.dart';
import 'package:dragonai/models/workflow_model.dart';
import 'package:flutter/material.dart';
import 'package:dragonai/route/screen_export.dart';

class PopularWorkflowFunctions extends StatelessWidget {
  const PopularWorkflowFunctions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: defaultPadding / 2),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: Text(
            "推荐",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // While loading use 👇
        // const ProductsSkelton(),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: bestWorkflows.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == bestWorkflows.length - 1 ? defaultPadding : 0,
              ),
              child: WorkflowCard(
                image: bestWorkflows[index].image,
                brandName: bestWorkflows[index].brandName,
                title: bestWorkflows[index].title,
                modelType: bestWorkflows[index].modelType,
                press: () {
                  Navigator.pushNamed(
                    context,
                    productDetailsScreenRoute,
                    arguments: index.isEven,
                  );
                },
              ),
            ),
          ),
        )
      ],
    );
  }
}
