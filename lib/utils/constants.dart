import 'dart:ui';

import 'package:food_tracking_app/utils/enums.dart';
import 'package:food_tracking_app/utils/models/order.dart';
import 'package:food_tracking_app/utils/models/order_status.dart';
import 'package:food_tracking_app/utils/models/product.dart';
import 'package:food_tracking_app/utils/models/user.dart';

final product = ProductModel(
  name: "Big Mac (1x)",
  amount: 14,
  currency: "\$",
  image: "https://img.freepik.com/free-photo/grilled-gourmet-burger-with-cheese-tomato-onion-french-fries-generated-by-artificial-intelligence_25030-63181.jpg",
  merchantName: "McDonald's, India",
);

OrderModel order = OrderModel(
  user: UserModel(
      firstName: "Yash",
      lastName: "Makan",
      phoneNumber: "+91 1234567890",
      userType: UserType.user),
  agent: null,
  product: product,
  orderStatus:
      OrderStatus(duration: null, orderStatusType: OrderStatusType.notAssigned),
);

const Color primaryColor = Color(0xFFEA4242);