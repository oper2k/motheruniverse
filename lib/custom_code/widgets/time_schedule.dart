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

import 'dart:developer';

// Imports other custom widgets
// Imports custom actions
// Imports custom functions

class TimeSchedule extends StatelessWidget {
  final double? width;
  final double? height;
  final List<DateTimeRange> timeRanges;
  final int scheduleTypeByDays;
  final int recommendedRateByMinute;
  TimeSchedule({
    super.key,
    this.width,
    this.height,
    required this.timeRanges,
    required this.scheduleTypeByDays,
    required this.recommendedRateByMinute,
  }) : assert(timeRanges.isNotEmpty, 'timeRanges cannot be empty') {
    log('-------------------');
    log(timeRanges.toString());
    log('-------------------');
    log('length == ${timeRanges.length}');
    log('-------------------');
  }

  @override
  Widget build(BuildContext context) {
    switch (scheduleTypeByDays) {
      case 1:
        return TimeScheduleForDay(
          width: width,
          height: height,
          timeRanges: timeRanges,
          recommendedRateByMinute: recommendedRateByMinute,
        );
      case 7:
        return TimeScheduleForWeek(
          width: width,
          height: height,
          timeRanges: timeRanges,
          recommendedRateByMinute: recommendedRateByMinute,
        );
      default:
        return TimeScheduleForMonth(
          width: width,
          height: height,
          timeRanges: timeRanges,
          recommendedRateByMinute: recommendedRateByMinute,
        );
    }
  }
}

class TimeScheduleForDay extends StatefulWidget {
  final double? width;
  final double? height;
  final List<DateTimeRange> timeRanges;
  final int recommendedRateByMinute;

  TimeScheduleForDay({
    super.key,
    this.width,
    this.height,
    required this.timeRanges,
    required this.recommendedRateByMinute,
  });

  @override
  State<TimeScheduleForDay> createState() => _TimeScheduleForDayState();
}

class _TimeScheduleForDayState extends State<TimeScheduleForDay> {
  late final List<_TimeRange> _timeRanges;

  @override
  void initState() {
    super.initState();
    final dateTimeRanges = widget.timeRanges;
    dateTimeRanges.sort(((a, b) => a.start.compareTo(b.start)));
    _timeRanges =
        dateTimeRanges.isNotEmpty ? convertToTimeRanges(dateTimeRanges) : [];
    _checkMinutesWithRecomendedMinute();
    print(_timeRanges);
  }

  void _checkMinutesWithRecomendedMinute() {
    for (int i = 0; i < _timeRanges.length; ++i) {
      if (_timeRanges[i].isSleep &&
          _timeRanges[i].rangeByMinutes > widget.recommendedRateByMinute) {
        _timeRanges[i] = _timeRanges[i].copyWith(color: Color(0xFFC64141));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 175,
          child: Stack(
            children: [
              HoursWidget(),
              Center(child: ChartColumn(ranges: _timeRanges)),
            ],
          ),
        ),
        Text(_timeRanges.first.startTime.day.toString()),
        const SizedBox(height: 15),
        LegendWidget(),
      ],
    );
  }
}

class TimeScheduleForWeek extends StatefulWidget {
  final double? width;
  final double? height;
  final List<DateTimeRange> timeRanges;
  final int recommendedRateByMinute;

  TimeScheduleForWeek({
    super.key,
    this.width,
    this.height,
    required this.timeRanges,
    required this.recommendedRateByMinute,
  });

  @override
  State<TimeScheduleForWeek> createState() => _TimeScheduleForWeekState();
}

class _TimeScheduleForWeekState extends State<TimeScheduleForWeek> {
  final List<List<_TimeRange>> _timeRanges = [];

  @override
  void initState() {
    super.initState();
    final dateTimeRanges = widget.timeRanges;
    dateTimeRanges.sort(((a, b) => a.start.compareTo(b.start)));
    final slicedList = _sliceByWeekDay(dateTimeRanges);
    final now = DateTime.now();
    for (int i = 0; i < slicedList.length; ++i) {
      final item = slicedList[i];
      _timeRanges.add(item.isNotEmpty
          ? convertToTimeRanges(item)
          : [
              _TimeRange(
                startTime: now.startTime,
                endTime: now.endTime,
                color: Color(0xffd2c8d7),
                isSleep: false,
              )
            ]);
    }
    _checkMinutesWithRecomendedMinute();
    print(_timeRanges);
  }

