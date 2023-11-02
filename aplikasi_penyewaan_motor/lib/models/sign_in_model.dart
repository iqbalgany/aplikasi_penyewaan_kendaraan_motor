class SignInModel {
  String? email;
  String? password;

  SignInModel({
    required this.email,
    required this.password,
  });

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
