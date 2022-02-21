import 'package:flutter/material.dart';
import 'package:hd_getx_module/app/wateros_widgets/packages/address_widget/address.dart';

Map<WidgetMapping, Widget> mappingWidget(
  Widget titleWidget,
  Widget menu,
  Widget streetLabel,
  Widget townLabel,
  Widget postCodeLabel,
  Widget cityLabel,
  Widget districtLabel,
  Widget wardLabel,
  Widget streetTextfield,
  Widget townTextfield,
  Widget postCodeTextfield,
  Widget cityDropdown,
  Widget districtDropdown,
  Widget wardDropdown,
  Widget example,
) {
  Map<WidgetMapping, Widget> map = {};
  map.putIfAbsent(WidgetMapping.title, () => titleWidget);
  map.putIfAbsent(WidgetMapping.menu, () => menu);
  map.putIfAbsent(WidgetMapping.labelStreet, () => streetLabel);
  map.putIfAbsent(WidgetMapping.labelTown, () => townLabel);
  map.putIfAbsent(WidgetMapping.labelPostcode, () => postCodeLabel);
  map.putIfAbsent(WidgetMapping.labelCity, () => cityLabel);
  map.putIfAbsent(WidgetMapping.labelDistrict, () => districtLabel);
  map.putIfAbsent(WidgetMapping.labelWard, () => wardLabel);
  map.putIfAbsent(WidgetMapping.fieldStreet, () => streetTextfield);
  map.putIfAbsent(WidgetMapping.fieldTown, () => townTextfield);
  map.putIfAbsent(WidgetMapping.fieldPostcode, () => postCodeTextfield);
  map.putIfAbsent(WidgetMapping.fieldCity, () => cityDropdown);
  map.putIfAbsent(WidgetMapping.fieldDistrict, () => districtDropdown);
  map.putIfAbsent(WidgetMapping.fieldWard, () => wardDropdown);
  map.putIfAbsent(WidgetMapping.example, () => example);
  return map;
}
