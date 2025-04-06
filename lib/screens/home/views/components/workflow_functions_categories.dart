import 'package:dragonai/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dragonai/route/screen_export.dart';

// For preview
class WorkflowFunctionModel {
  final String name;
  final String? svgSrc, route;

  WorkflowFunctionModel({
    required this.name,
    this.svgSrc,
    this.route,
  });
}

List<WorkflowFunctionModel> defaultWorkflowFunctionCategories = [
  WorkflowFunctionModel(name: "默认", route: onSaleScreenRoute),
  WorkflowFunctionModel(name: "初级", svgSrc: "assets/icons/Child.svg", route: kidsScreenRoute),
  WorkflowFunctionModel(name: "进阶", svgSrc: "assets/icons/Sale.svg", route: onSaleScreenRoute),
  WorkflowFunctionModel(name: "高级", svgSrc: "assets/icons/Man.svg", route: onSaleScreenRoute),
  WorkflowFunctionModel(name: "专业", svgSrc: "assets/icons/Woman.svg", route: onSaleScreenRoute),
];
// End For Preview

class WorkflowFunctionCategories extends StatelessWidget {
  const WorkflowFunctionCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ...List.generate(
            defaultWorkflowFunctionCategories.length,
            (index) => Padding(
              padding: EdgeInsets.only(left: index == 0 ? defaultPadding : defaultPadding / 2, right: index == defaultWorkflowFunctionCategories.length - 1 ? defaultPadding : 0),
              child: CategoryBtn(
                category: defaultWorkflowFunctionCategories[index].name,
                svgSrc: defaultWorkflowFunctionCategories[index].svgSrc,
                isActive: index == 0,
                press: () {
                  if (defaultWorkflowFunctionCategories[index].route != null) {
                    Navigator.pushNamed(context, defaultWorkflowFunctionCategories[index].route!);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryBtn extends StatelessWidget {
  const CategoryBtn({
    super.key,
    required this.category,
    this.svgSrc,
    required this.isActive,
    required this.press,
  });

  final String category;
  final String? svgSrc;
  final bool isActive;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      borderRadius: const BorderRadius.all(Radius.circular(30)),
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        decoration: BoxDecoration(
          color: isActive ? primaryColor : Colors.transparent,
          border: Border.all(color: isActive ? Colors.transparent : Theme.of(context).dividerColor),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        child: Row(
          children: [
            if (svgSrc != null)
              SvgPicture.asset(
                svgSrc!,
                height: 20,
                colorFilter: ColorFilter.mode(
                  isActive ? Colors.white : Theme.of(context).iconTheme.color!,
                  BlendMode.srcIn,
                ),
              ),
            if (svgSrc != null) const SizedBox(width: defaultPadding / 2),
            Text(
              category,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: isActive ? Colors.white : Theme.of(context).textTheme.bodyLarge!.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
