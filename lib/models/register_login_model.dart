class UserRegisterAndLoginModel{
  bool status;
  String message;
  UserData data;
  UserRegisterAndLoginModel.fromJson(Map<String,dynamic>json){
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}
class UserData
{
  int id;
  String name;
  String email;
  String phone;
  String address;
  String birthdate;
  String token;
  int age;
  String gender;
  UserData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    birthdate = json['birthdate'];
    token = json['token'];
    gender = json['gender'];
  }
}