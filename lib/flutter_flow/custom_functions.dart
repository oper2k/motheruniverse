import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<String> getLastTwentyYears() {
  List<String> yearsList = [];
  DateTime today = DateTime.now();

  // Получаем текущий год
  int currentYear = today.year;

  // Добавляем последние 20 лет в список
  for (int i = 0; i < 20; i++) {
    yearsList.add((currentYear - i).toString());
  }

  // Разворачиваем список
  yearsList = yearsList.reversed.toList();

  return yearsList;
}

List<String> getAllDatesInMonth(int monthIndex) {
  List<String> datesList = [];
  DateTime now = DateTime.now();
  int year = now.year;
  DateTime firstDayOfMonth = DateTime(year, monthIndex + 1, 1);
  DateTime lastDayOfMonth = DateTime(year, monthIndex + 2, 0);

  // Добавляем все дни месяца в список
  for (int day = 1; day <= lastDayOfMonth.day; day++) {
    datesList.add(day.toString().padLeft(2, '0'));
  }

  return datesList;
}

int getCurrentMonthIndex() {
  DateTime now = DateTime.now();
  return now.month - 1;
}

int getCurrentDateIndex() {
  DateTime now = DateTime.now();
  return now.day - 1;
}

List<String> getWeeksList() {
  List<String> weeksList = [];

  for (int week = 1; week <= 42; week++) {
    weeksList.add("$week неделя");
  }

  return weeksList;
}

List<String>? nullList() {
  return null;
}

String getImagePathAtIndex(
  int index,
  List<String> images,
) {
  return images[index];
}

DateTime calculateDateFromWeeksAgo(int index) {
  final now = DateTime.now();
  index++;
  final weeksAgo = now.subtract(Duration(days: index * 7));
  return weeksAgo;
}

DateTime createDateTimeFromIndices(
  int dayIndex,
  int monthIndex,
  int yearIndex,
) {
  final now = DateTime.now();
  final currentYear = now.year - 19 + yearIndex;
  final date = DateTime(currentYear, monthIndex + 1, dayIndex + 1);
  return date;
}

String getWeeksSince(DateTime startDate) {
  DateTime currentDate = DateTime.now();
  Duration difference = currentDate.difference(startDate);

  int weeks = difference.inDays ~/ 7;
  String weeksWord = 'неделя';

  if (weeks == 0) {
    return 'менее недели';
  } else if (weeks % 10 == 1 && weeks % 100 != 11) {
    weeksWord = 'неделя';
  } else if (weeks % 10 >= 2 &&
      weeks % 10 <= 4 &&
      (weeks % 100 < 10 || weeks % 100 >= 20)) {
    weeksWord = 'недели';
  } else {
    weeksWord = 'недель';
  }

  return '$weeks $weeksWord';
}

String formatDateAfter40Weeks(DateTime dateTime) {
  // Добавляем 42 недели (42 * 7 = 294 дней) к переданной дате
  // Получаем текущую дату
  DateTime currentDate = DateTime.now();

  // Добавляем 42 недели (42 * 7 = 294 дня) к переданной дате
  DateTime after40Weeks = dateTime.add(Duration(days: 40 * 7));

  // Если дата после 40 недель находится в прошлом, возвращаем текущий день
  if (after40Weeks.isBefore(currentDate)) {
    // Форматируем текущую дату в строку в нужном формате
    List<String> months = [
      "", // Пустой элемент, так как номер месяца начинается с 1, а не с 0
      "января",
      "февраля",
      "марта",
      "апреля",
      "мая",
      "июня",
      "июля",
      "августа",
      "сентября",
      "октября",
      "ноября",
      "декабря",
    ];
    String formattedDate = "${currentDate.day} ${months[currentDate.month]}";
    return formattedDate;
  }

  // Форматируем дату после 40 недель в строку в нужном формате
  List<String> months = [
    "", // Пустой элемент, так как номер месяца начинается с 1, а не с 0
    "января",
    "февраля",
    "марта",
    "апреля",
    "мая",
    "июня",
    "июля",
    "августа",
    "сентября",
    "октября",
    "ноября",
    "декабря",
  ];
  String formattedDate = "${after40Weeks.day} ${months[after40Weeks.month]}";

  return formattedDate;
}

String extractDay(String input) {
  // Разделяем входную строку по пробелу
  List<String> parts = input.split(" ");

  // Берем первый элемент (число) и возвращаем его
  return parts[0];
}

String extractMonth(String input) {
  // Разделяем входную строку по пробелу
  List<String> parts = input.split(" ");

  // Берем первый элемент (число) и возвращаем его
  return parts[1];
}

int getNumberFromWeekString(String weekString) {
  // Разделяем строку по пробелу
  List<String> parts = weekString.split(" ");

  // Получаем число из первой части строки и преобразуем его в int
  int number = int.parse(parts[0]);

  // Вычитаем 1 и возвращаем результат
  return number - 1;
}

int? getWeekIndexFromWeek(int week) {
  return week - 1;
}

int findOutTimeOfDay(DateTime dateTime) {
  return dateTime.hour;
}

