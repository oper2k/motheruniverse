import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _monthsList = prefs.getStringList('ff_monthsList') ?? _monthsList;
    });
    _safeInit(() {
      _lessonsAddedToCart =
          prefs.getStringList('ff_lessonsAddedToCart') ?? _lessonsAddedToCart;
    });
    _safeInit(() {
      _lastResultsUser = prefs
              .getStringList('ff_lastResultsUser')
              ?.map((path) => path.ref)
              .toList() ??
          _lastResultsUser;
    });
    _safeInit(() {
      _entryCounter = prefs.getInt('ff_entryCounter') ?? _entryCounter;
    });
    _safeInit(() {
      _cloudPublicID = prefs.getString('ff_cloudPublicID') ?? _cloudPublicID;
    });
    _safeInit(() {
      _randomSleepTip =
          prefs.getStringList('ff_randomSleepTip') ?? _randomSleepTip;
    });
    _safeInit(() {
      _firstTipWasShowed =
          prefs.getInt('ff_firstTipWasShowed') ?? _firstTipWasShowed;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  ChildStruct _tempChild = ChildStruct();
  ChildStruct get tempChild => _tempChild;
  set tempChild(ChildStruct value) {
    _tempChild = value;
  }

  void updateTempChildStruct(Function(ChildStruct) updateFn) {
    updateFn(_tempChild);
  }

  List<String> _monthsList = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь'
  ];
  List<String> get monthsList => _monthsList;
  set monthsList(List<String> value) {
    _monthsList = value;
    prefs.setStringList('ff_monthsList', value);
  }

  void addToMonthsList(String value) {
    _monthsList.add(value);
    prefs.setStringList('ff_monthsList', _monthsList);
  }

  void removeFromMonthsList(String value) {
    _monthsList.remove(value);
    prefs.setStringList('ff_monthsList', _monthsList);
  }

  void removeAtIndexFromMonthsList(int index) {
    _monthsList.removeAt(index);
    prefs.setStringList('ff_monthsList', _monthsList);
  }

  void updateMonthsListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _monthsList[index] = updateFn(_monthsList[index]);
    prefs.setStringList('ff_monthsList', _monthsList);
  }

  void insertAtIndexInMonthsList(int index, String value) {
    _monthsList.insert(index, value);
    prefs.setStringList('ff_monthsList', _monthsList);
  }

  int _customPickerItemIndex1 = 0;
  int get customPickerItemIndex1 => _customPickerItemIndex1;
  set customPickerItemIndex1(int value) {
    _customPickerItemIndex1 = value;
  }

  int _customPickerItemIndex2 = 0;
  int get customPickerItemIndex2 => _customPickerItemIndex2;
  set customPickerItemIndex2(int value) {
    _customPickerItemIndex2 = value;
  }

  int _customPickerItemIndex3 = 0;
  int get customPickerItemIndex3 => _customPickerItemIndex3;
  set customPickerItemIndex3(int value) {
    _customPickerItemIndex3 = value;
  }

  int _weekPickerIndex1 = 0;
  int get weekPickerIndex1 => _weekPickerIndex1;
  set weekPickerIndex1(int value) {
    _weekPickerIndex1 = value;
  }

  String _userTempPhoto = '';
  String get userTempPhoto => _userTempPhoto;
  set userTempPhoto(String value) {
    _userTempPhoto = value;
  }

  List<String> _lessonsAddedToCart = [];
  List<String> get lessonsAddedToCart => _lessonsAddedToCart;
  set lessonsAddedToCart(List<String> value) {
    _lessonsAddedToCart = value;
    prefs.setStringList('ff_lessonsAddedToCart', value);
  }

  void addToLessonsAddedToCart(String value) {
    _lessonsAddedToCart.add(value);
    prefs.setStringList('ff_lessonsAddedToCart', _lessonsAddedToCart);
  }

  void removeFromLessonsAddedToCart(String value) {
    _lessonsAddedToCart.remove(value);
    prefs.setStringList('ff_lessonsAddedToCart', _lessonsAddedToCart);
  }

  void removeAtIndexFromLessonsAddedToCart(int index) {
    _lessonsAddedToCart.removeAt(index);
    prefs.setStringList('ff_lessonsAddedToCart', _lessonsAddedToCart);
  }

  void updateLessonsAddedToCartAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _lessonsAddedToCart[index] = updateFn(_lessonsAddedToCart[index]);
    prefs.setStringList('ff_lessonsAddedToCart', _lessonsAddedToCart);
  }

  void insertAtIndexInLessonsAddedToCart(int index, String value) {
    _lessonsAddedToCart.insert(index, value);
    prefs.setStringList('ff_lessonsAddedToCart', _lessonsAddedToCart);
  }

  List<DocumentReference> _lastResultsUser = [];
  List<DocumentReference> get lastResultsUser => _lastResultsUser;
  set lastResultsUser(List<DocumentReference> value) {
    _lastResultsUser = value;
    prefs.setStringList(
        'ff_lastResultsUser', value.map((x) => x.path).toList());
  }

  void addToLastResultsUser(DocumentReference value) {
    _lastResultsUser.add(value);
    prefs.setStringList(
        'ff_lastResultsUser', _lastResultsUser.map((x) => x.path).toList());
  }

  void removeFromLastResultsUser(DocumentReference value) {
    _lastResultsUser.remove(value);
    prefs.setStringList(
        'ff_lastResultsUser', _lastResultsUser.map((x) => x.path).toList());
  }

  void removeAtIndexFromLastResultsUser(int index) {
    _lastResultsUser.removeAt(index);
    prefs.setStringList(
        'ff_lastResultsUser', _lastResultsUser.map((x) => x.path).toList());
  }

  void updateLastResultsUserAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _lastResultsUser[index] = updateFn(_lastResultsUser[index]);
    prefs.setStringList(
        'ff_lastResultsUser', _lastResultsUser.map((x) => x.path).toList());
  }

  void insertAtIndexInLastResultsUser(int index, DocumentReference value) {
    _lastResultsUser.insert(index, value);
    prefs.setStringList(
        'ff_lastResultsUser', _lastResultsUser.map((x) => x.path).toList());
  }

  int _entryCounter = 0;
  int get entryCounter => _entryCounter;
  set entryCounter(int value) {
    _entryCounter = value;
    prefs.setInt('ff_entryCounter', value);
  }

  String _cloudPublicID = 'pk_480c7674892e642b5baa1d3d2057a';
  String get cloudPublicID => _cloudPublicID;
  set cloudPublicID(String value) {
    _cloudPublicID = value;
    prefs.setString('ff_cloudPublicID', value);
  }

  int _viewSleepNorms = 0;
  int get viewSleepNorms => _viewSleepNorms;
  set viewSleepNorms(int value) {
    _viewSleepNorms = value;
  }

  List<String> _randomSleepTip = [
    'Ой-ё-ёй. Кажется что-то не так. В системе малышарика произошёл сбой. Сон совсем разгулялся. \nОбрати внимание на отклонения от нормы. Наладить режим и вернуть спокойный и регулярный сон помогут наши лекции. Переходи, изучай и спите сладко.',
    'Так-так, кажется у кого-то произошли отклонения в режиме сна. Не волнуйся, мы вместе вернём сон малыша в норму. А помогут нам лекции, переходи. ',
    'Присмотрись, режим ушёл от нормы, давай вернём его в строй. Ответы на все вопросы ты найдёшь в наших лекциях, переходи. ',
    'Похоже что-то пошло не так. Сон твоего малыша совсем распоясался. Обрати на это внимание. Мы всегда рядом и готовы помочь. Наладить сон и спать спокойно помогут наши лекции. ',
    'Кажется режим сна твоего малыша сбился. Без паники, мы всегда на страже. \nПомочь в регулировке сна могут наши лекции. Переходи, изучай и сладких вам снов.',
    'Даже если с режимом пошло что-то не так, ты всегда можешь рассчитывать на нашу помощь. В перенастройке сна помогут наши лекции. Переходи, изучай и да пребудет с вами сладкий сон.',
    'Если в настройках режим и сна что-то пошло не так, не расстраивайся, ты самая лучшая мам для своего малыша. Во всех остальных вопросах мы поможем, переходи к лекциям.',
    'Кажется режим малыша снова сбился и мы понимаем как тебе не просто, ведь твой сон и самочувствие это важно.\nМы готовы тебя поддержать, переходи к лекциям.',
    'Даже если с режимом что-то идёт не так, не забывай о себе и своём состоянии, мы знаем как порой бывает не просто и готовы помочь в любом вопросе.',
    'Если не сил и ты чувствуешь себя опустошенной, мы хотим в этот момент быть твоим островком поддержки и помощи. Загляни в нашу библиотеку.'
  ];
  List<String> get randomSleepTip => _randomSleepTip;
  set randomSleepTip(List<String> value) {
    _randomSleepTip = value;
    prefs.setStringList('ff_randomSleepTip', value);
  }

  void addToRandomSleepTip(String value) {
    _randomSleepTip.add(value);
    prefs.setStringList('ff_randomSleepTip', _randomSleepTip);
  }

  void removeFromRandomSleepTip(String value) {
    _randomSleepTip.remove(value);
    prefs.setStringList('ff_randomSleepTip', _randomSleepTip);
  }

  void removeAtIndexFromRandomSleepTip(int index) {
    _randomSleepTip.removeAt(index);
    prefs.setStringList('ff_randomSleepTip', _randomSleepTip);
  }

  void updateRandomSleepTipAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _randomSleepTip[index] = updateFn(_randomSleepTip[index]);
    prefs.setStringList('ff_randomSleepTip', _randomSleepTip);
  }

  void insertAtIndexInRandomSleepTip(int index, String value) {
    _randomSleepTip.insert(index, value);
    prefs.setStringList('ff_randomSleepTip', _randomSleepTip);
  }

  int _firstTipWasShowed = 0;
  int get firstTipWasShowed => _firstTipWasShowed;
  set firstTipWasShowed(int value) {
    _firstTipWasShowed = value;
    prefs.setInt('ff_firstTipWasShowed', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
