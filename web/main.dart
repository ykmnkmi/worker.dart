import 'package:worker/event.dart';
import 'package:worker/worker.dart';

void main() {
  var worker = Worker('worker.dart.js');
  worker.onMessage = onMessage;
  worker.postMessage('jhon');
}

void onMessage(MessageEvent event) {
  print(event.data);
}
