class MyUser {
  static const String collectionName = 'users';
  String? id;
  String? userName;
  String? fullName;
  String? email;
  String? phone;
  String? texteditingdateinput;

  MyUser(
      {this.id,
      this.userName,
      this.fullName,
      this.email,
      this.phone,
      this.texteditingdateinput});

  MyUser.fromFireStore(Map<String, dynamic> data)
      : this(
            id: data['id'],
            userName: data['userName'],
            fullName: data['fullName'],
            phone: data['phone'],
            email: data['email'],
            texteditingdateinput: data['texteditingdateinput']);

  Map<String, dynamic> toFireStore() {
    return {
      'id': id,
      'userName': userName,
      'fullName': fullName,
      'phone': phone,
      'email': email,
      'texteditingdateinput': texteditingdateinput
    };
  }
}
