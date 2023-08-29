class SignUpEmployeeRequest {
  String? employeeId;
  String? email;
  String? password;

  SignUpEmployeeRequest({this.employeeId, this.email, this.password});

  Map<String, dynamic> toJson() => {
        "employeeId": employeeId,
        "email": email,
        "password": password,
      };
}
