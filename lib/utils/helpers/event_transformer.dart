import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';


EventTransformer<E> debounce<E>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).switchMap(mapper);
}

EventTransformer<E> delay<E>(Duration duration) {
  return (events, mapper) => events.delay(duration).switchMap(mapper);
}

EventTransformer<E> skip<E>(int count) {
  return (events, mapper) => events.skip(count).switchMap(mapper);
}

EventTransformer<E> throttle<E>(Duration duration) {
  return (events, mapper) => events.throttleTime(duration).switchMap(mapper);
}