String ageInYearsAndMonthsAgeOfBornChild(DateTime birthDate) {
  /// дата в формате "1 август 2022 г." если передать в нее дату 01.08.2022

  DateTime currentDate = DateTime.now();
  Duration duration = currentDate.difference(birthDate);

  int years = duration.inDays ~/ 365;
  int months = (duration.inDays % 365) ~/ 30;

  String yearsText = DateFormat.yMMMM('ru').format(birthDate);
  String monthsText = DateFormat.MMMM('ru').format(birthDate);

  return '${years > 0 ? '$years $yearsText' : ''} ${months > 0 ? '$months $monthsText' : ''}';
}

String ageInYearsMonthsAmdDays(DateTime birthDate) {
  DateTime currentDate = DateTime.now();
  Duration duration = currentDate.difference(birthDate);

  int years = duration.inDays ~/ 365;
  int months = (duration.inDays % 365) ~/ 30;
  int days = duration.inDays % 30;

  String yearsText = years == 1
      ? 'год'
      : (years >= 2 && years <= 4)
          ? 'года'
          : 'лет';
  String monthsText = months == 1
      ? 'месяц'
      : (months >= 2 && months <= 4)
          ? 'месяца'
          : 'месяцев';
  String daysText = days == 1
      ? 'день'
      : (days >= 2 && days <= 4)
          ? 'дня'
          : 'дней';

  List<String> parts = [];

  if (years > 0) {
    parts.add('$years $yearsText');
  }

  if (months > 0) {
    parts.add('$months $monthsText');
  }

  if (days > 0) {
    parts.add('$days $daysText');
  }

  return parts.join(' и ');
}

String dateOfMeasurementInShortFormatOfMonthAndYear(DateTime dateTime) {
  String day = dateTime.day.toString().padLeft(2, '0');
  String month = DateFormat.MMM('ru').format(dateTime);
  String year = dateTime.year.toString().substring(2);

  return '$day $month $year';
}

String calculateWeightChange(
  double previousWeight,
  double currentWeight,
) {
  double difference = currentWeight - previousWeight;
  String sign = difference >= 0 ? '+' : '-';
  String formattedDifference = difference.abs().toStringAsFixed(1);

  return '$sign$formattedDifference';
}

String calculateHeightChange(
  int previousHeight,
  int currentHeight,
) {
  int difference = currentHeight - previousHeight;
  String sign = difference >= 0 ? '+' : '-';

  return '$sign$difference';
}

int calculateAgePeriodIndex(DateTime birthday) {
  DateTime now = DateTime.now();
  Duration ageDuration = now.difference(birthday);
  double ageInYears = ageDuration.inDays / 365.25; // Учитываем високосные годы

  if (ageInYears < 0.5) {
    return 0;
  } else if (ageInYears >= 0.5 && ageInYears < 1) {
    return 1;
  } else if (ageInYears >= 1 && ageInYears < 1.5) {
    return 2;
  } else if (ageInYears >= 1.5 && ageInYears < 2) {
    return 3;
  } else {
    // Дополнительные условия возраста можно добавить здесь
    // Например, если нужно обработать более старший возраст
    return -1; // Возвращаем -1 для некорректных возрастов
  }
}

String formatDateInDayNumberMonthStringYearNumber(DateTime dateTime) {
  /// Формат даты "1 января 2023"
  final months = [
    'января',
    'февраля',
    'марта',
    'апреля',
    'мая',
    'июня',
    'июля',
    'августа',
    'сентября',
    'октября',
    'ноября',
    'декабря'
  ];

  String day = dateTime.day.toString();
  String month = months[dateTime.month - 1];
  String year = dateTime.year.toString();

  return '$day $month $year';
  // Выведет: "12 сентября 2023"
}

String calculateAgeAndMonths(DateTime birthDate) {
  DateTime currentDate = DateTime.now();

  int years = currentDate.year - birthDate.year;
  int months = currentDate.month - birthDate.month;

  if (months < 0) {
    years--;
    months += 12;
  }

  String pluralize(int number, String one, String few, String many) {
    if (number == 0) {
      return '0 $many';
    } else if (number == 1) {
      return '1 $one';
    } else if (number >= 2 && number <= 4) {
      return '$number $few';
    } else {
      return '$number $many';
    }
  }

  String yearsString = pluralize(years, 'год', 'года', 'лет');
  String monthsString = pluralize(months, 'месяц', 'месяца', 'месяцев');

  if (years == 0 && months == 0) {
    return "Меньше месяца";
  } else if (years == 0) {
    return "$monthsString";
  } else if (months == 0) {
    return "$yearsString";
  } else {
    return "$yearsString и $monthsString";
  }
}

DateTime addDaysToDate(
  int daysToAdd,
  DateTime initialDate,
) {
  return initialDate.add(Duration(days: daysToAdd));

  /// Принимает дату и количество дней. возвращает дату, которая рассчитывается путем прибавления указанного количества дней к указанной дате
}

