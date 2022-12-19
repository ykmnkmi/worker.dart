@JS()
library;

import 'package:js/js.dart';
import 'package:worker/event.dart';
import 'package:worker/scope.dart';

@JS()
@staticInterop
class DedicatedWorkerGlobalScope implements WorkerGlobalScope {}

extension on DedicatedWorkerGlobalScope {
  @JS()
  external EventHandler<MessageEvent>? onmessage;

  @JS()
  external EventHandler<MessageEvent>? onmessageerror;
}

extension DedicatedWorkerGlobalScopeExtension on DedicatedWorkerGlobalScope {
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

  external void close();
}

@JS()
external DedicatedWorkerGlobalScope get self;
