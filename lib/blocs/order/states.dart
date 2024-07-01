part of 'bloc.dart';

sealed class OrderState {}

class OrderInitialState extends OrderState {}

class UpdatingOrderStatusState extends OrderState {}

class OrderStatusUpdatedState extends OrderState {}
