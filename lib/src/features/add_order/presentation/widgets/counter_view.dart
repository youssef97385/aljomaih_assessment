import 'package:flutter/material.dart';

import '../../../../core/common/widgets/button_view.dart';
import '../../../../core/common/widgets/text_view.dart';



class CounterView extends StatefulWidget {
  final Function(int) onValueChnage;
  final int? initialValue;

  const CounterView({
    Key? key,
    required this.initialValue,
    required this.onValueChnage,
  }) : super(key: key);

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  int? currentIntValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          // color: Theme.of(context).colorScheme.background,
        ),
        child: Row(
          children: [
            ButtonView(

              icon: Icons.remove,
              buttonType: ButtonType.iconButton,

              onClick: () => setState(() {
                if (currentIntValue == null) {
                  return;
                }

                if (currentIntValue! > 0) {
                  currentIntValue = currentIntValue! - 1;
                  widget.onValueChnage(currentIntValue!);
                }
              }),
            ),
            TextView(
              text: widget.initialValue != null
                  ? widget.initialValue.toString()
                  : currentIntValue == null
                  ? ' - '
                  : currentIntValue.toString(),
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ButtonView(

              icon: Icons.add,
              buttonType: ButtonType.iconButton,

              onClick: () => setState(
                    () {
                  if (currentIntValue == null) {
                    currentIntValue = 0;
                    widget.onValueChnage(currentIntValue ?? 0);
                    return;
                  }

                  if (currentIntValue! < 100) {
                    currentIntValue = currentIntValue! + 1;
                    widget.onValueChnage(currentIntValue!);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
