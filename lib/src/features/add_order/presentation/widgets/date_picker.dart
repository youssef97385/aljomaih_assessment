import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePicker extends StatefulWidget {
  String? selectedDate;
  Function(String date)? onSelectionChanged;

  DatePicker(
      this.selectedDate, {
        Key? key,
        this.onSelectionChanged,
      }) : super(key: key);

  @override
  DatePickerState createState() => DatePickerState();
}

class DatePickerState extends State<DatePicker> {
  bool isDateExpanded = false;
  String? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.selectedDate!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        InkWell(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 0),
            decoration: BoxDecoration(
              border: Border.all(
                  width: 1.5, style: BorderStyle.solid),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: ListTile(
                onTap: () {
                  setState(() {
                    isDateExpanded = !isDateExpanded;
                  });
                },
                leading: const Icon(Icons.calendar_month),
                title: selectedDate?.isNotEmpty ?? false
                    ? Text(
                  DateFormat(
                    'yyyy-MM-dd',
                  ).format(
                      DateTime.tryParse(selectedDate!) ?? DateTime(1990)),
                  style: Theme.of(context).textTheme.subtitle1,
                )
                    : null,
                trailing: isDateExpanded
                    ? const Icon(Icons.keyboard_arrow_up_rounded,
                    color: Colors.black, size: 30)
                    : const Icon(Icons.keyboard_arrow_down_rounded,
                    color: Colors.black, size: 30),
              ),
            ),
          ),
        ),
        getDateContainer()
      ],
    );
  }

  Widget getDateContainer() {
    return Visibility(
      visible: isDateExpanded,
      child: Container(
        decoration: BoxDecoration(
          border:
          Border.all( width: 1.0, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(12),
          color: Colors.transparent,
        ),
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
        height: 325,
        child: SfDateRangePicker(
          initialDisplayDate: DateTime.tryParse(widget.selectedDate ?? ''),
          onSelectionChanged: (date) {
            selectedDate = date.value.toString();
            String dob = DateFormat(
              'yyyy-MM-dd',
            ).format(DateTime.tryParse(selectedDate!) ?? DateTime(1990));
            widget.onSelectionChanged!(dob ?? '');
            setState(() {});
          },
          toggleDaySelection: false,
          showNavigationArrow: true,
          selectionTextStyle: Theme.of(context).textTheme.subtitle1,
          monthCellStyle: DateRangePickerMonthCellStyle(
            textStyle: Theme.of(context).textTheme.subtitle2,
          ),
          selectionMode: DateRangePickerSelectionMode.single,
        ),
      ),
    );
  }
}