  void _checkMinutesWithRecomendedMinute() {
    for (int i = 0; i < _timeRanges.length; ++i) {
      final item = _timeRanges[i];
      for (int j = 0; j < item.length; ++j) {
        if (item[j].isSleep &&
            item[j].rangeByMinutes > widget.recommendedRateByMinute) {
          if (item[j].endTime.isLastSecondOfDay ||
              item[j].startTime.isFirstSecondOfDay) {
            continue;
          }
          _timeRanges[i][j] =
              _timeRanges[i][j].copyWith(color: Color(0xFFC64141));
        }
      }
    }
  }

  List<List<DateTimeRange>> _sliceByWeekDay(List<DateTimeRange> data) {
    // Sort dateTimeRanges by the day of the week (0 = Sunday, 1 = Monday, ..., 6 = Saturday)
    data.sort((a, b) {
      return a.start.weekday - b.start.weekday;
    });
    final dublicateData = data;
    for (int i = 0; i < dublicateData.length; ++i) {
      final item = dublicateData[i];
      if (item.start.day != item.end.day) {
        dublicateData[i] =
            DateTimeRange(start: item.start, end: item.start.endTime);
        dublicateData.insert(
            i + 1, DateTimeRange(start: item.end.startTime, end: item.end));
      }
    }

    /// separating nested ranges
    List<DateTimeRange> mergedRanges = [];
    DateTimeRange currentRange = dublicateData[0];

    for (int i = 1; i < dublicateData.length; i++) {
      DateTimeRange nextRange = dublicateData[i];

      if (currentRange.end.isBefore(nextRange.start)) {
        // If the current range's end is before the next range's start, they don't overlap
        mergedRanges.add(currentRange);
        currentRange = nextRange;
      } else {
        // If they overlap, merge them by taking the later end time
        currentRange = DateTimeRange(
          start: currentRange.start,
          end: currentRange.end.isAfter(nextRange.end)
              ? currentRange.end
              : nextRange.end,
        );
      }
    }
    mergedRanges.add(currentRange);

    ///

    // Create a list of 7 lists, one for each day of the week
    List<List<DateTimeRange>> sortedDateTimeRanges =
        List.generate(7, (_) => []);

    // Distribute the DateTimeRange objects into their corresponding day lists
    for (var dateTimeRange in mergedRanges) {
      sortedDateTimeRanges[dateTimeRange.start.weekday - 1].add(dateTimeRange);
    }
    return sortedDateTimeRanges;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 175,
          child: Stack(
            children: [
              HoursWidget(),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _timeRanges
                      .map(
                        (e) => ChartColumn(ranges: e),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 25),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _weekNames
                  .map((w) => Text(
                        w,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          letterSpacing: -0.41,
                          color: FlutterFlowTheme.of(context).primaryText,
                        ),
                      ))
                  .toList()),
        ),
        const SizedBox(height: 15),
        LegendWidget(),
      ],
    );
  }
}

class TimeScheduleForMonth extends StatefulWidget {
  final double? width;
  final double? height;
  final List<DateTimeRange> timeRanges;
  final int recommendedRateByMinute;
  const TimeScheduleForMonth({
    super.key,
    this.width,
    this.height,
    required this.timeRanges,
    required this.recommendedRateByMinute,
  });

  @override
  State<TimeScheduleForMonth> createState() => _TimeScheduleForMonthState();
}

class _TimeScheduleForMonthState extends State<TimeScheduleForMonth> {
  final List<List<_TimeRange>> _timeRanges = [];

  @override
  void initState() {
    super.initState();
    final dateTimeRanges = widget.timeRanges;
    dateTimeRanges.sort(((a, b) => a.start.compareTo(b.start)));
    final slicedList = _sliceByMonthDay(dateTimeRanges);
    final now = DateTime.now();
    for (int i = 0; i < slicedList.length; ++i) {
      final item = slicedList[i];
      _timeRanges.add(item.isNotEmpty
          ? convertToTimeRanges(item)
          : [
              _TimeRange(
                startTime: now.startTime,
                endTime: now.endTime,
                color: Color(0xffd2c8d7),
                isSleep: false,
              )
            ]);
    }
    _checkMinutesWithRecomendedMinute();
    _addEmptyDatatoTheEndOfMonth();
  }

