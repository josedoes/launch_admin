#!/bin/zsh

flutter clean
flutter build web --release
firebase deploy
