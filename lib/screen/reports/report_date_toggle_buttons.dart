import 'package:flutter/material.dart';

class DateToggleButtons extends StatefulWidget {
  const DateToggleButtons({super.key});

  @override
  State<DateToggleButtons> createState() => _DateToggleButtonsState();
}

class _DateToggleButtonsState extends State<DateToggleButtons> {
  List<bool> isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: isSelected,
      borderRadius: BorderRadius.circular(8),
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('Last Day',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('Last Week',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text('Last Month',
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ),
      ],
      onPressed: (int newIndex) {
        setState(() {
          for (int index = 0; index < isSelected.length; index++) {
            if (index == newIndex) {
              isSelected[index] = true;
            } else {
              isSelected[index] = false;
            }
          }
        });
      },
    );
  }
}