List<String> listOf31Days() {
  List<String> numbersAsString = [];

  for (int i = 1; i <= 31; i++) {
    if (i < 10) {
      numbersAsString.add('0$i');
    } else {
      numbersAsString.add(i.toString());
    }
  }

  return numbersAsString;
}

int? getDayIndexFromDate(DateTime date) {
  ///Возвращает индекс числа - 1
  return date.day - 1;
}

int? getMonthIndexFromDate(DateTime date) {
  return date.month - 1;

  /// Возвращает индекс месяца -1
}

String? getTimeAgo(DateTime uploadDate) {
  /// Принимает дату, возвращает количество времени, прошедшее с момента даты (Вчера, 2 дня назад, неделя и т.д)
  DateTime now = DateTime.now();
  Duration difference = now.difference(uploadDate);

  if (difference.inDays == 0) {
    return 'Сегодня';
  } else if (difference.inDays == 1) {
    return 'Вчера';
  } else if (difference.inDays < 7) {
    return '${difference.inDays} дня назад';
  } else if (difference.inDays < 14) {
    return 'Неделю назад';
  } else if (difference.inDays < 30) {
    return '${(difference.inDays / 7).floor()} недели назад';
  } else if (difference.inDays < 60) {
    return 'Месяц назад';
  } else if (difference.inDays < 365) {
    return '${(difference.inDays / 30).floor()} месяцев назад';
  } else if (difference.inDays < 730) {
    return 'Год назад';
  } else {
    return '${(difference.inDays / 365).floor()} лет назад';
  }
}

bool searchStringInList(
  String stringList,
  String stringSearch,
) {
  if (stringList!.toLowerCase().contains(stringSearch!.toLowerCase())) {
    return true;
  } else {
    return false;
  }
}

int getMonthIndex(DateTime date) {
  return date.month;
}

List<String>? getAbbreviatedMonths(DateTime startDate) {
  final List<String> monthNumbers = [];

  int startMonth = startDate.month;
  int startYear = startDate.year;

  for (int i = 0; i < 12; i++) {
    String monthNumber = startMonth.toString().padLeft(2, '0');
    monthNumbers.add(monthNumber);
    startMonth++;
    if (startMonth > 12) {
      startMonth = 1;
      startYear++;
    }
  }
  return monthNumbers;
}

List<DateTime> getDatesAround(DateTime inputDate) {
  /// 15 дней до и после указанной даты

  final List<DateTime> datesAround = [];

  // Добавляем 15 дней перед указанной датой
  for (int i = 15; i >= 1; i--) {
    datesAround.add(inputDate.subtract(Duration(days: i)));
  }

  // Добавляем саму указанную дату
  datesAround.add(inputDate);

  // Добавляем 15 дней после указанной даты
  for (int i = 1; i <= 2; i++) {
    datesAround.add(inputDate.add(Duration(days: i)));
  }

  return datesAround;
}

String getShortNameOfMonthFromDateTime(DateTime date) {
  final List<String> monthNames = [
    "Янв",
    "Фев",
    "Мар",
    "Апр",
    "Май",
    "Июн",
    "Июл",
    "Авг",
    "Сен",
    "Окт",
    "Ноя",
    "Дек"
  ];

  return monthNames[date.month - 1];
}

int decrementByOne(int number) {
  return number - 1;
}

List<String> return31days() {
  List<String> result = [];
  for (int i = 1; i <= 31; i++) {
    String formattedNumber = i.toString().padLeft(2, '0');
    result.add(formattedNumber);
  }
  return result;
}

int calculateResultOfChartWidth(
  double screenWidth,
  int padding,
  DateTime startDate,
  DateTime endDate,
) {
  double availableScreenWidth = screenWidth - padding.toDouble();
  double daysPerPixel = availableScreenWidth / 365;
  int dayDifference = endDate.difference(startDate).inDays;

  return (daysPerPixel * dayDifference).toInt();
}

int findTotalTimeFromTwoDurations(
  int timer1,
  int timer2,
) {
  /// принимает значение длительности одного действия в милисекундах и значение второго действия. Возвращает их сумму

  return timer1 + timer2;
}

String calculateMinutesAndSecondsFromMilliseconds(int milliseconds) {
  /// Принимает милисекунды, возвращает mm:ss
  int totalSeconds = milliseconds ~/ 1000;
  int minutes = totalSeconds ~/ 60;
  int seconds = totalSeconds % 60;

  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = seconds.toString().padLeft(2, '0');

  return '$minutesStr:$secondsStr';
}

