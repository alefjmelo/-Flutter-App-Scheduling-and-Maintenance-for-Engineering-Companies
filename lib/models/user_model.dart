class User {
  int id;
  String acessToken;
  String name;
  String cpf;
  String gender;
  String birthDate;
  String businessRole;
  String phoneNumber;
  String email;

  User({
    required this.acessToken,
    required this.id,
    required this.name,
    required this.cpf,
    required this.gender,
    required this.birthDate,
    required this.businessRole,
    required this.phoneNumber,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      acessToken: json['AcessToken'],
      name: json['Nome'],
      cpf: json['Cpf'],
      gender: json['Sexo'],
      birthDate: json['Data'],
      businessRole: json['Cargo'],
      phoneNumber: json['Numero'],
      email: json['Email'],
    );
  }
}
