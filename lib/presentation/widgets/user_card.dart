import 'package:flutter/material.dart';

import '../../common/style.dart';
import '../../data/models/user.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.user}) : super(key: key);
  final Users user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 1,
        ),
        ListTile(
          title: Text(
            "${user.firstName} ${user.lastName}",
            style: textInputStyle,
          ),
          leading:
              CircleAvatar(radius: 24, backgroundImage: NetworkImage(user.url)),
          subtitle: Text("${user.email}@gmail.com"),
          onTap: () =>
              Navigator.pop(context, "${user.firstName} ${user.lastName}"),
        ),
        const SizedBox(
          height: 2,
        ),
        Container(
          height: .7,
          color: const Color(0xFFE2E3E4),
        )
      ],
    );
  }
}
