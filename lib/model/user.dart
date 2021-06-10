class User {
  int _id;
  String _userName;
  String _userPassword;
  String _userEmail;

  static bool _isLoggedIn = false;

  User(this._userName, this._userPassword, this._userEmail);

  User.map(dynamic obj) {
    this._id = obj['id'];
    this._userName = obj['userName'];
    this._userPassword = obj['password'];
    this._userEmail = obj['email'];
  }

  int get id => _id;
  String get userName => _userName;
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
    this._userName = map['userName'];
    this._userPassword = map['password'];
    this._userEmail = map['email'];
  }
}
