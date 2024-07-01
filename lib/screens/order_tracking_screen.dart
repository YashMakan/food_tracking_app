import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_tracking_app/blocs/order/bloc.dart';
import 'package:food_tracking_app/blocs/order_tracking/bloc.dart';
import 'package:food_tracking_app/components/order_details_section.dart';
import 'package:food_tracking_app/components/product_details_widget.dart';
import 'package:food_tracking_app/components/user_details_widget.dart';
import 'package:food_tracking_app/utils/dependencies.dart';
import 'package:food_tracking_app/utils/enums.dart';
import 'package:food_tracking_app/utils/models/order.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderTrackingScreen extends StatefulWidget {
  final OrderModel order;
  final bool isAgent;

  const OrderTrackingScreen({
    super.key,
    required this.order,
    this.isAgent = false,
  });

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  final orderTrackingBloc = sl<OrderTrackingBloc>();
  final orderBloc = sl<OrderBloc>();

  @override
  void initState() {
    orderBloc.order = widget.order;
    if (widget.isAgent) {
      orderBloc.add(UpdateOrderStatusEvent(OrderStatusType.pickingOrder));
    }
    // get current location
    orderTrackingBloc.add(FetchCurrentLocationEvent());

    // check if the process of assigning order to delivery agent is initiated or not
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder(
            bloc: orderTrackingBloc,
            builder: (context, state) {
              if (state is LocationUpdatedState) {
                return GoogleMap(
                  initialCameraPosition: CameraPosition(
                      zoom: 13.5,
                      target: LatLng(
                        state.location.latitude!,
                        state.location.longitude!,
                      )),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: width,
              height: height / 1.9,
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        UserDetailsWidget(
                            user: widget.isAgent
                                ? orderBloc.order.user
                                : orderBloc.order.agent),
                        const SizedBox(height: 28),
                        BlocBuilder(
                            bloc: orderBloc,
                            builder: (context, state) {
                              return OrderDetailsSection(
                                  orderStatus: orderBloc.order.orderStatus,
                                  isAgent: widget.isAgent);
                            }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),
                  ProductDetailsWidget(product: orderBloc.order.product),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
