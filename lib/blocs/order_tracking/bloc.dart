import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_tracking_app/utils/models/order.dart';
import 'package:location/location.dart';

part 'events.dart';

part 'states.dart';

class OrderTrackingBloc extends Bloc<OrderTrackingEvent, OrderTrackingState> {
  Location location = Location();

  OrderTrackingBloc() : super(OrderTrackingInitialState()) {
    on<FetchCurrentLocationEvent>(fetchCurrentLocationEvent);
  }

  FutureOr<void> fetchCurrentLocationEvent(
      FetchCurrentLocationEvent event, Emitter<OrderTrackingState> emit) async {
    emit(CurrentLocationFetchingState());
    try {
      final locationData = await location.getLocation();
      emit(LocationUpdatedState(location: locationData));
    } catch(_) {
      emit(UnableToFetchCurrentLocationErrorState());
    }
  }
}
