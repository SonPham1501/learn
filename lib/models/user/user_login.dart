
class UserLoginForm {
  UserLoginForm({this.userName, this.password, this.remember});

  String? userName;
  String? password;
  bool? remember;

  factory UserLoginForm.fromJson(Map<String, dynamic> json) => UserLoginForm(
    userName: json['userName'],
    password: json['password'],
    remember: json['remember'],
  );

  Map<String, dynamic> toJson() => {
    'userName': userName,
    'password': password,
    'remember': remember,
  };

}