  void _checkMinutesWithRecomendedMinute() {
    for (int i = 0; i < _timeRanges.length; ++i) {
      final item = _timeRanges[i];
      for (int j = 0; j < item.length; ++j) {
        if (item[j].isSleep &&
            item[j].rangeByMinutes > widget.recommendedRateByMinute) {
          if (item[j].endTime.isLastSecondOfDay ||
              item[j].startTime.isFirstSecondOfDay) {
            continue;
          }
          _timeRanges[i][j] =
              _timeRanges[i][j].copyWith(color: Color(0xFFC64141));
        }
      }
    }
  }

  List<List<DateTimeRange>> _sliceByMonthDay(List<DateTimeRange> data) {
    // Sort dateTimeRanges by the day of the month
    data.sort((a, b) {
      return a.start.day - b.start.day;
    });

    /// seperating dateTimeRange if start day != end day
    final dublicateData = data;
    for (int i = 0; i < dublicateData.length; ++i) {
      final item = dublicateData[i];
      if (item.start.day != item.end.day) {
        dublicateData[i] =
            DateTimeRange(start: item.start, end: item.start.endTime);
        dublicateData.insert(
            i + 1, DateTimeRange(start: item.end.startTime, end: item.end));
      }
    }

    /// separating nested ranges
    List<DateTimeRange> mergedRanges = [];
    DateTimeRange currentRange = dublicateData[0];

    for (int i = 1; i < dublicateData.length; i++) {
      DateTimeRange nextRange = dublicateData[i];

      if (currentRange.end.isBefore(nextRange.start)) {
        // If the current range's end is before the next range's start, they don't overlap
        mergedRanges.add(currentRange);
        currentRange = nextRange;
      } else {
        // If they overlap, merge them by taking the later end time
        currentRange = DateTimeRange(
          start: currentRange.start,
          end: currentRange.end.isAfter(nextRange.end)
              ? currentRange.end
              : nextRange.end,
        );
      }
    }

    mergedRanges.add(currentRange);

    ///
    // Calculate the maximum day of the month to determine the number of lists needed
    int maxDay = mergedRanges.isNotEmpty ? mergedRanges.last.start.day : 0;
    List<List<DateTimeRange>> sortedDateTimeRanges =
        List.generate(maxDay, (_) => []);

    // Distribute the DateTimeRange objects into their corresponding day lists
    for (var dateTimeRange in mergedRanges) {
      sortedDateTimeRanges[dateTimeRange.start.day - 1].add(dateTimeRange);
    }
    return sortedDateTimeRanges;
  }

  void _addEmptyDatatoTheEndOfMonth() {
    final lastDayOfData = _timeRanges.last.last.endTime;
    int monthLastday =
        DateTime(lastDayOfData.year, lastDayOfData.month + 1, 0).day;
    final now = DateTime.now();
    for (int i = 0; i <= monthLastday - lastDayOfData.day; ++i) {
      _timeRanges.add([
        _TimeRange(
          startTime: now.startTime,
          endTime: now.endTime,
          color: Colors.transparent,
          isSleep: false,
        )
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 175,
          child: Stack(
            children: [
              HoursWidget(),
              Container(
                child: Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: _timeRanges
                        .map(
                          (e) => ChartColumn(
                            ranges: e,
                            width: 6.5,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(right: 25),
            child: _buildDayWidgets()),
        const SizedBox(height: 15),
        LegendWidget(),
      ],
    );
  }

  _buildDayWidgets() {
    final style = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.41,
      color: FlutterFlowTheme.of(context).primaryText,
    );
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text('1', style: style),
      Text('5', style: style),
      Text('10', style: style),
      Text('15', style: style),
      Text('20', style: style),
      Text('25', style: style),
      Text('31', style: style),
    ]);
  }
}

class HoursWidget extends StatelessWidget {
  const HoursWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        7,
        (index) => Row(
          children: [
            Expanded(child: Divider()),
            const SizedBox(width: 10),
            Text(
              (index * 4).toString(),
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.41,
                color: FlutterFlowTheme.of(context).primaryText,
              ),
            ),
          ],
        ),
      ).reversed.toList(),
    );
  }
}

class LegendWidget extends StatelessWidget {
  const LegendWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipOval(
          child: SizedBox.square(
            dimension: 12,
            child: ColoredBox(color: Color(0xFF8765A2)),
          ),
        ),
        const SizedBox(width: 8),
        Text('Сон'),
        const SizedBox(width: 16),
        ClipOval(
          child: SizedBox.square(
            dimension: 12,
            child: ColoredBox(color: Color(0xffd2c8d7)),
          ),
        ),
        const SizedBox(width: 8),
        Text('ВБ'),
        const SizedBox(width: 16),
        ClipOval(
          child: SizedBox.square(
            dimension: 12,
            child: ColoredBox(color: Color(0xFFC64141)),
          ),
        ),
        const SizedBox(width: 8),
        Text('Отклонение от нормы'),
      ],
    );
  }
}

