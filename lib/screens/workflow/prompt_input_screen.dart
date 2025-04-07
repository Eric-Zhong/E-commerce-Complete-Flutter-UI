import 'package:dragonai/constants.dart';
import 'package:dragonai/screens/workflow/providers/prompt_input_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PromptInputScreen extends StatelessWidget {
  final String prompt;
  const PromptInputScreen({super.key, required this.prompt});

  @override
  Widget build(BuildContext context) {
    // providers
    PromptInputProvider promptInputProvider = Provider.of<PromptInputProvider>(
      context,
      listen: false,
    );

    promptInputProvider.textEditingController.text = prompt;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: const Text("参数设置"),
              floating: true,
              actions: const [],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: promptInputProvider.textEditingController,
                  maxLines: 8,
                  minLines: 2,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: "请输入正向提示词",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    spacing: defaultPadding / 2,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FilledButton.tonal(onPressed: () {}, child: const Text('清空')),
                      FilledButton(
                          onPressed: () {
                            Navigator.pop(context, promptInputProvider.textEditingController.text);
                          },
                          child: const Text('确定')),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
