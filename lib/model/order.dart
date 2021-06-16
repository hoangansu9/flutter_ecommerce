class Order {
  int _id;
  String _name;
  String _phone;
  String _address;
  String _total;

  Order(this._name, this._phone, this._address, this._total);
  Order.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._phone = obj['phone'];
    this._address = obj['address'];
    this._total = obj['total'];
  }

  int get id => _id;
  String get name => _name;
  String get phone => _phone;
  String get address => _address;
  String get total => _total;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['phone'] = _phone;
    map['address'] = _address;
    map['total'] = _total;

    return map;
  }

  Order.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._phone = map['phone'];
    this._address = map['address'];
    this._total = map['total'];
  }
}
