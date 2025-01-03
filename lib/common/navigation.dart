import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ignore: non_constant_identifier_names
Widget Navigation({
  required BuildContext context,
  required String img1,
  required String img2,
  required String img3,
}) {
  final mediaQuery = MediaQuery.of(context);

  return Padding(
    padding: const EdgeInsets.only(top: 50, left: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            img1,
            // 'assets/logo/N.svg',
          ),
        ),
        SizedBox(
          width: mediaQuery.size.width / 2,
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            img2,
            // 'assets/logo/notification.svg',
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            img3,
            // 'assets/logo/message-text.svg',
          ),
        ),
      ],
    ),
  );
}
