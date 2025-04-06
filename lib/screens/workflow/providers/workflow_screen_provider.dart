import 'dart:math';

import 'package:dragonai/providers/base_provider.dart';

class WorkflowScreenProvider extends BaseProvider {
  int _batchSize = 4;
  int _seed = 0;

  int get batchSize => _batchSize;
  int get seed => _seed;

  WorkflowScreenProvider(
    int batchSize,
    int seed,
  ) {
    _batchSize = batchSize;
    _seed = seed;
  }
}
