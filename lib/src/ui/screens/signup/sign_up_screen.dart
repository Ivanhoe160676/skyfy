// ignore_for_file: library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skyfy/src/ui/utils/ui.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool rememberMe = false;

  Widget buildRememberMeCheckbox() {
    return Column(children: [
      Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white),
            child: Checkbox(
              value: rememberMe,
              checkColor: Colors.blue,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  rememberMe = value!;
                });
              },
            ),
          ),
          const Text('I Agree to the ',
              style: TextStyle(
                  color: Color.fromRGBO(171, 146, 120, 100),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                  fontSize: 12)),
          InkWell(
            onTap: () {},
            child: const Text(
              'Terms of Services ',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Asterone-Regular'),
            ),
          ),
          const Text('&  ',
              style: TextStyle(
                  color: Color.fromRGBO(171, 146, 120, 100),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'OpenSans',
                  fontSize: 12)),
          InkWell(
            onTap: () {},
            child: const Text(
              'Private Policy',
              style: TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Asterone-Regular'),
            ),
          ),
        ],
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        colors: <Color>[
                          Color(0xff5352fa),
                          Color(0xff1b1c1c),
                        ]),
                  )
                  //color: const Color(0xff002554),
                  ),
              SizedBox(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 0.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.15,
                      ),
                      logoSkyfy(context),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'HelveticaNeueLTStd-HvCn',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      //const FormSignUp(),
                      buildRememberMeCheckbox(),
                      // buildNameTF(),
                      // const SizedBox(height: 10.0),
                      // buildEmailTF(),
                      // const SizedBox(height: 10.0),
                      // buildPasswordTF(),
                      // const SizedBox(height: 10.0),
                      // buildReenterPasswordTF(),
                      // const SizedBox(height: 20.0),
                      // buildRegisterBtn(),
                      //buildSigninBtn(context),
                      // const SizedBox(height: 60.0),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
