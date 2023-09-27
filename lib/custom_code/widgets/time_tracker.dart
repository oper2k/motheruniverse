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

// Set your widget name, define your parameter, and then add the
// boilerplate code using the button on the right!
import 'dart:ui' as ui;
import 'dart:math';
import 'dart:async';

class TimeTracker extends StatefulWidget {
  const TimeTracker({
    Key? key,
    this.width,
    this.height,
    this.radius = 120,
    required this.breastFeedingTime,
    required this.sleepTime,
    required this.additionalFeedingTime,
    this.titleScaleFactor = 1,
    this.counterScaleFactor = 1,
  }) : super(key: key);

  final List<DateTimeRange> breastFeedingTime;
  final List<DateTimeRange> sleepTime;
  final List<DateTimeRange> additionalFeedingTime;
  final double? width;
  final double? height;
  final double radius;
  final double titleScaleFactor;
  final double counterScaleFactor;

  @override
  State<TimeTracker> createState() => _TimeTrackerState();
}

class _TimeTrackerState extends State<TimeTracker> {
  List<_TimeRange> _timeRange = [];
  Color get _sleepTimeColor => const Color(0xFF6764FB);
  Color get _breastFeedingTimeColor => const Color(0xFFFB854A);
  Color get _additionalFeedingTimeColor => const Color(0xFFFB3A68);
  late final ValueNotifier<String> _currentTimeNotifier;
  Timer? _timer;
  @override
  void initState() {
    _timeRange = [
      ...widget.sleepTime.map((e) => _TimeRange(
          startTime: e.start,
          endTime: e.end,
          color: _sleepTimeColor,
          isSleep: true)),
      ...widget.breastFeedingTime.map((e) => _TimeRange(
          startTime: e.start, endTime: e.end, color: _breastFeedingTimeColor)),
      ...widget.additionalFeedingTime.map((e) => _TimeRange(
          startTime: e.start,
          endTime: e.end,
          color: _additionalFeedingTimeColor)),
    ];
    _currentTimeNotifier = ValueNotifier<String>(_formattedTime);
    _timer = Timer.periodic(Duration(seconds: 1), _updateTime);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant TimeTracker oldWidget) {
    _timeRange = [
      ...widget.sleepTime.map((e) => _TimeRange(
          startTime: e.start,
          endTime: e.end,
          color: _sleepTimeColor,
          isSleep: true)),
      ...widget.breastFeedingTime.map((e) => _TimeRange(
          startTime: e.start, endTime: e.end, color: _breastFeedingTimeColor)),
      ...widget.additionalFeedingTime.map((e) => _TimeRange(
          startTime: e.start,
          endTime: e.end,
          color: _additionalFeedingTimeColor)),
    ];
    super.didUpdateWidget(oldWidget);
  }

  void _updateTime(Timer timer) {
    _currentTimeNotifier.value = _formattedTime; // Update the ValueNotifier
  }

  String get _formattedTime => DateFormat('HH:mm').format(DateTime.now());

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    _currentTimeNotifier.dispose(); // Dispose of the ValueNotifier
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _currentTimeNotifier,
      builder: (context, time, child) => CustomPaint(
        size: Size(
          widget.width ?? widget.radius * 2,
          widget.height ?? widget.radius * 2,
        ),
        painter: _TimeTrackerPainter(
          titleScaleFactor: widget.titleScaleFactor,
          counterScaleFactor: widget.counterScaleFactor,
          timeRanges: _timeRange,
          radius: widget.radius,
          title:
              FlutterFlowTheme.of(context).displayLarge.copyWith(fontSize: 38),
          clock: FlutterFlowTheme.of(context)
              .headlineMedium
              .copyWith(fontSize: 16),
          centerStyle:
              FlutterFlowTheme.of(context).displayLarge.copyWith(fontSize: 60),
          currentTime: _currentTimeNotifier.value,
        ),
      ),
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
    this.isSleep = false,
  });
}

class _TimeTrackerPainter extends CustomPainter {
  final TextStyle centerStyle;
  final TextStyle clock;
  final TextStyle title;
  final List<_TimeRange> timeRanges;
  final double radius;
  final double titleScaleFactor;
  final double counterScaleFactor;

  final String currentTime;

