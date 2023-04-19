class User {
  late String _cpf;
  late String _password;
  User(this._cpf, this._password);

  User.map(dynamic obj) {
    _cpf = obj["cpf"];
    _password = obj["senha"];
  }

  String get cpf => _cpf;
  String get password => _password;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
    map["cpf"] = _cpf;
    map["senha"] = _password;

    return map;
  }
}