class ChartColumn extends StatelessWidget {
  final List<_TimeRange> ranges;
  final double width;
  final double heightFactor;

  const ChartColumn({
    super.key,
    required this.ranges,
    this.width = 20,
    this.heightFactor = 6.6,
  });
  @override
  Widget build(BuildContext context) {
    // Customize the appearance of each column here
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...ranges.reversed.map(
          (e) => Container(
            width: width,
            height: (e.yValue) * heightFactor,
            decoration: BoxDecoration(
              color: e.color,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}

class _TimeRange {
  final DateTime startTime;
  final DateTime endTime;
  final Color color;
  final bool isSleep;

  _TimeRange({
    required this.startTime,
    required this.endTime,
    required this.color,
    required this.isSleep,
  });

  double get yValue =>
      (endTime.millisecondsSinceEpoch - startTime.millisecondsSinceEpoch) /
      3600000;
  double get rangeByMinutes =>
      (endTime.millisecondsSinceEpoch - startTime.millisecondsSinceEpoch) /
      60000;

  @override
  String toString() {
    return '_TimeRange(startTime: $startTime, endTime: $endTime, color: $color, isSleep: $isSleep)';
  }

  _TimeRange copyWith({
    DateTime? startTime,
    DateTime? endTime,
    Color? color,
    bool? isSleep,
  }) {
    return _TimeRange(
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      color: color ?? this.color,
      isSleep: isSleep ?? this.isSleep,
    );
  }
}

List<_TimeRange> convertToTimeRanges(List<DateTimeRange> dateTimeRanges) {
  final List<_TimeRange> timeRanges = [];
  //adding first item if need
  final firstDateTime = dateTimeRanges.first.start;
  final firstDateTimeStartTime = firstDateTime.startTime;
  if (firstDateTimeStartTime != firstDateTime) {
    timeRanges.insert(
        0,
        _TimeRange(
          startTime: firstDateTimeStartTime,
          endTime: firstDateTime,
          color: Color(0xffd2c8d7),
          isSleep: false,
        ));
  }
  final DateTime endDate = dateTimeRanges.last.end;

  for (int i = 0; i < dateTimeRanges.length; i++) {
    final DateTimeRange currentRange = dateTimeRanges[i];
    final DateTimeRange nextRange = (i < dateTimeRanges.length - 1)
        ? dateTimeRanges[i + 1]
        : DateTimeRange(
            start: dateTimeRanges[i].end,
            end: endDate,
          );

    timeRanges.add(_TimeRange(
      startTime: currentRange.start,
      endTime: currentRange.end,
      color: Color(0xFF8765A2),
      isSleep: true,
    ));

    if (nextRange.start.isAfter(currentRange.end)) {
      timeRanges.add(_TimeRange(
        startTime: currentRange.end,
        endTime: nextRange.start,
        color: Color(0xffd2c8d7),
        isSleep: false,
      ));
    }
  }

  //adding last item if need
  final lastDateTime = dateTimeRanges.last.end;
  final lastDateTimeEndTime = firstDateTime.endTime;
  if (lastDateTimeEndTime != lastDateTime) {
    timeRanges.add(_TimeRange(
      startTime: lastDateTime,
      endTime: lastDateTimeEndTime,
      color: Color(0xffd2c8d7),
      isSleep: false,
    ));
  }
  return timeRanges;
}

String getShortNameOfWeekFromDateTime(int weekday) {
  return _weekNames[weekday - 1];
}

const List<String> _weekNames = const [
  'ПН',
  'ВТ',
  'СР',
  'ЧТ',
  'ПТ',
  'СВ',
  'ВС',
];

extension on DateTime {
  DateTime get startTime => DateTime(this.year, this.month, this.day);
  DateTime get endTime => DateTime(this.year, this.month, this.day)
      .add(Duration(days: 1))
      .subtract(Duration(microseconds: 1));

  bool get isLastSecondOfDay {
    return this.hour == 23 && this.minute == 59 && this.second == 59;
  }

  bool get isFirstSecondOfDay {
    return this.hour == 0 && this.minute == 0 && this.second == 0;
  }
}
