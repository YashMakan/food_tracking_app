import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_tracking_app/utils/enums.dart';
import 'package:food_tracking_app/utils/models/order.dart';

part 'events.dart';

part 'states.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  late OrderModel order;

  OrderBloc() : super(OrderInitialState()) {
    on<UpdateOrderStatusEvent>(updateOrderStatusEvent);
  }

  FutureOr<void> updateOrderStatusEvent(
      UpdateOrderStatusEvent event, Emitter<OrderState> emit) {
    emit(UpdatingOrderStatusState());
    order.orderStatus.orderStatusType = event.orderStatusType;
    emit(OrderStatusUpdatedState());
  }
}
