import 'package:customers_service/Utils/dialog_uitlis.dart';
import 'package:customers_service/ui/home/home_screen.dart';
import 'package:customers_service/ui/register/register_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Utils/data_of_time.dart';
import '../../base/base.dart';
import '../../validation_utils.dart';
import '../login/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = 'register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends BaseState<RegisterScreen, RegisterViewModel>
    implements RegisterNavigator {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var userNameController = TextEditingController();

  var fullNameController = TextEditingController();
  var phoneController = TextEditingController();

  var aidadatecontroller = TextEditingController();

  bool securedPassword = true;


  @override
  RegisterViewModel initViewModel() {
    return RegisterViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.fill)),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              centerTitle: true,
              backgroundColor: Colors.transparent,
              title: const Text('Create Account'),
            ),
            body: Container(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .25,
                      ),
                      TextFormField(
                        controller: fullNameController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please Enter Full Name";
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(labelText: 'Full Name'),
                      ),
                      TextFormField(
                        controller: userNameController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please Enter User Name";
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(labelText: 'User Name'),
                      ),
                      TextFormField(
                        controller: aidadatecontroller,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please Enter Data";
                          }
                          return null;
                        },
                        onChanged: (String datasaida){
                          getSaidaName(datasaida);
                        },
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(
                              fontSize: 10),
                          prefixIcon: Icon(
                            Icons.calendar_month_outlined,
                            size: 28,
                          ),

                          labelText: "Data da sandal",
                          labelStyle: TextStyle( fontSize: 13),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                            ),
                          ),
                        ),
                        onTap: () async {
                          DateTime? pickeddate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2022),
                              lastDate: DateTime(2036));

                          if (pickeddate != null) {
                            setState(() {
                               var datasaida = DateFormat('dd-MM-yyyy').format(pickeddate);
                               String dateString = '2021-05-30';
                               DateTime dateTime = DateTime.parse(dateString);
                            });
                          }

                        },
                        style: const TextStyle(fontSize: 21, color: Colors.blue),
                        textAlign: TextAlign.left,
                        cursorColor: Colors.blue,
                      ),
                      TextFormField(
                        controller: emailController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please Enter Email Address";
                          }
                          if (!ValidationUtils.isValidEmail(text)) {
                            return 'Please enter A Valid Email';
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(labelText: 'E-mail Address'),
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please Enter Password";
                          }
                          if (text.length < 6) {
                            return 'Password sold be at Least 6 Chars ';
                          }
                          return null;
                        },
                        obscureText: securedPassword,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: InkWell(
                              onTap: () {
                                securedPassword = !securedPassword;
                                setState(() {});
                              },
                              child: Icon(//Icons.abc,
                                  // color: Colors.white,

                                  securedPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            createAccountClick();
                          },
                          style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.all(10))),
                          child: const Text(
                            'Create Account',
                            style: TextStyle(fontSize: 18),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, LoginScreen.routeName);
                          },
                          child: const Text("Already Have Account?")),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }

  var authService = FirebaseAuth.instance;

  void createAccountClick() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
    viewModel.register(emailController.text, passwordController.text,
        fullNameController.text,
        userNameController.text,phoneController.text ,
        aidadatecontroller.text);
  }

  @override
  void gotoHome() {
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }

}
