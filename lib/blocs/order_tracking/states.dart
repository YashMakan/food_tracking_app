part of 'bloc.dart';

sealed class OrderTrackingState {}

class OrderTrackingInitialState extends OrderTrackingState {}

class CurrentLocationFetchingState extends OrderTrackingState {}

class LocationUpdatedState extends OrderTrackingState {
  final LocationData location;

  LocationUpdatedState({required this.location});
}

class UnableToFetchCurrentLocationErrorState extends OrderTrackingState {}
