import 'package:firebaseauth/API/google_ads.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
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

class _AdPageState extends State<AdPage> {
  BannerAd? myBannerAd;

  @override
  void initState() {
    myBannerAd = GoogleAds().setBanner();
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
      appBar: AppBar(
        title: const Text(
          'Test AdUnit',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: 100,
            width: double.infinity,
            child: adContainer,
          )
        ],
      ),
    );
  }
}
