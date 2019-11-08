class UserModel {
  //Field
  String id, regisdate, name, user, password;

  //Constructor
  UserModel(this.id, this.regisdate, this.name, this.user, this.password);

  UserModel.fromAPI(Map<String, dynamic> map){
    id = map['id'];
    regisdate = map['regisdate'];
    name = map['name'];
    user = map['user'];
    password = map['password'];
  }
}
