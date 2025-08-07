import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
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
  Map<String, Timestamp> _lastSeenMap = {};
  Map<String, Timestamp> get lastSeenMap => _lastSeenMap;

  void updateLastSeen(String chatId, Timestamp timestamp) {
    _lastSeenMap[chatId] = timestamp;
    notifyListeners();
  }
  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _fullname = await secureStorage.getString('ff_fullname') ?? _fullname;
    });
    await _safeInitAsync(() async {
      _password = await secureStorage.getString('ff_password') ?? _password;
    });
    await _safeInitAsync(() async {
      _islogin = await secureStorage.getBool('ff_islogin') ?? _islogin;
    });
    await _safeInitAsync(() async {
      _audioListVani = (await secureStorage.getStringList('ff_audioListVani'))
              ?.map((path) => path.ref)
              .toList() ??
          _audioListVani;
    });
    await _safeInitAsync(() async {
      _audioListSatsang =
          (await secureStorage.getStringList('ff_audioListSatsang'))
                  ?.map((path) => path.ref)
                  .toList() ??
              _audioListSatsang;
    });
    await _safeInitAsync(() async {
      _audioListGuruKaleenSatsang =
          (await secureStorage.getStringList('ff_audioListGuruKaleenSatsang'))
                  ?.map((path) => path.ref)
                  .toList() ??
              _audioListGuruKaleenSatsang;
    });
    await _safeInitAsync(() async {
      _audioListOfAudioBook =
          (await secureStorage.getStringList('ff_audioListOfAudioBook'))
                  ?.map((path) => path.ref)
                  .toList() ??
              _audioListOfAudioBook;
    });
    await _safeInitAsync(() async {
      _name = await secureStorage.getString('ff_name') ?? _name;
    });
    await _safeInitAsync(() async {
      _email = await secureStorage.getString('ff_email') ?? _email;
    });
    await _safeInitAsync(() async {
      _isadminlogin =
          await secureStorage.getBool('ff_isadminlogin') ?? _isadminlogin;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  bool _showCustomDrawer = true;
  bool get showCustomDrawer => _showCustomDrawer;
  set showCustomDrawer(bool value) {
    _showCustomDrawer = value;
  }

  String _slogan1 =
      'गुरू महिमा अपरम अपार है, साखी कथी न जाये\n \'मंगत\' दुर्गम मारग जगत का, पल में दियो चुकाये ।।+';
  String get slogan1 => _slogan1;
  set slogan1(String value) {
    _slogan1 = value;
  }

  List<String> _images = [
    'https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=1024x1024&w=is&k=20&c=NQtm4v1Uzp2luv-6f3qORcq9pDtz2H56p8g9Xix8cY0=',
    'https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=1024x1024&w=is&k=20&c=NQtm4v1Uzp2luv-6f3qORcq9pDtz2H56p8g9Xix8cY0=',
    'https://media.istockphoto.com/id/814423752/photo/eye-of-model-with-colorful-art-make-up-close-up.jpg?s=1024x1024&w=is&k=20&c=NQtm4v1Uzp2luv-6f3qORcq9pDtz2H56p8g9Xix8cY0='
  ];
  List<String> get images => _images;
  set images(List<String> value) {
    _images = value;
  }

  void addToImages(String value) {
    images.add(value);
  }

  void removeFromImages(String value) {
    images.remove(value);
  }

  void removeAtIndexFromImages(int index) {
    images.removeAt(index);
  }

  void updateImagesAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    images[index] = updateFn(_images[index]);
  }

  void insertAtIndexInImages(int index, String value) {
    images.insert(index, value);
  }

  String _emailphonenumber = '';
  String get emailphonenumber => _emailphonenumber;
  set emailphonenumber(String value) {
    _emailphonenumber = value;
  }

  String _fullname = '';
  String get fullname => _fullname;
  set fullname(String value) {
    _fullname = value;
    secureStorage.setString('ff_fullname', value);
  }

  void deleteFullname() {
    secureStorage.delete(key: 'ff_fullname');
  }

  String _username = '';
  String get username => _username;
  set username(String value) {
    _username = value;
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
    secureStorage.setString('ff_password', value);
  }

  void deletePassword() {
    secureStorage.delete(key: 'ff_password');
  }

  bool _islogin = false;
  bool get islogin => _islogin;
  set islogin(bool value) {
    _islogin = value;
    secureStorage.setBool('ff_islogin', value);
  }

  void deleteIslogin() {
    secureStorage.delete(key: 'ff_islogin');
  }

  String _locationfilter = 'आश्रम';
  String get locationfilter => _locationfilter;
  set locationfilter(String value) {
    _locationfilter = value;
  }

  bool _locationaashram = true;
  bool get locationaashram => _locationaashram;
  set locationaashram(bool value) {
    _locationaashram = value;
  }

  bool _isSatsangmenu = true;
  bool get isSatsangmenu => _isSatsangmenu;
  set isSatsangmenu(bool value) {
    _isSatsangmenu = value;
  }

  String _selectedSatangMode = 'A';
  String get selectedSatangMode => _selectedSatangMode;
  set selectedSatangMode(String value) {
    _selectedSatangMode = value;
  }

  String _uploadurl = '';
  String get uploadurl => _uploadurl;
  set uploadurl(String value) {
    _uploadurl = value;
  }

  String _imagepath = '';
  String get imagepath => _imagepath;
  set imagepath(String value) {
    _imagepath = value;
  }

  String _uploadedAudioUrl = '';
  String get uploadedAudioUrl => _uploadedAudioUrl;
  set uploadedAudioUrl(String value) {
    _uploadedAudioUrl = value;
  }

  bool _showAudiomenu = false;
  bool get showAudiomenu => _showAudiomenu;
  set showAudiomenu(bool value) {
    _showAudiomenu = value;
  }

  List<String> _gurujiimage = [];
  List<String> get gurujiimage => _gurujiimage;
  set gurujiimage(List<String> value) {
    _gurujiimage = value;
  }

  void addToGurujiimage(String value) {
    gurujiimage.add(value);
  }

  void removeFromGurujiimage(String value) {
    gurujiimage.remove(value);
  }

  void removeAtIndexFromGurujiimage(int index) {
    gurujiimage.removeAt(index);
  }

  void updateGurujiimageAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    gurujiimage[index] = updateFn(_gurujiimage[index]);
  }

  void insertAtIndexInGurujiimage(int index, String value) {
    gurujiimage.insert(index, value);
  }

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  set selectedDate(DateTime? value) {
    _selectedDate = value;
  }

  LatLng? _selectedLocation;
  LatLng? get selectedLocation => _selectedLocation;
  set selectedLocation(LatLng? value) {
    _selectedLocation = value;
  }

  String _filterType = '';
  String get filterType => _filterType;
  set filterType(String value) {
    _filterType = value;
  }

  /// For Change In Categories - Eshwar Mahima Vani , puratan Vani
  String _selectedCategory = 'सभी\n';
  String get selectedCategory => _selectedCategory;
  set selectedCategory(String value) {
    _selectedCategory = value;
  }

  bool _searchaashramStatus = false;
  bool get searchaashramStatus => _searchaashramStatus;
  set searchaashramStatus(bool value) {
    _searchaashramStatus = value;
  }

  bool _searchSatsangShala = false;
  bool get searchSatsangShala => _searchSatsangShala;
  set searchSatsangShala(bool value) {
    _searchSatsangShala = value;
  }

  /// It will store the current index of played song
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  set currentIndex(int value) {
    _currentIndex = value;
  }

  /// It will stores all audio files inside it
  List<DocumentReference> _audioListVani = [];
  List<DocumentReference> get audioListVani => _audioListVani;
  set audioListVani(List<DocumentReference> value) {
    _audioListVani = value;
    secureStorage.setStringList(
        'ff_audioListVani', value.map((x) => x.path).toList());
  }

  void deleteAudioListVani() {
    secureStorage.delete(key: 'ff_audioListVani');
  }

  void addToAudioListVani(DocumentReference value) {
    audioListVani.add(value);
    secureStorage.setStringList(
        'ff_audioListVani', _audioListVani.map((x) => x.path).toList());
  }

  void removeFromAudioListVani(DocumentReference value) {
    audioListVani.remove(value);
    secureStorage.setStringList(
        'ff_audioListVani', _audioListVani.map((x) => x.path).toList());
  }

  void removeAtIndexFromAudioListVani(int index) {
    audioListVani.removeAt(index);
    secureStorage.setStringList(
        'ff_audioListVani', _audioListVani.map((x) => x.path).toList());
  }

  void updateAudioListVaniAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    audioListVani[index] = updateFn(_audioListVani[index]);
    secureStorage.setStringList(
        'ff_audioListVani', _audioListVani.map((x) => x.path).toList());
  }

  void insertAtIndexInAudioListVani(int index, DocumentReference value) {
    audioListVani.insert(index, value);
    secureStorage.setStringList(
        'ff_audioListVani', _audioListVani.map((x) => x.path).toList());
  }

  /// List All Satsang in a list
  List<DocumentReference> _audioListSatsang = [];
  List<DocumentReference> get audioListSatsang => _audioListSatsang;
  set audioListSatsang(List<DocumentReference> value) {
    _audioListSatsang = value;
    secureStorage.setStringList(
        'ff_audioListSatsang', value.map((x) => x.path).toList());
  }

  void deleteAudioListSatsang() {
    secureStorage.delete(key: 'ff_audioListSatsang');
  }

  void addToAudioListSatsang(DocumentReference value) {
    audioListSatsang.add(value);
    secureStorage.setStringList(
        'ff_audioListSatsang', _audioListSatsang.map((x) => x.path).toList());
  }

  void removeFromAudioListSatsang(DocumentReference value) {
    audioListSatsang.remove(value);
    secureStorage.setStringList(
        'ff_audioListSatsang', _audioListSatsang.map((x) => x.path).toList());
  }

  void removeAtIndexFromAudioListSatsang(int index) {
    audioListSatsang.removeAt(index);
    secureStorage.setStringList(
        'ff_audioListSatsang', _audioListSatsang.map((x) => x.path).toList());
  }

  void updateAudioListSatsangAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    audioListSatsang[index] = updateFn(_audioListSatsang[index]);
    secureStorage.setStringList(
        'ff_audioListSatsang', _audioListSatsang.map((x) => x.path).toList());
  }

  void insertAtIndexInAudioListSatsang(int index, DocumentReference value) {
    audioListSatsang.insert(index, value);
    secureStorage.setStringList(
        'ff_audioListSatsang', _audioListSatsang.map((x) => x.path).toList());
  }

  /// Stores all gurukaleenSatsangAtOnePlace
  List<DocumentReference> _audioListGuruKaleenSatsang = [];
  List<DocumentReference> get audioListGuruKaleenSatsang =>
      _audioListGuruKaleenSatsang;
  set audioListGuruKaleenSatsang(List<DocumentReference> value) {
    _audioListGuruKaleenSatsang = value;
    secureStorage.setStringList(
        'ff_audioListGuruKaleenSatsang', value.map((x) => x.path).toList());
  }

  void deleteAudioListGuruKaleenSatsang() {
    secureStorage.delete(key: 'ff_audioListGuruKaleenSatsang');
  }

  void addToAudioListGuruKaleenSatsang(DocumentReference value) {
    audioListGuruKaleenSatsang.add(value);
    secureStorage.setStringList('ff_audioListGuruKaleenSatsang',
        _audioListGuruKaleenSatsang.map((x) => x.path).toList());
  }

  void removeFromAudioListGuruKaleenSatsang(DocumentReference value) {
    audioListGuruKaleenSatsang.remove(value);
    secureStorage.setStringList('ff_audioListGuruKaleenSatsang',
        _audioListGuruKaleenSatsang.map((x) => x.path).toList());
  }

  void removeAtIndexFromAudioListGuruKaleenSatsang(int index) {
    audioListGuruKaleenSatsang.removeAt(index);
    secureStorage.setStringList('ff_audioListGuruKaleenSatsang',
        _audioListGuruKaleenSatsang.map((x) => x.path).toList());
  }

  void updateAudioListGuruKaleenSatsangAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    audioListGuruKaleenSatsang[index] =
        updateFn(_audioListGuruKaleenSatsang[index]);
    secureStorage.setStringList('ff_audioListGuruKaleenSatsang',
        _audioListGuruKaleenSatsang.map((x) => x.path).toList());
  }

  void insertAtIndexInAudioListGuruKaleenSatsang(
      int index, DocumentReference value) {
    audioListGuruKaleenSatsang.insert(index, value);
    secureStorage.setStringList('ff_audioListGuruKaleenSatsang',
        _audioListGuruKaleenSatsang.map((x) => x.path).toList());
  }

  /// List of all audio books.
  List<DocumentReference> _audioListOfAudioBook = [];
  List<DocumentReference> get audioListOfAudioBook => _audioListOfAudioBook;
  set audioListOfAudioBook(List<DocumentReference> value) {
    _audioListOfAudioBook = value;
    secureStorage.setStringList(
        'ff_audioListOfAudioBook', value.map((x) => x.path).toList());
  }

  void deleteAudioListOfAudioBook() {
    secureStorage.delete(key: 'ff_audioListOfAudioBook');
  }

  void addToAudioListOfAudioBook(DocumentReference value) {
    audioListOfAudioBook.add(value);
    secureStorage.setStringList('ff_audioListOfAudioBook',
        _audioListOfAudioBook.map((x) => x.path).toList());
  }

  void removeFromAudioListOfAudioBook(DocumentReference value) {
    audioListOfAudioBook.remove(value);
    secureStorage.setStringList('ff_audioListOfAudioBook',
        _audioListOfAudioBook.map((x) => x.path).toList());
  }

  void removeAtIndexFromAudioListOfAudioBook(int index) {
    audioListOfAudioBook.removeAt(index);
    secureStorage.setStringList('ff_audioListOfAudioBook',
        _audioListOfAudioBook.map((x) => x.path).toList());
  }

  void updateAudioListOfAudioBookAtIndex(
    int index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    audioListOfAudioBook[index] = updateFn(_audioListOfAudioBook[index]);
    secureStorage.setStringList('ff_audioListOfAudioBook',
        _audioListOfAudioBook.map((x) => x.path).toList());
  }

  void insertAtIndexInAudioListOfAudioBook(int index, DocumentReference value) {
    audioListOfAudioBook.insert(index, value);
    secureStorage.setStringList('ff_audioListOfAudioBook',
        _audioListOfAudioBook.map((x) => x.path).toList());
  }

  bool _searchInpersStatus = false;
  bool get searchInpersStatus => _searchInpersStatus;
  set searchInpersStatus(bool value) {
    _searchInpersStatus = value;
  }

  bool _serachOnlineStatus = false;
  bool get serachOnlineStatus => _serachOnlineStatus;
  set serachOnlineStatus(bool value) {
    _serachOnlineStatus = value;
  }

  String _imageUrl = '';
  String get imageUrl => _imageUrl;
  set imageUrl(String value) {
    _imageUrl = value;
  }

  String _userId = '';
  String get userId => _userId;
  set userId(String value) {
    _userId = value;
  }

  List<String> _guruvacnList = [];
  List<String> get guruvacnList => _guruvacnList;
  set guruvacnList(List<String> value) {
    _guruvacnList = value;
  }

  void addToGuruvacnList(String value) {
    guruvacnList.add(value);
  }

  void removeFromGuruvacnList(String value) {
    guruvacnList.remove(value);
  }

  void removeAtIndexFromGuruvacnList(int index) {
    guruvacnList.removeAt(index);
  }

  void updateGuruvacnListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    guruvacnList[index] = updateFn(_guruvacnList[index]);
  }

  void insertAtIndexInGuruvacnList(int index, String value) {
    guruvacnList.insert(index, value);
  }

  List<String> _descriptionList = [];
  List<String> get descriptionList => _descriptionList;
  set descriptionList(List<String> value) {
    _descriptionList = value;
  }

  void addToDescriptionList(String value) {
    descriptionList.add(value);
  }

  void removeFromDescriptionList(String value) {
    descriptionList.remove(value);
  }

  void removeAtIndexFromDescriptionList(int index) {
    descriptionList.removeAt(index);
  }

  void updateDescriptionListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    descriptionList[index] = updateFn(_descriptionList[index]);
  }

  void insertAtIndexInDescriptionList(int index, String value) {
    descriptionList.insert(index, value);
  }

  List<String> _vachnAndDescription = [];
  List<String> get vachnAndDescription => _vachnAndDescription;
  set vachnAndDescription(List<String> value) {
    _vachnAndDescription = value;
  }

  void addToVachnAndDescription(String value) {
    vachnAndDescription.add(value);
  }

  void removeFromVachnAndDescription(String value) {
    vachnAndDescription.remove(value);
  }

  void removeAtIndexFromVachnAndDescription(int index) {
    vachnAndDescription.removeAt(index);
  }

  void updateVachnAndDescriptionAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    vachnAndDescription[index] = updateFn(_vachnAndDescription[index]);
  }

  void insertAtIndexInVachnAndDescription(int index, String value) {
    vachnAndDescription.insert(index, value);
  }

  String _epubUrl = '';
  String get epubUrl => _epubUrl;
  set epubUrl(String value) {
    _epubUrl = value;
  }

  List<int> _favorite = [];
  List<int> get favorite => _favorite;
  set favorite(List<int> value) {
    _favorite = value;
  }

  void addToFavorite(int value) {
    favorite.add(value);
  }

  void removeFromFavorite(int value) {
    favorite.remove(value);
  }

  void removeAtIndexFromFavorite(int index) {
    favorite.removeAt(index);
  }

  void updateFavoriteAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    favorite[index] = updateFn(_favorite[index]);
  }

  void insertAtIndexInFavorite(int index, int value) {
    favorite.insert(index, value);
  }

  String _name = '';
  String get name => _name;
  set name(String value) {
    _name = value;
    secureStorage.setString('ff_name', value);
  }

  void deleteName() {
    secureStorage.delete(key: 'ff_name');
  }

  String _email = '';
  String get email => _email;
  set email(String value) {
    _email = value;
    secureStorage.setString('ff_email', value);
  }

  void deleteEmail() {
    secureStorage.delete(key: 'ff_email');
  }

  String _image = '';
  String get image => _image;
  set image(String value) {
    _image = value;
  }

  bool _showInfoDialog = false;
  bool get showInfoDialog => _showInfoDialog;
  set showInfoDialog(bool value) {
    _showInfoDialog = value;
  }

  DocumentReference? _userData;
  DocumentReference? get userData => _userData;
  set userData(DocumentReference? value) {
    _userData = value;
  }

  List<String> _categoryList = [];
  List<String> get categoryList => _categoryList;
  set categoryList(List<String> value) {
    _categoryList = value;
  }

  void addToCategoryList(String value) {
    categoryList.add(value);
  }

  void removeFromCategoryList(String value) {
    categoryList.remove(value);
  }

  void removeAtIndexFromCategoryList(int index) {
    categoryList.removeAt(index);
  }

  void updateCategoryListAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    categoryList[index] = updateFn(_categoryList[index]);
  }

  void insertAtIndexInCategoryList(int index, String value) {
    categoryList.insert(index, value);
  }

  int _currentPage = 0;
  int get currentPage => _currentPage;
  set currentPage(int value) {
    _currentPage = value;
  }

  bool _audioFinished = false;
  bool get audioFinished => _audioFinished;
  set audioFinished(bool value) {
    _audioFinished = value;
  }

  int _currentIndexPlayerVani = 0;
  int get currentIndexPlayerVani => _currentIndexPlayerVani;
  set currentIndexPlayerVani(int value) {
    _currentIndexPlayerVani = value;
  }

  bool _showSearchBar = false;
  bool get showSearchBar => _showSearchBar;
  set showSearchBar(bool value) {
    _showSearchBar = value;
  }

  String _searchText = '';
  String get searchText => _searchText;
  set searchText(String value) {
    _searchText = value;
  }

  bool _isadminlogin = false;
  bool get isadminlogin => _isadminlogin;
  set isadminlogin(bool value) {
    _isadminlogin = value;
    secureStorage.setBool('ff_isadminlogin', value);
  }

  void deleteIsadminlogin() {
    secureStorage.delete(key: 'ff_isadminlogin');
  }

  DocumentReference? _adminref;
  DocumentReference? get adminref => _adminref;
  set adminref(DocumentReference? value) {
    _adminref = value;
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

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
