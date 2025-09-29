class UsersModel {
  final String email;
  final String? password;
  final String? uid;
  final String? height;
  

  UsersModel({
    required this.email,
    this.uid,
    this.password,
    this.height
    // düzeltildi
  });

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'password': password, 
    };
  }
}
