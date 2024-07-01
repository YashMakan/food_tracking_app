import 'package:food_tracking_app/blocs/order/bloc.dart';
import 'package:food_tracking_app/blocs/order_tracking/bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton(OrderTrackingBloc());
  sl.registerSingleton(OrderBloc());
}