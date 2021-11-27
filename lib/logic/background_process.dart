import 'dart:async';

class BackgroundProcess {
  factory BackgroundProcess() {
    return _singleton;
  }

  BackgroundProcess._internal();
  static final BackgroundProcess _singleton = BackgroundProcess._internal();

  Future<void> backgroundScan(
      {required Duration interval,required void Function(Timer t) function}) async {
    Timer.periodic(interval, (Timer t) => function(t));
  }
}
