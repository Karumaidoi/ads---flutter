import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AdPage(),
    );
  }
}

class AdPage extends StatefulWidget {
  const AdPage({super.key});

  @override
  State<AdPage> createState() => _AdPageState();
}

BannerAd? myBannerAd;

class _AdPageState extends State<AdPage> {
  @override
  void initState() {
    myBannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-8889406004412478/9566169723',
        listener: BannerAdListener(),
        request: AdRequest());

    myBannerAd!.load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AdWidget adWidget = AdWidget(ad: myBannerAd!);

    final Container adContainer = Container(
      width: myBannerAd!.size.width.toDouble(),
      height: myBannerAd!.size.height.toDouble(),
      child: adWidget,
    );
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: 50,
        width: 200,
        child: adContainer,
      ),
    );
  }
}
