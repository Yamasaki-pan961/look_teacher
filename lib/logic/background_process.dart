import 'dart:async';

// よくわかっていない、バックグラウンド処理の方法
class BackgroundProcess {
  factory BackgroundProcess() {
    return _singleton;
  }

  BackgroundProcess._internal();
  static final BackgroundProcess _singleton = BackgroundProcess._internal();

  Timer periodic(
      {required Duration interval,required void Function(Timer t) function}) {
    return Timer.periodic(interval, (Timer t) => function(t));
  }
}
