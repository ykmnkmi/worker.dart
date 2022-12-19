@JS()
library;

import 'package:js/js.dart';
import 'package:worker/event.dart';

@JS()
@staticInterop
class Worker {
  external factory Worker(String url);
}

extension on Worker {
  @JS()
  external EventHandler<Event>? onerror;

  @JS()
  external EventHandler<MessageEvent>? onmessage;

  @JS()
  external EventHandler<MessageEvent>? onmessageerror;
}

extension WorkerExtension on Worker {
  EventHandler<Event>? get onError {
    return onerror;
  }

  set onError(EventHandler<Event>? eventHandler) {
    if (eventHandler == null) {
      onerror = null;
    } else {
      onerror = allowInterop(eventHandler);
    }
  }

  EventHandler<MessageEvent>? get onMessage {
    return onmessage;
  }

  set onMessage(EventHandler<MessageEvent>? eventHandler) {
    if (eventHandler == null) {
      onmessage = null;
    } else {
      onmessage = allowInterop(eventHandler);
    }
  }

  EventHandler<MessageEvent>? get onMessageError {
    return onmessageerror;
  }

  set onMessageError(EventHandler<MessageEvent>? eventHandler) {
    if (eventHandler == null) {
      onmessageerror = null;
    } else {
      onmessageerror = allowInterop(eventHandler);
    }
  }

  external void postMessage(Object? message);

  external void terminate();
}
