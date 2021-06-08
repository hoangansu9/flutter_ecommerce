class Order {
  int _id;
  String _name;
  String _phone;
  String _address;
  String _code;

  Order(this._name, this._phone, this._address, this._code);
  Order.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._phone = obj['phone'];
    this._address = obj['address'];
    this._code = obj['code'];
  }

  int get id => _id;
  String get name => _name;
  String get phone => _phone;
  String get address => _address;
  String get code => _code;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['phone'] = _phone;
    map['address'] = _address;
    map['code'] = _code;

    return map;
  }

  Order.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._phone = map['phone'];
    this._address = map['address'];
    this._code = map['code'];
  }
}
