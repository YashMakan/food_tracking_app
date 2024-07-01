import 'package:food_tracking_app/utils/models/order_status.dart';
import 'package:food_tracking_app/utils/models/product.dart';
import 'package:food_tracking_app/utils/models/user.dart';

class OrderModel {
  final UserModel user;
  final UserModel? agent;
  final ProductModel product;
  final OrderStatus orderStatus;

  OrderModel({
    required this.user,
    this.agent,
    required this.product,
    required this.orderStatus,
  });
}
