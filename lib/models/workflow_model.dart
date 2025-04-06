// For demo only
import 'package:dragonai/constants.dart';

class WorkflowModel {
  final String image, brandName, title;
  final String? modelType;

  WorkflowModel({
    required this.image,
    required this.brandName,
    required this.title,
    this.modelType,
  });
}

List<WorkflowModel> popularWorkflowsFunctions = [
  WorkflowModel(
    image: productDemoImg1,
    title: "根据文字生成图片",
    brandName: "文生图",
    modelType: "XL",
  ),
  WorkflowModel(
    image: productDemoImg4,
    title: "根据图片生成图片",
    brandName: "图生图",
    modelType: "XL",
  ),
  WorkflowModel(
    image: productDemoImg5,
    title: "风格迁移",
    brandName: "图生图",
    modelType: "XL",
  ),
];

// DragonAI
List<WorkflowModel> popularWorkflows = [
  WorkflowModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_01.png",
    title: "输入文字生成图片",
    brandName: "图生图",
    modelType: "XL",
  ),
  WorkflowModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_02.png",
    title: "上传图片生成图片",
    brandName: "图生图",
    modelType: "XL",
  ),
  WorkflowModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_03.png",
    title: "风格迁移\n上传图片样式",
    brandName: "文生图",
    modelType: "XL",
  ),
  WorkflowModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_04.png",
    title: "局部重绘",
    brandName: "文生图",
    modelType: "XL",
  ),
  // WorkflowModel(
  //   image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_05.png",
  //   title: "Mountain Beta Warehouse",
  //   brandName: "文生图",
  //   modelType: "XL",
  // ),
  // WorkflowModel(
  //   image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_06.png",
  //   title: "Mountain Beta Warehouse",
  //   brandName: "文生图",
  //   modelType: "XL",
  // ),
];

List<WorkflowModel> bestWorkflows = [
  WorkflowModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_10.png",
    title: "室内装修风格更换",
    brandName: "图生图",
    modelType: "XL",
  ),
  WorkflowModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_11.png",
    title: "毛坯房\n生成设计方案",
    brandName: "文生图",
    modelType: "SD",
  ),
  WorkflowModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_12.png",
    title: "颜色搭配抽卡",
    brandName: "文生图",
    modelType: "XL",
  ),
  WorkflowModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_13.png",
    title: "家具布局规划",
    brandName: "文生图",
    modelType: "SD",
  ),
  WorkflowModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_14.png",
    title: "局部重绘与修改",
    brandName: "文生图",
    modelType: "SD",
  ),
  WorkflowModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_15.png",
    title: "软装搭配方案",
    brandName: "文生图",
    modelType: "XL",
  ),
  WorkflowModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_16.png",
    title: "庭院景观设计",
    brandName: "文生图",
    modelType: "XL",
  ),
];
