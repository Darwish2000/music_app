import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String icon;
  final String text;
  final Color color;
  bool isShuffle;

  CustomButton(
      {Key? key,
      required this.icon,
      required this.text,
      required this.color,
      this.isShuffle = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 39,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40), // Set border radius
            side: BorderSide(
                color: !isShuffle
                    ? Colors.white
                    : Colors.transparent), // Set border color
          ),
        ),
        child: Row(
          mainAxisSize:MainAxisSize.min,
          children: [
            Image.asset(icon),
            const SizedBox(
              width: 7.71,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
