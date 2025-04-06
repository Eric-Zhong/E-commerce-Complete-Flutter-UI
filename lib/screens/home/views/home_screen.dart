import 'package:dragonai/screens/home/views/components/best_workflows.dart';
import 'package:dragonai/screens/home/views/components/offers_workflow_functions.dart';
import 'package:dragonai/screens/home/views/components/popular_workflows.dart';
import 'package:flutter/material.dart';
// import 'components/best_sellers.dart';
// import 'components/popular_products.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // 顶部滚动轮播栏
            SliverToBoxAdapter(child: OffersWorkflowFunctions()),
            // SliverToBoxAdapter(child: PopularProducts()),
            SliverToBoxAdapter(child: PopularWorkflows()),
            // const SliverPadding(
            //   padding: EdgeInsets.symmetric(vertical: defaultPadding * 1.5),
            //   sliver: SliverToBoxAdapter(child: FlashSale()),
            // ),
            // SliverToBoxAdapter(
            //   child: Column(
            //     children: [
            //       // While loading use 👇
            //       // const BannerMSkelton(),
            //       BannerSStyle1(
            //         title: "New \narrival",
            //         subtitle: "SPECIAL OFFER",
            //         discountParcent: 50,
            //         press: () {
            //           Navigator.pushNamed(context, onSaleScreenRoute);
            //         },
            //       ),
            //       const SizedBox(height: defaultPadding / 4),
            //       // We have 4 banner styles, all in the pro version
            //     ],
            //   ),
            // ),
            SliverToBoxAdapter(child: BestWorkflows()),
            // SliverToBoxAdapter(child: MostPopular()),
            // SliverToBoxAdapter(
            //   child: Column(
            //     children: [
            //       const SizedBox(height: defaultPadding * 1.5),

            //       const SizedBox(height: defaultPadding / 4),
            //       // While loading use 👇
            //       // const BannerSSkelton(),
            //       BannerSStyle5(
            //         title: "Black \nfriday",
            //         subtitle: "50% Off",
            //         bottomText: "Collection".toUpperCase(),
            //         press: () {
            //           Navigator.pushNamed(context, onSaleScreenRoute);
            //         },
            //       ),
            //       const SizedBox(height: defaultPadding / 4),
            //     ],
            //   ),
            // ),
            // const SliverToBoxAdapter(child: BestSellers()),
          ],
        ),
      ),
    );
  }
}