String calculeteSleepDuratioin(
  DateTime eventTime,
  DateTime currentTime,
) {
  /// Считает разницу между текущим временем и временем когда ребенок уснул

  Duration duration = currentTime.difference(eventTime);

  if (duration.inHours < 1) {
    return DateFormat('HH:mm:ss').format(DateTime(0).add(duration));
  } else {
    int hours = duration.inHours;
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);

    return '$hours:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

bool checkIfNightSleep(DateTime dateTime) {
  /// Принимает Date Time и возврвщает True если время находится в промежутке между 21:00 и 07:00

  // Устанавливаем времена для сравнения (21:00 и 07:00)
  final lateTime = DateTime(dateTime.year, dateTime.month, dateTime.day, 21, 0);
  final earlyTime = DateTime(dateTime.year, dateTime.month, dateTime.day, 7, 0);

  // Сравниваем переданное время с временными рамками
  if (dateTime.isAfter(lateTime) || dateTime.isBefore(earlyTime)) {
    return true;
  } else {
    return false;
  }
}

List<String> returnListOf24Hours() {
  /// Возвращает лист в формате "1 час, 2 часа, ..., 7 часов и т.д. до 24"
  List<String> hourStrings = [];

  for (int i = 0; i <= 23; i++) {
    String hourString = '$i час';

    if (i == 1 || (i > 20 && i % 10 == 1)) {
      hourString += '';
    } else if ((i >= 2 && i <= 4) || (i > 20 && i % 10 >= 2 && i % 10 <= 4)) {
      hourString += 'а';
    } else {
      hourString += 'ов';
    }

    hourStrings.add(hourString);
  }

  return hourStrings;
}

List<String> returnListOf59Minutes() {
  /// Возвращает лист стрингов от 1 минуты до 59 минут
  List<String> minutesList = [];
  for (int i = 0; i <= 59; i++) {
    String minuteString = i == 1
        ? 'минута'
        : (i >= 2 && i <= 4)
            ? 'минуты'
            : 'минут';
    minutesList.add('$i $minuteString');
  }
  return minutesList;
}

DateTime addHoursAndMinutesToTime(
  String timeString,
  DateTime currentTime,
) {
  /// Добавляем к переданному времени Date Time часы и минуты в формате String
  // Разбиваем строку на часы и минуты
  List<String> parts = timeString.split(' ');
  int hours = int.parse(parts[0]);
  int minutes = int.parse(parts[2]);

  // Создаем новый объект DateTime с добавленными часами и минутами
  DateTime newTime = currentTime.add(Duration(hours: hours, minutes: minutes));
  return newTime;
}

int calculateMillisecondsFromStringMinutes(String timeString) {
  /// Функция  принимает стринг значение в формате "1 минута", а возвращает количества  миллисекунд
  List<String> parts = timeString.split(' ');
  int minutes = int.parse(parts[0]);
  return minutes * 60 * 1000; // Конвертируем минуты в миллисекунды
}

DateTime addMultipleMinutesToTime(
  DateTime currentTime,
  String minutesString1,
  String minutesString2,
) {
  /// Принимает две стринги в формате "5 минут" и  время. возвращает время в котором к принимаемому значению добавляет сумму минут
  List<String> parts1 = minutesString1.split(' ');
  int minutesToAdd1 = int.parse(parts1[0]);

  List<String> parts2 = minutesString2.split(' ');
  int minutesToAdd2 = int.parse(parts2[0]);

  DateTime newTime =
      currentTime.add(Duration(minutes: minutesToAdd1 + minutesToAdd2));
  return newTime;
}

DateTime getStartOfDay(DateTime dateTime) {
  /// Принимает Date Time, возвращает начало переданного дня

  return DateTime(dateTime.year, dateTime.month, dateTime.day);
}

DateTime getStartOfNextDay(DateTime dateTime) {
  /// Принимает Date Time, а возвращает начало следующего дня

  DateTime nextDay = dateTime.add(Duration(days: 1));
  return DateTime(nextDay.year, nextDay.month, nextDay.day);
}

List<DateTimeRange> getDateTimeDifferenceInSeconds(
  List<DateTime> startDateTime,
  List<DateTime> endDateTime,
) {
  /// Принимает 2 значения Date Time возвращанет разницу между ними в секундах

  List<DateTimeRange> differences = [];

  for (int i = 0; i < startDateTime.length; i++) {
    differences
        .add(DateTimeRange(start: startDateTime[i], end: endDateTime[i]));
  }

  return differences;
}

DateTime add15MinutesToDateTime(DateTime dateTime) {
  ///Принимает Date Time а возвращает Date Time, который на 15 минут позже указанного

  return dateTime.add(Duration(minutes: 15));
}

bool checkIfLessonIsNew(DateTime dateTime) {
  DateTime currentDate = DateTime.now();
  DateTime threeWeeksAgo = currentDate.subtract(Duration(days: 21));

  return dateTime.isAfter(threeWeeksAgo) ||
      dateTime.isAtSameMomentAs(threeWeeksAgo);

  /// Принимает Date Time а возвращает True, если переданная дата не раньше, чем 3 недели назад от текущей даты и False если дата старше 3х недель
}

double returnSumOfPrices(List<double> prices) {
  double sum = 0;
  for (double price in prices) {
    sum += price;
  }
  return sum;
}

String getWordForItemCount(int count) {
  if (count % 10 == 1 && count % 100 != 11) {
    return 'товар';
  } else if (count % 10 >= 2 &&
      count % 10 <= 4 &&
      (count % 100 < 10 || count % 100 >= 20)) {
    return 'товара';
  } else {
    return 'товаров';
  }

  ///  Принимает integer а возвращает слово "товар", "товара" или "товаров" в зависимости от числа, которое пришло на вход
}

double returnDifferenceBetwenTwoDouble(
  double firstBiggerValue,
  double secondSmallerValue,
) {
  return firstBiggerValue - secondSmallerValue;
}

double calculateDiscountedPrice(
  double originalPrice,
  int numberOfItems,
) {
  /// принимает  значение Double стоимость товаров и число товаров.
  /// Рассчитывает скидку и возвращает новую цену с условием скидки: 1 товар - без скидки. От 5 товаров - 10%,
  /// от 10 товаров 15%, от 20 товаров - 20%, от 30 товаров - 25%, от 40 товаров - 30%,
  ///от 50 товаров - 35%, от 70 товаров - 40%, от 80 товаров - 45%, от 100 товаров - 50%

  double discount = 0.0;

  if (numberOfItems >= 5 && numberOfItems < 10) {
    discount = 0.10; // 10% скидка
  } else if (numberOfItems >= 10 && numberOfItems < 20) {
    discount = 0.15; // 15% скидка
  } else if (numberOfItems >= 20 && numberOfItems < 30) {
    discount = 0.20; // 20% скидка
  } else if (numberOfItems >= 30 && numberOfItems < 40) {
    discount = 0.25; // 25% скидка
  } else if (numberOfItems >= 40 && numberOfItems < 50) {
    discount = 0.30; // 30% скидка
  } else if (numberOfItems >= 50 && numberOfItems < 70) {
    discount = 0.35; // 35% скидка
  } else if (numberOfItems >= 70 && numberOfItems < 80) {
    discount = 0.40; // 40% скидка
  } else if (numberOfItems >= 80 && numberOfItems < 100) {
    discount = 0.45; // 45% скидка
  } else if (numberOfItems >= 100) {
    discount = 0.50; // 50% скидка
  }

  double discountedPrice = originalPrice * (1 - discount);
  return discountedPrice;
}

List<String> mergeLists(
  List<String> cartList,
  List<String> referencesList,
) {
  /// принимает 2 списка стрингов, к первому листу добавляет второй и возвращает обновленный первый лист
  cartList.addAll(referencesList);
  return cartList;
}

bool containsAllThemeReferencesInCart(
  List<String> cartList,
  List<String> referencesList,
) {
  ///  принимает 2 списка стрингов, проверяет наличие всех элементов второго списка в первом списке,
  /// и если все все элементы второго списка содержатся в первом, то возвращает true, если не все, то false
  for (var element in referencesList) {
    if (!cartList.contains(element)) {
      return false;
    }
  }
  return true;
}

List<String> removeLessonsFromCart(
  List<String> cartList,
  List<String> referencesList,
) {
  /// принимает 2 листа String, в первом листе ищет все элементы второго листа и удаляет все эти элементы.
  /// возвращает обновленный первый лист без элементов из второго листа
  cartList.removeWhere((element) => referencesList.contains(element));
  return cartList;
}

String formatDoubleWithSpaces(double number) {
  /// принимает Double а возвращает String в котором каждые 3 символа будут разделены пробелом
  String formattedNumber = number
      .toStringAsFixed(0); // Преобразуем число в строку и округляем до целых

  String result = '';
  int count = 0;

  // Проходимся по строке справа налево и добавляем пробел каждые 3 символа
  for (int i = formattedNumber.length - 1; i >= 0; i--) {
    result = formattedNumber[i] + result;
    count++;
    if (count == 3 && i != 0) {
      result = ' ' + result;
      count = 0;
    }
  }

  return result;
}

String weeksFromGivenDate(DateTime conceptionDate) {
  ///принимает дату Date Time, отсчитывает количество недель от переданной даты до текущего дня и возвращает String  число недель, где будет только цифра
  final currentDate = DateTime.now();
  final difference = currentDate.difference(conceptionDate);
  final weeks = (difference.inDays / 7).ceil();

  return weeks.toString();
}

String formOfResultWord(int number) {
  if (number % 10 == 1 && number % 100 != 11) {
    return 'РЕЗУЛЬТАТ';
  } else if (number % 10 >= 2 &&
      number % 10 <= 4 &&
      (number % 100 < 10 || number % 100 >= 20)) {
    return 'РЕЗУЛЬТАТА';
  } else {
    return 'РЕЗУЛЬТАТОВ';
  }
}

String extractFirstName(String fullName) {
  List<String> nameParts = fullName.split(' ');
  if (nameParts.length >= 1) {
    return nameParts[0];
  } else {
    return fullName;
  }
}

String extractSecondNameOrEmpty(String fullName) {
  List<String> nameParts = fullName.split(' ');
  if (nameParts.length >= 2) {
    return nameParts[1];
  } else {
    return ''; // Возвращаем пустую строку, если нет второго имени.
  }
}

List<DocumentReference> updateRecentResultsList(
  List<DocumentReference> inputList,
  DocumentReference value,
) {
  /// принимает список стрингов и стринг значение.
  ///  Если в списке нет такого значения, то оно добавляется в конец списка, если такое значение в списке есть, оно переносится в конец списка
  if (inputList.contains(value)) {
    // Если значение уже есть в списке, удаляем его и добавляем в конец.
    inputList.remove(value);
  }
  inputList.add(value);
  return inputList;
}

String buildTelegramLink(String username) {
  // Убираем пробелы в начале и конце строки, если они есть.
  username = username.trim();

  // Проверяем, начинается ли имя пользователя с "https://t.me/".
  if (username.startsWith("https://t.me/")) {
    // Если да, то возвращаем его как есть.
    return username;
  }

  // Убираем символ "@" в начале имени пользователя, если он есть.
  if (username.startsWith("@")) {
    username = username.substring(1);
  }

  // Строим и возвращаем полную ссылку.
  return "https://t.me/$username";
}

String buildInstagramLink(String username) {
  // Убираем пробелы в начале и конце строки, если они есть.
  username = username.trim();

  // Проверяем, начинается ли имя пользователя с "www.instagram.com/".
  if (username.startsWith("www.instagram.com/")) {
    // Если да, то возвращаем его как есть.
    return username;
  }

  // Убираем символ "@" в начале имени пользователя, если он есть.
  if (username.startsWith("@")) {
    username = username.substring(1);
  }

  // Строим и возвращаем полную ссылку.
  return "www.instagram.com/$username";
}

bool isTwoFiveOrMultipleOfTen(int number) {
  // Проверяем, равно ли число 2 или 5, или кратно 10
  if (number == 2 || number == 5 || number % 10 == 0) {
    return true;
  } else {
    return false;
  }
}

bool every5thEntry(int number) {
  // Проверяем, что число оканчивается на 1 или 6 и не равно 1
  if (number % 10 == 1 && number != 1 || number % 10 == 6) {
    return true;
  } else {
    return false;
  }
}

double addBonusesToUser(
  double previousValue,
  double bonuses,
) {
  return previousValue + bonuses;
}

bool todayIsBirthday(DateTime birthday) {
  /// Проверка дня рождения
  DateTime now = DateTime.now();
  return now.month == birthday.month && now.day == birthday.day;
}

String extractYearFromDateTime(DateTime date) {
  return date.year.toString();
}

List<DateTime> processDateList(List<DateTime> dateList) {
  /// принимает List Date Time дат, проверяет, является ли последняя запись в этом списке такого же числа, что и сегодняшний день.
  /// Если число то же самое, то возвращает этот же список. если последняя дата в списке является вчерашним днем,
  /// то дополняет список сегодняшней датой Date Time. Если последняя запись в списке является не вчерашним днем,
  /// то очистить список и положить в него единственную запись - дату сегодняшнего дня

  if (dateList.isEmpty) {
    // Если список пуст, добавляем сегодняшнюю дату
    dateList.add(DateTime.now());
  } else {
    // Получаем сегодняшнюю и вчерашнюю дату в формате "yyyy-MM-dd"
    final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final yesterday = DateFormat('yyyy-MM-dd')
        .format(DateTime.now().subtract(Duration(days: 1)));

    // Получаем последнюю дату в списке
    final lastDate = DateFormat('yyyy-MM-dd').format(dateList.last);

    if (lastDate == today) {
      // Если последняя дата в списке сегодняшняя, ничего не меняем
      return dateList;
    } else if (lastDate == yesterday) {
      // Если последняя дата в списке вчерашняя, добавляем сегодняшнюю дату
      dateList.add(DateTime.now());
    } else {
      // Если последняя дата в списке не сегодня и не вчера, очищаем список
      dateList.clear();
      dateList.add(DateTime.now());
    }
  }
  return dateList;
}

List<DateTime> clearDateTimeList(List<DateTime> dateList) {
  dateList.clear();
  return dateList;
}

DateTime endOfDay(DateTime date) {
  /// принимает Date Time, а возвращает окончание этого дня, т.е 23:59:59
  // Устанавливаем время на 23:59:59
  return DateTime(date.year, date.month, date.day, 23, 59, 59);
}

DateTime startOfDay(DateTime date) {
  /// Принимает Date Time а возвращает начало этого дня
  // Устанавливаем время на 00:00:00
  return DateTime(date.year, date.month, date.day, 0, 0, 0);
}

bool ageLessThanAMonth(DateTime birthDate) {
  /// принимает дату рождения Date Time и возвращает True если возраст меньше месяца
  DateTime now = DateTime.now();
  Duration difference = now.difference(birthDate);

  // Разница в днях между текущей датой и датой рождения
  int daysDifference = difference.inDays;

  // Проверяем, что разница меньше 30 дней (примерно месяц)
  return daysDifference < 30;
}

bool ageLessThanTwoMonths(DateTime birthDate) {
  // Получить текущую дату и время
  DateTime currentDate = DateTime.now();

  // Рассчитать разницу между текущей датой и датой рождения
  Duration ageDifference = currentDate.difference(birthDate);

  // Проверить, что разница меньше двух месяцев (60 дней)
  return ageDifference.inDays < 60;
}

bool isAgeLessThanThreeMonths(DateTime birthDate) {
  // Получить текущую дату и время
  DateTime currentDate = DateTime.now();

  // Рассчитать разницу между текущей датой и датой рождения
  Duration ageDifference = currentDate.difference(birthDate);

  // Проверить, что разница меньше двух месяцев (60 дней)
  return ageDifference.inDays < 90;
}

bool isAgeLessThanFourMonths(DateTime birthDate) {
  // Получить текущую дату и время
  DateTime currentDate = DateTime.now();

  // Рассчитать разницу между текущей датой и датой рождения
  Duration ageDifference = currentDate.difference(birthDate);

  // Проверить, что разница меньше двух месяцев (60 дней)
  return ageDifference.inDays < 120;
}

bool isAgeLessThanSixMonths(DateTime birthDate) {
  // Получить текущую дату и время
  DateTime currentDate = DateTime.now();

  // Рассчитать разницу между текущей датой и датой рождения
  Duration ageDifference = currentDate.difference(birthDate);

  // Проверить, что разница меньше двух месяцев (60 дней)
  return ageDifference.inDays < 180;
}

bool isAgeLessThan7Months(DateTime birthDate) {
  // Получить текущую дату и время
  DateTime currentDate = DateTime.now();

  // Рассчитать разницу между текущей датой и датой рождения
  Duration ageDifference = currentDate.difference(birthDate);

  // Проверить, что разница меньше двух месяцев (60 дней)
  return ageDifference.inDays < 210;
}

bool isAgeLessThan10Months(DateTime birthDate) {
  // Получить текущую дату и время
  DateTime currentDate = DateTime.now();

  // Рассчитать разницу между текущей датой и датой рождения
  Duration ageDifference = currentDate.difference(birthDate);

  // Проверить, что разница меньше двух месяцев (60 дней)
  return ageDifference.inDays < 302;
}

bool isAgeLessThan12Months(DateTime birthDate) {
  // Получить текущую дату и время
  DateTime currentDate = DateTime.now();

  // Рассчитать разницу между текущей датой и датой рождения
  Duration ageDifference = currentDate.difference(birthDate);

  // Проверить, что разница меньше двух месяцев (60 дней)
  return ageDifference.inDays < 365;
}

bool isAgeLessThan18Months(DateTime birthDate) {
  // Получить текущую дату и время
  DateTime currentDate = DateTime.now();

  // Рассчитать разницу между текущей датой и датой рождения
  Duration ageDifference = currentDate.difference(birthDate);

  // Проверить, что разница меньше двух месяцев (60 дней)
  return ageDifference.inDays < 546;
}

bool isAgeLessThan24Months(DateTime birthDate) {
  // Получить текущую дату и время
  DateTime currentDate = DateTime.now();

  // Рассчитать разницу между текущей датой и датой рождения
  Duration ageDifference = currentDate.difference(birthDate);

  // Проверить, что разница меньше двух месяцев (60 дней)
  return ageDifference.inDays < 730;
}

bool isAgeLessThan36Months(DateTime birthDate) {
  // Получить текущую дату и время
  DateTime currentDate = DateTime.now();

  // Рассчитать разницу между текущей датой и датой рождения
  Duration ageDifference = currentDate.difference(birthDate);

  // Проверить, что разница меньше двух месяцев (60 дней)
  return ageDifference.inDays < 1095;
}

DateTime startOfMonth(DateTime date) {
  return DateTime(date.year, date.month, 1);
}

DateTime addMonthsToBirthday(
  DateTime birthday,
  int monthsToAdd,
) {
  /// принимает Date Time день рождения и Integer номер месяца, а возвращает дату, которая равна дню рождения + число месяцев
  // Добавляем указанное количество месяцев к дню рождения
  if (monthsToAdd == 0) {
    return birthday;
  }

  int newMonth = birthday.month + monthsToAdd - 1;
  int yearToAdd = newMonth ~/ 12;
  int month =
      (newMonth % 12) + 1; // Добавляем 1, так как месяцы в Dart начинаются с 1
  int year = birthday.year + yearToAdd;

  return DateTime(year, month, birthday.day, birthday.hour, birthday.minute,
      birthday.second, birthday.millisecond, birthday.microsecond);
}

int monthsSinceBirthday(DateTime birthday) {
  ///принимает дату рождения, а возвращает значение месяца Integer который идет сейчас с момента даты рождения.
  /// к примеру, если прошло меньше месяца, то вернет 1, если больше одного месяца, но меньше двух или ровно месяц, то вернет 2.
  final today = DateTime.now();
  final months =
      today.year * 12 + today.month - (birthday.year * 12 + birthday.month);
  return months;
}

List<int> generateList(int num) {
  List<int> result = [];
  for (int i = 1; i <= num + 2; i++) {
    result.add(i);
  }
  return result;
}

DateTime getStartOfWeek(DateTime date) {
  // Получаем день недели для переданной даты (0 - воскресенье, 1 - понедельник, ..., 6 - суббота)
  int dayOfWeek = date.weekday;

  // Вычисляем разницу между днем недели и понедельником (0 дней для понедельника, 1 день для вторника и т. д.)
  int daysUntilMonday = (dayOfWeek - 1) % 7;

  // Вычитаем разницу из переданной даты, чтобы получить начало понедельника текущей недели
  DateTime startOfWeek = date.subtract(Duration(days: daysUntilMonday));

  // Устанавливаем время начала дня в 00:00:00
  startOfWeek = DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day);

  return startOfWeek;
}

