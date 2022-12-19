@JS()
library;

import 'package:js/js.dart';
import 'package:meta/meta.dart';

@optionalTypeArgs
typedef EventHandler<T extends Event> = void Function(T event);

@JS()
@staticInterop
class Event {}

@JS()
@staticInterop
class MessageEvent implements Event {
  external factory MessageEvent(String type);
}

extension MessageEventExtension on MessageEvent {
  external Object? get data;
}
