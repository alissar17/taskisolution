class UserModel {
  int id;
  String email;
  String firstName;
  String lastName;
  String phoneNumber;


  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  }) ;


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      firstName: json['profile']['firstName'],
      lastName: json['profile']['lastName'],
      phoneNumber: json['profile']['phoneNumber']
    );
  }
}