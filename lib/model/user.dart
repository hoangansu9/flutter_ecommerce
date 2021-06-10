class User {
  int _id;
  String _userPassword;
  String _userEmail;
  String _userName;

  static bool _isLoggedIn = false;

  User(this._userName, this._userEmail, this._userPassword);

  User.map(dynamic obj) {
    this._id = obj['id'];
    this._userPassword = obj['password'];
    this._userName = obj['userName'];
    this._userEmail = obj['email'];
  }

  int get id => _id;
  String get password => _userPassword;
  String get email => _userEmail;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['userName'] = _userName;
    map['password'] = _userPassword;
    map['email'] = _userEmail;
    return map;
  }

  User.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._userPassword = map['password'];
    this._userEmail = map['email'];
    this._userName = map['userName'];
  }
}
