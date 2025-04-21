import 'package:dragonai/route/screen_export.dart';
import 'package:dragonai/screens/product/views/components/product_images.dart';
import 'package:dragonai/screens/workflow/components/action_button.dart';
import 'package:dragonai/screens/workflow/components/paramter_list_tile.dart';
import 'package:dragonai/screens/workflow/components/workflow_info.dart';
import 'package:dragonai/screens/workflow/providers/workflow_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:dragonai/constants.dart';
import 'package:provider/provider.dart';

class WorkflowScreen extends StatefulWidget {
  const WorkflowScreen({super.key});
  @override
  State<StatefulWidget> createState() => _WorkflowScreenState();
}

class _WorkflowScreenState extends State<WorkflowScreen> {
  @override
  Widget build(BuildContext context) {
    WorkflowScreenProvider workflowProvider = Provider.of<WorkflowScreenProvider>(context, listen: true);
    return Scaffold(
      // 底部按钮
      bottomNavigationBar: ActionButton(
        subtitle: '预计用时 12 秒',
        press: () async {
          await workflowProvider.prompt();
        },
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 一个可以收起的header bar
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              floating: true,
              actions: const [],
            ),
            // 这里应该放一个图片预览栏

            // 图片滚动栏
            const ProductImages(
              images: [
                productDemoImg1,
                productDemoImg2,
                productDemoImg3,
              ],
            ),
            // 工作流基本信息说明
            const WorkflowInfo(
              brand: "文生图",
              title: "输入文字生成图片",
              isAvailable: true,
              description: ''
                  '在正向提示词中输入生成图片的提示词。'
                  '\n'
                  '在反向提示词中输入不希望生成的图片的提示词。'
                  '\n'
                  // '选择生成图片的数量，数量越多用时越长。'
                  // '\n'
                  '生成图片的尺寸为 1024x1024。',
            ),
            ParameterListTile(
              // svgSrc: "assets/icons/Product.svg",
              title: "正向提示词${workflowProvider.positivePrompt.isNotEmpty ? "\n${workflowProvider.positivePrompt}" : ""}",
              press: () async {
                var args = {"data": workflowProvider.positivePrompt};
                final result = await Navigator.pushNamed<dynamic>(
                  context,
                  promptInputScreenRouter, // 确保使用正确的路由名称
                  arguments: args,
                );
                if (result != null && result.isNotEmpty) {
                  workflowProvider.updatePositivePrompt(result);
                } else {}
              },
            ),
            ParameterListTile(
              // svgSrc: "assets/icons/Delivery.svg",
              title: "反向提示词${workflowProvider.negativePrompt.isNotEmpty ? "\n${workflowProvider.negativePrompt}" : ""}",
              press: () async {
                var args = {"data": workflowProvider.negativePrompt};
                final result = await Navigator.pushNamed<dynamic>(
                  context,
                  promptInputScreenRouter, // 确保使用正确的路由名称
                  arguments: args,
                );
                if (result != null && result.isNotEmpty) {
                  workflowProvider.updateNegativePrompt(result);
                } else {}
              },
            ),
            ParameterListTile(
              // svgSrc: "assets/icons/Return.svg",
              title: "图片数量\n ${workflowProvider.batchSize}",
              isShowBottomBorder: true,
              press: () async {
                var args = {"data": workflowProvider.batchSize};
                final result = await Navigator.pushNamed<dynamic>(
                  context,
                  batchSizeScreenRouter, // 确保使用正确的路由名称
                  arguments: args,
                );
                workflowProvider.updateBatchSize(int.parse(result.toString()));
              },
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: defaultPadding),
            )
          ],
        ),
      ),
    );
  }
}
