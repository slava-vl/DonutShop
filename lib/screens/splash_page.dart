import 'package:codelab_4/screens/donut_shop_main_page.dart';
import 'package:codelab_4/utils.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  AnimationController? donutController;
  Animation<double>? rotationAnimation;

  @override
  void initState() {
    super.initState();
    donutController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat();

    rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(parent: donutController!, curve: Curves.linear));
  }

  @override
  void dispose() {
    donutController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => DonutShopMain()));
    });

    return Scaffold(
      backgroundColor: Utils.mainColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RotationTransition(
                turns: rotationAnimation!,
                child: Image.network(Utils.donutLogoWhiteNoText,
                    width: 100, height: 100)),
            Image.network(Utils.donutLogoWhiteText, width: 150, height: 150),
          ],
        ),
      ),
    );
  }
}