DateTime getEndOfWeek(DateTime date) {
  /// принимает Date Time, а возвращает конец той недели, дату которой мы передали
  // Получаем день недели для переданной даты (0 - воскресенье, 1 - понедельник, ..., 6 - суббота)
  int dayOfWeek = date.weekday;

  // Вычисляем разницу между днем недели и воскресеньем (0 дней для воскресенья, 1 день для понедельника и т. д.)
  int daysUntilSunday = (7 - dayOfWeek) % 7;

  // Добавляем разницу к переданной дате и устанавливаем время 23:59:59 для конца недели
  DateTime endOfWeek = date.add(
      Duration(days: daysUntilSunday, hours: 23, minutes: 59, seconds: 59));

  return endOfWeek;
}

bool isWithinNDays(
  DateTime date,
  int days,
) {
  /// принимает Date Time и число Integer и возвращает True если спустя указанной даты еще не прошло указанное число дней
  DateTime currentDate = DateTime.now();
  Duration difference = currentDate.difference(date);
  return difference.inDays < days;
}

int calculateSleepDurationInMinutes(
  DateTime asleepTime,
  DateTime awakeTime,
) {
  /// принимает Date Time когда ребенок уснул и Date Time когда он проснулся, а возвращает Integer количество минут, которые он спал
  Duration sleepDuration = awakeTime.difference(asleepTime);
  return sleepDuration.inMinutes;
}

