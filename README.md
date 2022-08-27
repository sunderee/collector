# Collector

No ads, open-source blood pressure diary app.

## Usage

Make sure you have the latest stable version of Flutter installed on your system. Run `setup.sh` to install dependencies and run code generation tasks.

```
$ bash setup.sh

# Alternatively, you can do it yourself
$ flutter pub get
$ flutter pub run build_runner build --delete-conflicting-outputs
```

You can now run the app with `flutter run`. Currently, we only support Android.

## Motivation & Acknowledgement

Health-related data is private data. It's between you and your physician. The sole purpose of this app is to keep blood pressure readings locally on your device. That's it. No analytics or syncing to cloud. If you want to, you can export your data in a JSON format; but it's on you to determine what to do with it.

No ads: privacy over money. This is not an app from which I plan on making a dime. I made it for myself, and I'm putting it in public domain for everyone else to use/modify as well.

Launcher icon: [Pulse SVG Vector](https://www.svgrepo.com/svg/141568/pulse).

<a href='https://play.google.com/store/apps/details?id=com.peteralexbizjak.collector&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1'><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png'/></a>
