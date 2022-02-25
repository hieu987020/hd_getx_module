import 'package:flutter/material.dart';
import 'package:hd_getx_module/app/wateros_widgets/packages/address_widget/address.dart';

/// [StyleOneColumn] is Address widget in two column style
class StyleOneColumn extends StatelessWidget {
  const StyleOneColumn({Key? key, required this.map}) : super(key: key);

  final Map<WidgetMapping, Widget> map;
  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      policy: OrderedTraversalPolicy(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              map[WidgetMapping.title]!,
              FocusTraversalOrder(
                order: const NumericFocusOrder(1),
                child: map[WidgetMapping.menu]!,
              ),
            ],
          ),
          Row(
            children: [
              map[WidgetMapping.labelStreet]!,
              FocusTraversalOrder(
                order: const NumericFocusOrder(2),
                child: map[WidgetMapping.fieldStreet]!,
              ),
            ],
          ),
          Row(
            children: [
              map[WidgetMapping.labelTown]!,
              FocusTraversalOrder(
                order: const NumericFocusOrder(3),
                child: map[WidgetMapping.fieldTown]!,
              ),
            ],
          ),
          Row(
            children: [
              map[WidgetMapping.labelPostcode]!,
              FocusTraversalOrder(
                order: const NumericFocusOrder(4),
                child: map[WidgetMapping.fieldPostcode]!,
              ),
            ],
          ),
          Row(
            children: [
              map[WidgetMapping.labelCity]!,
              FocusTraversalOrder(
                order: const NumericFocusOrder(5),
                child: map[WidgetMapping.fieldCity]!,
              ),
            ],
          ),
          Row(
            children: [
              map[WidgetMapping.labelDistrict]!,
              FocusTraversalOrder(
                order: const NumericFocusOrder(6),
                child: map[WidgetMapping.fieldDistrict]!,
              ),
            ],
          ),
          Row(
            children: [
              map[WidgetMapping.labelWard]!,
              FocusTraversalOrder(
                order: const NumericFocusOrder(7),
                child: map[WidgetMapping.fieldWard]!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
