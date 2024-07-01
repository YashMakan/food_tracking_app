import 'package:food_tracking_app/utils/enums.dart';

class OrderStatus {
  Duration? duration;
  OrderStatusType orderStatusType;

  OrderStatus({
    this.duration,
    required this.orderStatusType,
  });

  OrderStatusType? getNextStatus() {
    switch (orderStatusType) {
      case OrderStatusType.notAssigned:
        return OrderStatusType.pickingOrder;
      case OrderStatusType.pickingOrder:
        return OrderStatusType.inTransact;
      case OrderStatusType.inTransact:
        return OrderStatusType.delivered;
      case OrderStatusType.delivered:
        return null;
    }
  }

  bool isBefore(OrderStatusType currentOrderStatusType) {
    return orderStatusType.index <= currentOrderStatusType.index;
  }

  String? get icon {
    switch (orderStatusType) {
      case OrderStatusType.notAssigned:
        return null;
      case OrderStatusType.pickingOrder:
        return "assets/order-status/picking-order.png";
      case OrderStatusType.inTransact:
        return "assets/order-status/in-transact.png";
      case OrderStatusType.delivered:
        return "assets/order-status/delivered.png";
    }
  }

  String get title {
    switch (orderStatusType) {
      case OrderStatusType.notAssigned:
        return "Yet to be assigned";
      case OrderStatusType.pickingOrder:
        return "Order Picking";
      case OrderStatusType.inTransact:
        return "On the way";
      case OrderStatusType.delivered:
        return "Delivered";
    }
  }

  String? get buttonText {
    switch (orderStatusType) {
      case OrderStatusType.pickingOrder:
        return "PICKED";
      case OrderStatusType.inTransact:
        return "DELIVER";
      default:
        return null;
    }
  }
}
