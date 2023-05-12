import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

PreferredSize profileAppBar(BuildContext context) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(120),
    child: Container(
      color: RedColor,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
              iconSize: 32.0,
            ),
          ),
          Expanded(
            flex: 2,
            child: Center(
              child: Image.asset(
                'assets/logo_white.png',
                height: 120.0,
              ),
            ),
          ),
          const SizedBox(
            width: 88,
          ),
        ],
      ),
    ),
  );
}