int countDates(List<DateTime> dateList) {
  /// принимает список объектов DateTime и возвращает количество дат, которые равны сегодняшнему, вчерашнему или позавчерашнему дню:
  DateTime today = DateTime.now();
  DateTime yesterday = today.subtract(Duration(days: 1));
  DateTime dayBeforeYesterday = today.subtract(Duration(days: 2));

  int count = 0;
  for (DateTime date in dateList) {
    if (date.year == today.year &&
        date.month == today.month &&
        date.day == today.day) {
      count++;
    } else if (date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day) {
      count++;
    } else if (date.year == dayBeforeYesterday.year &&
        date.month == dayBeforeYesterday.month &&
        date.day == dayBeforeYesterday.day) {
      count++;
    }
  }
  return count;
}

String getRandomElement(List<String> list) {
  /// принимает список строк (List<String>) и возвращает случайный элемент из этого списка:

  int currentTime = DateTime.now().millisecondsSinceEpoch;
  int randomIndex = currentTime % list.length;
  return list[randomIndex];
}

String getWordForPoints(double points) {
  /// принимает значение типа double и возвращает строку "балл" в нужной форме в зависимости от значения:
  if (points % 10 == 1 && points % 100 != 11) {
    return 'балл';
  } else if ((points % 10 == 2 || points % 10 == 3 || points % 10 == 4) &&
      (points % 100 != 12 && points % 100 != 13 && points % 100 != 14)) {
    return 'балла';
  } else {
    return 'баллов';
  }
}

