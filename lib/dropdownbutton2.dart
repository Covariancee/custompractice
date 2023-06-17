import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
//
// DropdownButtonHideUnderline(
// child: DropdownButton2(
// alignment: Alignment.center,
// isExpanded: true,
// hint: const Row(
// children: [
// Icon(
// Icons.list,
// size: 16,
// color: Colors.yellow,
// ),
// SizedBox(
// width: 4,
// ),
// Expanded(
// child: Text(
// 'Select City',
// style: TextStyle(fontSize: 14),
// overflow: TextOverflow.ellipsis,
// ),
// ),
// ],
// ),
// value: selectedCityName,
// onChanged: (String? value) {
// setState(() {
// selectedCityName = value!;
// if (value == null || value.isEmpty) {
// isCitySelected = true;
// isRegionVisible = false;
// } else {
// isRegionVisible = true;
// isCitySelected = false;
// }
// selectedReigon = null;
// });
// },
// items: city.map<DropdownMenuItem<String>>((String value) {
// return DropdownMenuItem<String>(
// value: value,
// child: Text(value == '' ? 'Select' : value),
// );
// }).toList(),
// buttonStyleData: ButtonStyleData(
// height: 50,
// width: 160,
// padding: const EdgeInsets.only(left: 14, right: 14),
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(14),
// border: Border.all(
// color: Colors.black26,
// ),
// color: Colors.amber,
//
// ///theme datadan renk çekilecek
// ),
// elevation: 2,
// ),
// iconStyleData: const IconStyleData(
// icon: Icon(
// Icons.arrow_forward_ios_outlined,
// ),
// iconSize: 14,
// iconEnabledColor: Colors.yellow,
// iconDisabledColor: Colors.grey,
// ),
// dropdownStyleData: DropdownStyleData(
// maxHeight: 200,
// width: 200,
// padding: null,
// decoration: BoxDecoration(
// borderRadius: BorderRadius.circular(14),
// color: Colors.amber,
//
// ///themedatadan renk çekilecek//
// ),
// elevation: 8,
// offset: const Offset(-20, 0),
// scrollbarTheme: ScrollbarThemeData(
// radius: const Radius.circular(40),
// thickness: MaterialStateProperty.all<double>(6),
// thumbVisibility: MaterialStateProperty.all<bool>(true),
// ),
// ),
// menuItemStyleData: const MenuItemStyleData(
// height: 40,
// padding: EdgeInsets.only(left: 14, right: 14),
// ),
// ),
// ),
