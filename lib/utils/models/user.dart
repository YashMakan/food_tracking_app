import 'package:food_tracking_app/utils/enums.dart';

class UserModel {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final UserType userType;

  UserModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.userType,
  });
}
