import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
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
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  ChildStruct _tempChild = ChildStruct();
  ChildStruct get tempChild => _tempChild;
  set tempChild(ChildStruct _value) {
    _tempChild = _value;
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
  set monthsList(List<String> _value) {
    _monthsList = _value;
    prefs.setStringList('ff_monthsList', _value);
  }

  void addToMonthsList(String _value) {
    _monthsList.add(_value);
    prefs.setStringList('ff_monthsList', _monthsList);
  }

  void removeFromMonthsList(String _value) {
    _monthsList.remove(_value);
    prefs.setStringList('ff_monthsList', _monthsList);
  }

  void removeAtIndexFromMonthsList(int _index) {
    _monthsList.removeAt(_index);
    prefs.setStringList('ff_monthsList', _monthsList);
  }

  void updateMonthsListAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _monthsList[_index] = updateFn(_monthsList[_index]);
    prefs.setStringList('ff_monthsList', _monthsList);
  }

  void insertAtIndexInMonthsList(int _index, String _value) {
    _monthsList.insert(_index, _value);
    prefs.setStringList('ff_monthsList', _monthsList);
  }

  int _customPickerItemIndex1 = 0;
  int get customPickerItemIndex1 => _customPickerItemIndex1;
  set customPickerItemIndex1(int _value) {
    _customPickerItemIndex1 = _value;
  }

  int _customPickerItemIndex2 = 0;
  int get customPickerItemIndex2 => _customPickerItemIndex2;
  set customPickerItemIndex2(int _value) {
    _customPickerItemIndex2 = _value;
  }

  int _customPickerItemIndex3 = 0;
  int get customPickerItemIndex3 => _customPickerItemIndex3;
  set customPickerItemIndex3(int _value) {
    _customPickerItemIndex3 = _value;
  }

  int _weekPickerIndex1 = 0;
  int get weekPickerIndex1 => _weekPickerIndex1;
  set weekPickerIndex1(int _value) {
    _weekPickerIndex1 = _value;
  }

  String _userTempPhoto = '';
  String get userTempPhoto => _userTempPhoto;
  set userTempPhoto(String _value) {
    _userTempPhoto = _value;
  }

  List<String> _lessonsAddedToCart = [];
  List<String> get lessonsAddedToCart => _lessonsAddedToCart;
  set lessonsAddedToCart(List<String> _value) {
    _lessonsAddedToCart = _value;
    prefs.setStringList('ff_lessonsAddedToCart', _value);
  }

  void addToLessonsAddedToCart(String _value) {
    _lessonsAddedToCart.add(_value);
    prefs.setStringList('ff_lessonsAddedToCart', _lessonsAddedToCart);
  }

  void removeFromLessonsAddedToCart(String _value) {
    _lessonsAddedToCart.remove(_value);
    prefs.setStringList('ff_lessonsAddedToCart', _lessonsAddedToCart);
  }

  void removeAtIndexFromLessonsAddedToCart(int _index) {
    _lessonsAddedToCart.removeAt(_index);
    prefs.setStringList('ff_lessonsAddedToCart', _lessonsAddedToCart);
  }

  void updateLessonsAddedToCartAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _lessonsAddedToCart[_index] = updateFn(_lessonsAddedToCart[_index]);
    prefs.setStringList('ff_lessonsAddedToCart', _lessonsAddedToCart);
  }

  void insertAtIndexInLessonsAddedToCart(int _index, String _value) {
    _lessonsAddedToCart.insert(_index, _value);
    prefs.setStringList('ff_lessonsAddedToCart', _lessonsAddedToCart);
  }

  List<DocumentReference> _lastResultsUser = [];
  List<DocumentReference> get lastResultsUser => _lastResultsUser;
  set lastResultsUser(List<DocumentReference> _value) {
    _lastResultsUser = _value;
    prefs.setStringList(
        'ff_lastResultsUser', _value.map((x) => x.path).toList());
  }

  void addToLastResultsUser(DocumentReference _value) {
    _lastResultsUser.add(_value);
    prefs.setStringList(
        'ff_lastResultsUser', _lastResultsUser.map((x) => x.path).toList());
  }

  void removeFromLastResultsUser(DocumentReference _value) {
    _lastResultsUser.remove(_value);
    prefs.setStringList(
        'ff_lastResultsUser', _lastResultsUser.map((x) => x.path).toList());
  }

  void removeAtIndexFromLastResultsUser(int _index) {
    _lastResultsUser.removeAt(_index);
    prefs.setStringList(
        'ff_lastResultsUser', _lastResultsUser.map((x) => x.path).toList());
  }

  void updateLastResultsUserAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _lastResultsUser[_index] = updateFn(_lastResultsUser[_index]);
    prefs.setStringList(
        'ff_lastResultsUser', _lastResultsUser.map((x) => x.path).toList());
  }

  void insertAtIndexInLastResultsUser(int _index, DocumentReference _value) {
    _lastResultsUser.insert(_index, _value);
    prefs.setStringList(
        'ff_lastResultsUser', _lastResultsUser.map((x) => x.path).toList());
  }

  int _entryCounter = 0;
  int get entryCounter => _entryCounter;
  set entryCounter(int _value) {
    _entryCounter = _value;
    prefs.setInt('ff_entryCounter', _value);
  }

  String _cloudPublicID = 'pk_480c7674892e642b5baa1d3d2057a';
  String get cloudPublicID => _cloudPublicID;
  set cloudPublicID(String _value) {
    _cloudPublicID = _value;
    prefs.setString('ff_cloudPublicID', _value);
  }

  int _viewSleepNorms = 0;
  int get viewSleepNorms => _viewSleepNorms;
  set viewSleepNorms(int _value) {
    _viewSleepNorms = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
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
