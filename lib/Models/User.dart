class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String phoneNumber;


  User(
      {
        required this.id,
       required  this.firstName,
        required this.lastName,
       required this.email,
       required this.phoneNumber,
     });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
    );
  }
}
