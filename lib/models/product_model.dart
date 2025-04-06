// For demo only
import 'package:dragonai/constants.dart';

class ProductModel {
  final String image, brandName, title;
  final double price;
  final double? priceAfetDiscount;
  final int? dicountpercent;

  ProductModel({
    required this.image,
    required this.brandName,
    required this.title,
    required this.price,
    this.priceAfetDiscount,
    this.dicountpercent,
  });
}

List<ProductModel> demoPopularProducts = [
  ProductModel(
    image: productDemoImg1,
    title: "根据文字生成图片",
    brandName: "文生图",
    price: 540,
    // priceAfetDiscount: 420,
    // dicountpercent: 20,
  ),
  ProductModel(
    image: productDemoImg4,
    title: "根据图片生成图片",
    brandName: "图生图",
    price: 800,
  ),
  ProductModel(
    image: productDemoImg5,
    title: "风格迁移",
    brandName: "图生图",
    price: 650.62,
    // priceAfetDiscount: 390.36,
    // dicountpercent: 40,
  ),
  // ProductModel(
  //   image: productDemoImg6,
  //   title: "Green Poplin Ruched Front",
  //   brandName: "Lipsy london",
  //   price: 1264,
  //   priceAfetDiscount: 1200.8,
  //   dicountpercent: 5,
  // ),
  // ProductModel(
  //   image: "https://i.imgur.com/tXyOMMG.png",
  //   title: "Green Poplin Ruched Front",
  //   brandName: "Lipsy london",
  //   price: 650.62,
  //   priceAfetDiscount: 390.36,
  //   dicountpercent: 40,
  // ),
  // ProductModel(
  //   image: "https://i.imgur.com/h2LqppX.png",
  //   title: "white satin corset top",
  //   brandName: "Lipsy london",
  //   price: 1264,
  //   priceAfetDiscount: 1200.8,
  //   dicountpercent: 5,
  // ),
];

List<ProductModel> demoFlashSaleProducts = [
  ProductModel(
    image: productDemoImg5,
    title: "FS - Nike Air Max 270 Really React",
    brandName: "Lipsy london",
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40,
  ),
  ProductModel(
    image: productDemoImg6,
    title: "Green Poplin Ruched Front",
    brandName: "Lipsy london",
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5,
  ),
  ProductModel(
    image: productDemoImg4,
    title: "Mountain Beta Warehouse",
    brandName: "Lipsy london",
    price: 800,
    priceAfetDiscount: 680,
    dicountpercent: 15,
  ),
];
List<ProductModel> demoBestSellersProducts = [
  ProductModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_10.png",
    title: "Green Poplin Ruched Front",
    brandName: "Lipsy london",
    price: 650.62,
    priceAfetDiscount: 390.36,
    dicountpercent: 40,
  ),
  ProductModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_11.png",
    title: "white satin corset top",
    brandName: "Lipsy london",
    price: 1264,
    priceAfetDiscount: 1200.8,
    dicountpercent: 5,
  ),
  ProductModel(
    image: productDemoImg4,
    title: "Mountain Beta Warehouse",
    brandName: "Lipsy london",
    price: 800,
    priceAfetDiscount: 680,
    dicountpercent: 15,
  ),
];
List<ProductModel> kidsProducts = [
  ProductModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_12.png",
    title: "Green Poplin Ruched Front",
    brandName: "Lipsy london",
    price: 650.62,
    priceAfetDiscount: 590.36,
    dicountpercent: 24,
  ),
  ProductModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_13.png",
    title: "Printed Sleeveless Tiered Swing Dress",
    brandName: "Lipsy london",
    price: 650.62,
  ),
  ProductModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_14.png",
    title: "Ruffle-Sleeve Ponte-Knit Sheath ",
    brandName: "Lipsy london",
    price: 400,
  ),
  ProductModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_15.png",
    title: "Green Mountain Beta Warehouse",
    brandName: "Lipsy london",
    price: 400,
    priceAfetDiscount: 360,
    dicountpercent: 20,
  ),
  ProductModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_16.png",
    title: "Printed Sleeveless Tiered Swing Dress",
    brandName: "Lipsy london",
    price: 654,
  ),
  ProductModel(
    image: "http://192.168.2.25:8080/dragonfly-boot/sys/common/static/images/navigators/level_100_11.png",
    title: "Mountain Beta Warehouse",
    brandName: "Lipsy london",
    price: 250,
  ),
];
