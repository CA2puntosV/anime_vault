class UserModel {
  final String uid;
  final String userName;
  final String fullName;
  final String email;

  UserModel({
    required this.uid,
    required this.userName,
    required this.fullName,
    required this.email,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      userName: json['userName'],
      fullName: json['fullName'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'userName': userName,
      'fullName': fullName,
      'email': email,
    };
  }

  factory UserModel.empty() {
    return UserModel(
      uid: '',
      userName: '',
      fullName: '',
      email: '',
    );
  }
}
