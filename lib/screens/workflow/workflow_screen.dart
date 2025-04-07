import 'package:dragonai/components/workflow/workflow_execution_button.dart';
import 'package:dragonai/route/screen_export.dart';
import 'package:dragonai/screens/product/views/components/product_images.dart';
import 'package:dragonai/screens/workflow/components/paramter_list_tile.dart';
import 'package:dragonai/screens/workflow/components/workflow_info.dart';
import 'package:dragonai/screens/workflow/prompt_input_screen.dart';
import 'package:dragonai/screens/workflow/providers/prompt_input_provider.dart';
import 'package:dragonai/screens/workflow/providers/workflow_screen_provider.dart';
import 'package:flutter/material.dart';
import 'package:dragonai/components/buy_full_ui_kit.dart';
import 'package:dragonai/components/custom_modal_bottom_sheet.dart';
import 'package:dragonai/constants.dart';
import 'package:dragonai/screens/product/views/product_returns_screen.dart';
import 'package:provider/provider.dart';

class WorkflowScreen extends StatefulWidget {
  const WorkflowScreen({super.key});
  @override
  State<StatefulWidget> createState() => _WorkflowScreenState();
}

class _WorkflowScreenState extends State<WorkflowScreen> {
  @override
  Widget build(BuildContext context) {
    WorkflowScreenProvider provider = Provider.of<WorkflowScreenProvider>(context, listen: true);
    return Scaffold(
      // 底部按钮
      bottomNavigationBar: WorkflowExecutionButton(
        duration: 15,
        press: () {
          // 底部滑出信息栏
          // customModalBottomSheet(
          //   context,
          //   height: MediaQuery.of(context).size.height * 0.92,
          //   child: const ProductBuyNowScreen(),
          // );

          // 直接调用api执行comfyui
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
              description: '在正向提示词中输入生成图片的提示词。'
                  '\n'
                  '在反向提示词中输入不希望生成的图片的提示词。'
                  '\n'
                  '选择生成图片的数量，数量越多用时越长。'
                  '\n'
                  '生成图片的尺寸为 1024x1024。',
            ),
            ParameterListTile(
              // svgSrc: "assets/icons/Product.svg",
              title: "正向提示词${provider.positivePrompt.isNotEmpty ? "\n${provider.positivePrompt}" : ""}",
              press: () async {
                var args = {"data": provider.positivePrompt};
                print('Arguments being passed: $args');
                final result = await Navigator.pushNamed<dynamic>(
                  context,
                  promptInputScreenRouter, // 确保使用正确的路由名称
                  arguments: args,
                );
                if (result != null && result.isNotEmpty) {
                  provider.updatePositivePrompt(result);
                } else {}
              },
            ),
            ParameterListTile(
              // svgSrc: "assets/icons/Delivery.svg",
              title: "反向提示词${provider.negativePrompt.isNotEmpty ? "\n${provider.negativePrompt}" : ""}",
              press: () async {
                var args = {"data": provider.negativePrompt};
                final result = await Navigator.pushNamed<dynamic>(
                  context,
                  promptInputScreenRouter, // 确保使用正确的路由名称
                  arguments: args,
                );
                if (result != null && result.isNotEmpty) {
                  provider.updateNegativePrompt(result);
                } else {}
              },
            ),
            ParameterListTile(
              // svgSrc: "assets/icons/Return.svg",
              title: "图片数量",
              isShowBottomBorder: true,
              press: () {
                customModalBottomSheet(
                  context,
                  height: MediaQuery.of(context).size.height * 0.92,
                  child: const ProductReturnsScreen(),
                );
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
