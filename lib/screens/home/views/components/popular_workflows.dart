import 'package:dragonai/components/workflow/workflow_card.dart';
import 'package:dragonai/constants.dart';
import 'package:dragonai/models/workflow_model.dart';
import 'package:flutter/material.dart';
import 'package:dragonai/route/screen_export.dart';

class PopularWorkflows extends StatelessWidget {
  const PopularWorkflows({
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
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: popularWorkflows.length,
            itemBuilder: (context, index) => Padding(
              padding: EdgeInsets.only(
                left: defaultPadding,
                right: index == popularWorkflows.length - 1 ? defaultPadding : 0,
              ),
              child: WorkflowCard(
                image: popularWorkflows[index].image,
                brandName: popularWorkflows[index].brandName,
                title: popularWorkflows[index].title,
                modelType: popularWorkflows[index].modelType,
                press: () {
                  Navigator.pushNamed(
                    context,
                    workflowScreenRouter,
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
