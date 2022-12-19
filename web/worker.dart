import 'package:worker/dedicated.dart';
import 'package:worker/event.dart';

void main() {
  self.onMessage = onMessage;
}

void onMessage(MessageEvent event) {
  self.postMessage('hello ${event.data}!');
}
