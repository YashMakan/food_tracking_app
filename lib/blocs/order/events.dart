part of 'bloc.dart';

sealed class OrderEvent {}

class UpdateOrderStatusEvent extends OrderEvent {
  final OrderStatusType orderStatusType;

  UpdateOrderStatusEvent(this.orderStatusType);
}