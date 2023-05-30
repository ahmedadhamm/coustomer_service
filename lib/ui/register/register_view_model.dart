import 'package:customers_service/base/base.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../data_base/my_data_base.dart';
import '../../model/my_user.dart';
import '../../shared_data.dart';

abstract class RegisterNavigator extends BaseNavigator{
  void gotoHome();

}

class RegisterViewModel extends BaseViewModel <RegisterNavigator>{
  var auth = FirebaseAuth.instance;
  void register(String email,String password,String fullName,
      String userName,String phone, String texteditingdateinput)async{
    navigator?.showLoadingDialog();
    try{

      var credentials =await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      MyUser newUser = MyUser(
        id: credentials.user?.uid,
        fullName: fullName,
        userName: userName,
        phone: phone,
        texteditingdateinput:texteditingdateinput,

        email: email,
      );
      var insertedUser = await MyDataBase.insertUser(newUser);
      navigator?.hideLoadingDialog();
      if (insertedUser != null) {
        // user insert successfully
        SharedData.user = insertedUser;
        // go to home
        navigator?.gotoHome();
      } else {
        //error whit database show error
        navigator
            ?.showMessageDialog('something went wrong, error whit database ');
      }

      navigator?.showMessageDialog(credentials.user?.uid ?? "");
    } on FirebaseAuthException catch (e) {
      navigator?.hideLoadingDialog();
      if (e.code == 'weak-password') {
        navigator?.showMessageDialog('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        navigator?.showMessageDialog('Email is already register');
      }
    } catch (e) {
      navigator?.hideLoadingDialog();
      navigator
          ?.showMessageDialog('something went wrong ,please try again later');
    }
  }
}