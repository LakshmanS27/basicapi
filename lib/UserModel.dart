class UserModel {
  final String name; // user attributes
  final String email;
  final String phone;
  final String picture;
  final String location;

  UserModel({ // constructor that takes 5 parameters
    required this.name,
    required this.email,
    required this.phone,
    required this.picture,
    required this.location,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) { // creating an instance of UserModel from JSON
    final user = json['results'][0]; // user data is nested inside
    final location = user['location'];
    return UserModel(
      name: '${user['name']['first']} ${user['name']['last']}',
      email: user['email'],
      phone: user['phone'],
      picture: user['picture']['large'],
      location: '${location['city']}, ${location['state']}, ${location['country']}',
    );
  }
}
