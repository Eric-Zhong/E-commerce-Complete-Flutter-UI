import 'package:dragonai/constants.dart';
import 'package:dragonai/screens/workflow/components/action_button.dart';
import 'package:dragonai/screens/workflow/components/batch_size.dart';
import 'package:dragonai/screens/workflow/providers/batch_size_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BatchSizeScreen extends StatelessWidget {
  final int size;
  final int max;
  final int min;
  const BatchSizeScreen({super.key, required this.size, required this.max, required this.min});

  @override
  Widget build(BuildContext context) {
    // providers
    BatchSizeProvider batchSizeProvider = Provider.of<BatchSizeProvider>(
      context,
      listen: true,
    );

    return Scaffold(
      bottomNavigationBar: ActionButton(
        title: '确定',
        subtitle: '数值范围：1~4',
        comment: '推荐从1开始',
        press: () {
          Navigator.pop(context, batchSizeProvider.size);
        },
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: const Text("参数设置"),
              floating: true,
              actions: const [],
            ),
            SliverPadding(
              padding: const EdgeInsets.all(defaultPadding),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BatchSize(
                      max: max,
                      min: min,
                      onDecrement: () {
                        batchSizeProvider.decrement();
                      },
                      size: batchSizeProvider.size,
                      onIncrement: () {
                        batchSizeProvider.increment();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
