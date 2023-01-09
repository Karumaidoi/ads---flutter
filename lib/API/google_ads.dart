import 'package:google_mobile_ads/google_mobile_ads.dart';

class GoogleAds {
  BannerAd? myBannerAd;

  loadBanner() {
    myBannerAd = myBannerAd = BannerAd(
        size: AdSize.banner,
        adUnitId: 'ca-app-pub-3940256099942544/6300978111',
        listener: const BannerAdListener(),
        request: const AdRequest());

    myBannerAd!.load();
    return myBannerAd;
  }
}
