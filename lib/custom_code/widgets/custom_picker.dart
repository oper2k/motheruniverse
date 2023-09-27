// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// import '/custom_code/actions/index.dart'; // Imports custom actions

//itemExtent - вертикальный паддинг между каждым элементом в списке.
//borderRadius - радиус углов для контйнера с пикером.
//lineColor - цвет полоски по середине пикера. Там уже автоматически длобавлен opacity 0.35. Так что цвет добавляй уже с учетом opacity.
//horizontalPadding - горизонтальное расстояние от экрана  внутри контейнера
//initialItemIndexFirst,  initialItemIndexSecond, initialItemIndexThird - начальный индекс каждого массива. Если не передаешь значение то равен 0
//79 строчка - добавить аппстейты которые необходимо изменять при выборе. В аапстейт попадает индекс элемента из списка
//    setState(() {
//      FFAppState().itemIndex1 = index;  //itemIndex1 - название вашего аппстейта
//    });
import 'dart:developer';

import 'package:collection/collection.dart';

class CustomPicker extends StatefulWidget {
  const CustomPicker({
    Key? key,
    required this.items1,
    this.items2,
    this.items3,
    this.horizontalPadding,
    this.height,
    this.width,
    this.backgroundColor,
    this.lineColor,
    this.textColor,
    this.initialItemIndexFirst,
    this.initialItemIndexSecond,
    this.initialItemIndexThird,
    this.itemExtent,
    this.borderRadius,
    this.textSizeItem1,
    this.textSizeItem2,
    this.textSizeItem3,
  }) : super(key: key);

  final List<String> items1;
  final List<String>? items2;
  final List<String>? items3;
  final int? initialItemIndexFirst;
  final int? initialItemIndexSecond;
  final int? initialItemIndexThird;
  final double? horizontalPadding;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final Color? lineColor;
  final Color? textColor;
  final double? itemExtent;
  final double? borderRadius;
  final double? textSizeItem1;
  final double? textSizeItem2;
  final double? textSizeItem3;

  @override
  State<CustomPicker> createState() => _CustomPickerState();
}

class _CustomPickerState extends State<CustomPicker> {
  List<List<dynamic>> _items = [];
  List<int> _initialIndexes = [];

  @override
  void initState() {
    _items = [
      widget.items1,
      if (widget.items2 != null) widget.items2!,
      if (widget.items3 != null) widget.items3!,
    ];
    _initialIndexes = [
      widget.initialItemIndexFirst ?? 0,
      widget.initialItemIndexSecond ?? 0,
      widget.initialItemIndexThird ?? 0,
    ];
    super.initState();
  }

  void _onFirstItemsChanged(int index) {
    setState(() {
      FFAppState().customPickerItemIndex1 = index;
    });
    log('First: $index');
  }

  void _onSecondItemsChanged(int index) {
    setState(() {
      FFAppState().customPickerItemIndex2 = index;
    });
    log('Second: $index');
  }

  void _onThirdItemsChanged(int index) {
    setState(() {
      FFAppState().customPickerItemIndex3 = index;
    });
    log('Third: $index');
  }

  void _onChangedItemHandler(int itemIndex, int valueIndex) {
    switch (itemIndex) {
      case 0:
        _onFirstItemsChanged(valueIndex);
        break;
      case 1:
        _onSecondItemsChanged(valueIndex);
        break;
      case 2:
        _onThirdItemsChanged(valueIndex);
        break;
    }
  }

  double? _getTextSize(int index) => switch (index) {
        0 => widget.textSizeItem1,
        1 => widget.textSizeItem2,
        _ => widget.textSizeItem3,
      };

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 0)),
      padding: widget.horizontalPadding == null
          ? const EdgeInsets.symmetric(vertical: 12)
          : EdgeInsets.symmetric(
              horizontal: widget.horizontalPadding!, vertical: 12),
      child: Stack(
        children: [
          Center(
            child: IntrinsicWidth(
              child: SizedBox(
                width: size.width,
                child: Row(
                    children: _items
                        .mapIndexed(
                          (i, items) => Flexible(
                            child: _ListWheel(
                              items: items,
                              initialIndex: _initialIndexes[i],
                              onItemChanged: (index) =>
                                  _onChangedItemHandler(i, index),
                              itemExtent: widget.itemExtent,
                              lineColor: widget.lineColor,
                              textColor: widget.textColor,
                              textSize: _getTextSize(i),
                            ),
                          ),
                        )
                        .toList()),
              ),
            ),
          ),
          IgnorePointer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  height: 30,
                  decoration: BoxDecoration(
                    color: widget.lineColor ?? Colors.grey.withOpacity(0.35),
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ListWheel extends StatelessWidget {
  final List<dynamic> items;
  final Function(int index) onItemChanged;
  final Color? textColor;
  final Color? lineColor;
  final double? textSize;
  final int? initialIndex;
  final double? itemExtent;
  const _ListWheel({
    required this.items,
    required this.onItemChanged,
    super.key,
    this.textColor,
    this.lineColor,
    this.textSize,
    this.initialIndex,
    this.itemExtent,
  });

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView.useDelegate(
      controller: FixedExtentScrollController(initialItem: initialIndex ?? 0),
      useMagnifier: true,
      overAndUnderCenterOpacity: 0.5,
      squeeze: 0.7,
      magnification: 1.1,
      physics: const FixedExtentScrollPhysics(),
      onSelectedItemChanged: onItemChanged,
      itemExtent: itemExtent ?? 20,
      childDelegate: ListWheelChildLoopingListDelegate(
        children: items
            .map(
              (e) => Text(
                e.toString(),
                style: FlutterFlowTheme.of(context).titleLarge.copyWith(
                      fontSize: textSize ?? 24,
                      color: textColor ?? Colors.white,
                    ),
              ),
            )
            .toList(),
      ),
    );
  }
}

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
