#!/usr/bin/env bash
flutter clean
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter build appbundle \
    --obfuscate \
    --split-debug-info=symbols