int calculateElapsedMonths(DateTime dateTime) {
  /// Принимает Date time дату, а возвращает Integer количество целых прошедших месяцев.
  /// Если прошло меньше месяца с момента переданной даты, то возвращаемое число будет 0. Если больше месяца, но меньше двух, то 1 и т.д.
  DateTime currentDate = DateTime.now();

  int elapsedMonths = currentDate.month -
      dateTime.month +
      (currentDate.year - dateTime.year) * 12;

  if (currentDate.day < dateTime.day) {
    elapsedMonths--;
  }

  return elapsedMonths < 0 ? 0 : elapsedMonths;
}

DateTime addOneYear(DateTime dateTime) {
  /// принимает Dati time, а возвращает число, которое на год больше
  // Используем конструктор DateTime для создания нового объекта DateTime с увеличенным годом
  DateTime newDateTime = DateTime(
      dateTime.year + 1,
      dateTime.month,
      dateTime.day,
      dateTime.hour,
      dateTime.minute,
      dateTime.second,
      dateTime.millisecond,
      dateTime.microsecond);

  return newDateTime;
}

int getCountOfDays(DateTime birthDate) {
  /// принимает дату рождения Date Time и возвращает количество пройденных дней
  DateTime now = DateTime.now();
  Duration difference = now.difference(birthDate);

  // Разница в днях между текущей датой и датой рождения
  int daysDifference = difference.inDays;

  return daysDifference;
}

int findNumberOfWeek(DateTime startDate) {
  /// Возвращает Int номер недели беременности
  return DateTime.now().difference(startDate).inDays ~/ 7;
}