  _TimeTrackerPainter({
    required this.timeRanges,
    required this.radius,
    required this.centerStyle,
    required this.clock,
    required this.title,
    required this.titleScaleFactor,
    required this.counterScaleFactor,
    required this.currentTime,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final clockRadius = radius;
    const anglePerHour = 2 * pi / 24;
    const anglePerQuarter = 0.5 * pi;
    final paint = Paint()..style = PaintingStyle.stroke;

    // Draw the circular time tracker
    paint.color = Colors.white;
    paint.strokeWidth = 24.0;
    canvas.drawCircle(center, clockRadius, paint);

    // Draw the text for each quarter
    final textOptions = ['00', '06', '12', '18'];

    final textDistance = clockRadius + 40; // Distance of text from the circle
    for (int i = 0; i < 4; i++) {
      final angle =
          -pi / 2 + i * anglePerQuarter; // Start at 12:00 AM and move clockwise

      final text = textOptions[i];
      final textX = center.dx + textDistance * cos(angle);
      final textY = center.dy + textDistance * sin(angle);

      final textSpan = TextSpan(
        text: text,
        style: clock,
      );

      final textPainter = TextPainter(
        text: textSpan,
        textDirection: ui.TextDirection.ltr,
        textAlign: TextAlign.center,
      );
      textPainter.layout();
      textPainter.paint(
          canvas,
          Offset(
              textX - textPainter.width / 2, textY - textPainter.height / 2));
    }

    // Draw hour markers as lines outside the circular time tracker
    for (int i = 0; i < 24; i++) {
      final angle =
          -pi / 2 + i * anglePerHour; // Start at 12:00 AM and move clockwise
      final markerRadius = clockRadius + 23;
      final lineStartRadius = clockRadius + 18;
      final startX = center.dx + lineStartRadius * cos(angle);
      final startY = center.dy + lineStartRadius * sin(angle);
      final endX = (center.dx + markerRadius * cos(angle));
      final endY = center.dy + markerRadius * sin(angle);

      paint.color = const Color(0xFF747474);
      paint.strokeWidth = 2.0;
      canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
    }
    // if (timeRanges.isNotEmpty) {
    // Calculate and display the general time inside the time tracker
    // final generalTime = calculateGeneralTime();
    final generalTimePainter = TextPainter(
      textScaleFactor: counterScaleFactor,
      text: TextSpan(
        text: currentTime,
        style: centerStyle,
      ),
      textDirection: ui.TextDirection.ltr,
    )..layout();

    final generalTimeOffset = Offset(center.dx - generalTimePainter.width / 2,
        center.dy - generalTimePainter.height / 2);
    generalTimePainter.paint(canvas, generalTimeOffset);
    // }

    // Draw the time ranges with rounded corners
    for (var i = 0; i < timeRanges.length; i++) {
      final timeRange = timeRanges[i];

      final startSeconds =
          timeRange.startTime.hour * 3600 + timeRange.startTime.minute * 60;
      final endSeconds =
          timeRange.endTime.hour * 3600 + timeRange.endTime.minute * 60;

      final timeDifferenceSeconds = endSeconds - startSeconds;
      final startAngle = -pi / 2 + startSeconds * anglePerHour / 3600;
      final sweepAngle = timeDifferenceSeconds * anglePerHour / 3600;

      paint.color = timeRange.color;

      paint.strokeWidth = timeRange.isSleep ? 24 : 12.0;

      paint.strokeCap = StrokeCap.round;

      canvas.drawArc(
        Rect.fromCircle(
            center: center,
            radius: !timeRange.isSleep ? clockRadius - 10 : clockRadius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
    }
  }

  String calculateGeneralTime() {
    int totalSeconds = 0;

    for (var timeRange in timeRanges) {
      final startSeconds =
          timeRange.startTime.hour * 3600 + timeRange.startTime.minute * 60;
      final endSeconds =
          timeRange.endTime.hour * 3600 + timeRange.endTime.minute * 60;
      totalSeconds += (endSeconds - startSeconds);
    }

    final averageSeconds = totalSeconds ~/ timeRanges.length;

    final hours = averageSeconds ~/ 3600;
    final minutes = (averageSeconds % 3600) ~/ 60;

    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}';
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
