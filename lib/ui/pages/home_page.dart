import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vertical_landing_page/providers/page_provider.dart';
import 'package:vertical_landing_page/ui/shared/index.dart';
import 'package:vertical_landing_page/ui/views/index.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: buildBoxDecoration(),
            child: Stack(children: [
              _HomeBody(),
              const Positioned(right: 20, top: 20, child: CustomAppMenu())
            ])));
  }

  BoxDecoration buildBoxDecoration() => const BoxDecoration(
      gradient: LinearGradient(
          colors: [
            Colors.pink,
            Colors.purpleAccent,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.5, 0.5]));
}

class _HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pageProvider = Provider.of<PageProvider>(context, listen: false);

    return PageView(
      controller: pageProvider.scrollController,
      scrollDirection: Axis.vertical,
      children: const [
        HomeView(),
        AboutView(),
        PricingView(),
        ContactView(),
        LocationView()
      ],
    );
  }
}
