import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuitQuizButton extends StatelessWidget {
  const QuitQuizButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Row(
        children: [
          const Icon(
            Icons.power_settings_new,
            color: Colors.white70,
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            'Quit Quiz',
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.w600,
              fontSize: 18.sp,
            ),
          ),
        ],
      ),
    );
  }
}
