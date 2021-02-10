import 'package:booking_service/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:intl/intl.dart';

class BottomSheet extends StatefulWidget {
  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  static final date = DateTime.now();
  static List<String> items;
  static String _currentValue;

  TextEditingController _dateController = TextEditingController();
  TextEditingController _nightController = TextEditingController();
  TextEditingController _guestController = TextEditingController();
  TextEditingController _bedRoomController = TextEditingController();
  TextEditingController _destinationController = TextEditingController();
  RangeValues _currentRangeValues;

  @override
  void initState() {
    super.initState();
    _currentRangeValues = RangeValues(0, 100);
    _dateController.text = DateFormat.yMMMd().format(date);
    items = ['Type 1', 'Type 2', 'Type 3', 'Type 4'];
    _currentValue = items[0];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      height: height * .9,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "New Application",
              style: TextStyle(
                color: BrandColors.fontColor,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12),
            Text(
              "Non nostrud nulla commodo dolore non laboris.\nIncididunt id eu nulla veniam.",
              style: TextStyle(
                color: BrandColors.fontColor,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Destination",
              style: TextStyle(
                  color: BrandColors.fontColor, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            getTextField(
              "Destination",
              controller: _destinationController,
              suffixIcon: Icons.cancel,
              onPressed: () {},
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date",
                          style: TextStyle(
                              color: BrandColors.fontColor,
                              fontWeight: FontWeight.bold),
                        ),
                        getTextField(
                          "Date",
                          controller: _dateController,
                          keyboardType: TextInputType.datetime,
                          suffixIcon: Icons.calendar_today,
                          onPressed: () {
                            DatePicker.showDatePicker(
                              context,
                              showTitleActions: true,
                              minTime: DateTime.now(),
                              maxTime: DateTime(2025, 6, 7),
                              onChanged: (date) {
                                print('$date');
                                setState(() {
                                  _dateController.text =
                                      DateFormat.yMMMd().format(date);
                                });
                              },
                              onConfirm: (date) {
                                print('confirm $date');
                              },
                              currentTime: DateTime.now(),
                              locale: LocaleType.en,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Nights",
                          style: TextStyle(
                              color: BrandColors.fontColor,
                              fontWeight: FontWeight.bold),
                        ),
                        getTextField(
                          "10",
                          controller: _nightController,
                          keyboardType: TextInputType.number,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Guests",
                          style: TextStyle(
                              color: BrandColors.fontColor,
                              fontWeight: FontWeight.bold),
                        ),
                        getTextField(
                          "2",
                          controller: _guestController,
                          keyboardType: TextInputType.number,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bedroom",
                          style: TextStyle(
                            color: BrandColors.fontColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        getTextField(
                          "1",
                          controller: _bedRoomController,
                          keyboardType: TextInputType.number,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "Type",
              style: TextStyle(
                color: BrandColors.fontColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 1.0,
                    style: BorderStyle.solid,
                    color: BrandColors.fontColor,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
              ),
              child: DropdownButton(
                isExpanded: true,
                value: _currentValue,
                items: items.map((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _currentValue = newValue;
                  });
                },
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price",
                    style: TextStyle(
                      color: BrandColors.fontColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${_currentRangeValues.start}\$-${_currentRangeValues.end}\$',
                    style: TextStyle(
                      color: BrandColors.darkPurple,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            RangeSlider(
              values: _currentRangeValues,
              min: 0,
              max: 1000,
              inactiveColor: Colors.grey.shade300,
              activeColor: BrandColors.darkPurple,
              divisions: 10,
              labels: RangeLabels(
                _currentRangeValues.start.round().toString(),
                _currentRangeValues.end.round().toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _currentRangeValues = values;
                });
              },
            ),
            Center(
              child: MaterialButton(
                onPressed: () {},
                height: 40,
                color: BrandColors.yellow,
                minWidth: width / 1.5,
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 16,
                    color: BrandColors.textYellow,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getTextField(
    String labelText, {
    TextInputType keyboardType,
    IconData suffixIcon,
    Function onPressed,
    TextEditingController controller,
  }) {
    return Expanded(
      child: TextField(
        controller: controller,
        keyboardType: keyboardType ?? TextInputType.text,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: BrandColors.fontColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: BrandColors.fontColor),
            ),
            focusColor: BrandColors.fontColor,
            hoverColor: BrandColors.fontColor,
            border: OutlineInputBorder(),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            labelText: labelText,
            suffixIcon: IconButton(
              onPressed: onPressed,
              icon: Icon(
                suffixIcon,
                color: BrandColors.fontColor,
              ),
            )),
      ),
    );
  }
}
