import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_tracking_app/utils/constants.dart';
import 'package:food_tracking_app/utils/models/user.dart';

class UserDetailsWidget extends StatelessWidget {
  final UserModel? user;

  const UserDetailsWidget({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: user != null
            ? Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                  ),
                  const SizedBox(width: 16),
                  DefaultTextStyle(
                    style: const TextStyle(color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${user!.firstName[0]}. ${user!.lastName[0]}",
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(user!.phoneNumber),
                      ],
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.call_outlined,
                        color: Colors.white,
                      ))
                ],
              )
            : const SizedBox(
                height: 40,
                width: double.infinity,
                child: Row(
                  children: [
                    Text(
                      "Finding agent nearby...",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(width: 10),
                    CupertinoActivityIndicator(
                      color: Colors.white,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
