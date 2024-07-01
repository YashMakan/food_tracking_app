import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:food_tracking_app/blocs/order/bloc.dart';
import 'package:food_tracking_app/utils/constants.dart';
import 'package:food_tracking_app/utils/dependencies.dart';
import 'package:food_tracking_app/utils/enums.dart';
import 'package:food_tracking_app/utils/models/order_status.dart';

class OrderDetailsSection extends StatelessWidget {
  final OrderStatus orderStatus;
  final bool isAgent;

  const OrderDetailsSection({
    super.key,
    required this.orderStatus,
    required this.isAgent,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        OrderStatusWidget(
          currentOrderStatus: orderStatus,
          isAgent: isAgent,
          orderStatus: OrderStatus(
            orderStatusType: OrderStatusType.pickingOrder,
          ),
        ),
        const ProgressDivider(),
        OrderStatusWidget(
          currentOrderStatus: orderStatus,
          isAgent: isAgent,
          orderStatus: OrderStatus(
            orderStatusType: OrderStatusType.inTransact,
          ),
        ),
        const ProgressDivider(),
        OrderStatusWidget(
          currentOrderStatus: orderStatus,
          isAgent: isAgent,
          orderStatus: OrderStatus(
            orderStatusType: OrderStatusType.delivered,
          ),
        ),
      ],
    );
  }
}

class OrderStatusWidget extends StatelessWidget {
  final OrderStatus orderStatus;
  final OrderStatus currentOrderStatus;
  final bool isAgent;

  const OrderStatusWidget({
    super.key,
    required this.orderStatus,
    required this.currentOrderStatus,
    required this.isAgent,
  });

  bool get isOrderBeforeCurrentOrder =>
      orderStatus.isBefore(currentOrderStatus.orderStatusType);

  bool get isCurrentOrderStatusSameAsOrder =>
      orderStatus.orderStatusType == currentOrderStatus.orderStatusType;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Container(
            width: 40,
            height: 40,
            color: isOrderBeforeCurrentOrder
                ? primaryColor
                : const Color(0xFFCECECE),
            child: Image.asset(
              orderStatus.icon!,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              orderStatus.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                "Estimated Time: ${isOrderBeforeCurrentOrder ? (orderStatus.duration.toString()) : "TBA"}"),
          ],
        ),
        const Spacer(),
        if (isAgent &&
            orderStatus.buttonText != null &&
            isCurrentOrderStatusSameAsOrder)
          ElevatedButton(
            onPressed: () {
              final nextStatus = orderStatus.getNextStatus();
              if (nextStatus != null) {
                sl<OrderBloc>().add(UpdateOrderStatusEvent(nextStatus));
              }
            },
            style: ElevatedButton.styleFrom(
                elevation: 0,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: isOrderBeforeCurrentOrder
                    ? primaryColor
                    : const Color(0xFFCECECE)),
            child: Text(orderStatus.buttonText!),
          )
      ],
    );
  }
}

class ProgressDivider extends StatelessWidget {
  const ProgressDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4).copyWith(left: 20),
      child: const SizedBox(
        height: 40 * 1.2,
        child: DottedLine(
          dashLength: 8,
          direction: Axis.vertical,
        ),
      ),
    );
  }
}
