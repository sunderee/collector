/// Custom number picker for Collector inspired by numberpicker package.
library numberpicker;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NumberPicker extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int value;
  final ValueChanged<int> onChanged;
  final int _itemCount = 5;
  final int _step = 1;
  final double _itemHeight = 50.0;
  final double _itemWidth = 50.0;

  const NumberPicker({
    super.key,
    required this.minValue,
    required this.maxValue,
    required this.value,
    required this.onChanged,
  })  : assert(minValue <= value),
        assert(value <= maxValue);

  @override
  State<NumberPicker> createState() => _NumberPickerState();
}

class _NumberPickerState extends State<NumberPicker> {
  late final ScrollController _controller;

  bool get _isScrolling => _controller.position.isScrollingNotifier.value;
  double get _itemExtent => widget._itemWidth;
  int get _itemCount => (widget.maxValue - widget.minValue) ~/ widget._step + 1;
  int get _additionalItemsOnEachSide => (widget._itemCount - 1) ~/ 2;
  int get _listItemsCount => _itemCount + 2 * _additionalItemsOnEachSide;

  @override
  void initState() {
    final initialOffset =
        (widget.value - widget.minValue) ~/ widget._step * _itemExtent;
    _controller = ScrollController(initialScrollOffset: initialOffset)
      ..addListener(_scrollListener);
    super.initState();
  }

  @override
  void didUpdateWidget(NumberPicker oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.value != widget.value) {
      _maybeCenterValue();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget._itemCount * widget._itemWidth,
      height: widget._itemHeight,
      child: NotificationListener<ScrollEndNotification>(
        onNotification: (ScrollEndNotification notification) {
          if (notification.dragDetails?.primaryVelocity == 0) {
            Future.microtask(() => _maybeCenterValue());
          }
          return true;
        },
        child: ListView.builder(
          controller: _controller,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemExtent: _itemExtent,
          itemCount: _listItemsCount,
          itemBuilder: _itemBuilder,
        ),
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, int index) {
    final themeData = Theme.of(context);
    final defaultStyle = themeData.textTheme.bodyText2;
    final selectedStyle = themeData.textTheme.headline5?.copyWith(
      color: themeData.colorScheme.secondary,
    );

    final value = _intValueFromIndex(index % _itemCount);
    final isExtra = (index < _additionalItemsOnEachSide ||
        index >= _listItemsCount - _additionalItemsOnEachSide);
    final itemStyle = value == widget.value ? selectedStyle : defaultStyle;

    final child = isExtra
        ? const SizedBox.shrink()
        : Text(
            value.toString(),
            style: itemStyle,
          );

    return Container(
      width: widget._itemWidth,
      height: widget._itemHeight,
      alignment: Alignment.center,
      child: child,
    );
  }

  void _scrollListener() {
    int indexOfMiddleElement = (_controller.offset / _itemExtent).round();
    indexOfMiddleElement = indexOfMiddleElement.clamp(0, _itemCount - 1);

    final intValueInTheMiddle = _intValueFromIndex(
      indexOfMiddleElement + _additionalItemsOnEachSide,
    );
    if (widget.value != intValueInTheMiddle) {
      widget.onChanged(intValueInTheMiddle);
      HapticFeedback.selectionClick();
    }

    Future.delayed(
      const Duration(milliseconds: 100),
      () => _maybeCenterValue(),
    );
  }

  int _intValueFromIndex(int index) {
    index -= _additionalItemsOnEachSide;
    index %= _itemCount;
    return widget.minValue + index * widget._step;
  }

  void _maybeCenterValue() {
    if (_controller.hasClients && !_isScrolling) {
      int diff = widget.value - widget.minValue;
      int index = diff ~/ widget._step;
      _controller.animateTo(
        index * _itemExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
      );
    }
  }
}
