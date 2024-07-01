part of 'bloc.dart';

sealed class OrderTrackingEvent {}

class FetchCurrentLocationEvent extends OrderTrackingEvent {}