import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


var aidadatecontroller = TextEditingController();

void getSaidaName (pickeddate ) {

aidadatecontroller.text = DateFormat('dd-MM-yyyy').format(pickeddate);
String dateString = '2021-05-30';
DateTime dateTime = DateTime.parse(dateString);
}
