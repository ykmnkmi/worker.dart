@JS()
library;

import 'package:js/js.dart';
import 'package:worker/event.dart';

@JS()
@staticInterop
class WorkerGlobalScope {}

extension on WorkerGlobalScope {
  @JS()
  external EventHandler<Event>? onerror;
}

extension WorkerGlobalScopeExtension on WorkerGlobalScope {
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
}
