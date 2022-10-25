import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/app_routes.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String v1 = "";
  String v2 = "";
  bool visible = true;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 70),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "Вход",
                    style: GoogleFonts.openSans(
                        fontWeight: FontWeight.w700, fontSize: 22),
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            v1 = value ?? "";
                            return value!.isEmpty
                                ? "Please enter your email"
                                : "";
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: GoogleFonts.openSans(
                                color: Colors.grey.withOpacity(0.5)),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          obscureText: visible,
                          validator: (value) {
                            v2 = value ?? "";
                            return value!.isEmpty
                                ? "Please write the password"
                                : "";
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: GoogleFonts.openSans(
                                color: Colors.grey.withOpacity(0.5)),
                            suffixIcon: visible
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        visible = !visible;
                                      });
                                    },
                                    icon: Icon(Icons.visibility_outlined))
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        visible = !visible;
                                      });
                                    },
                                    icon: Icon(Icons.visibility_off_outlined)),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 320,
                              height: 60,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff2A2A2A),
                                ),
                                onPressed: () {
                                  _formKey.currentState!.validate();
                                  if (v1.length > 0 && v2.length > 0) {
                                    saveLogin();
                                    Navigator.pushNamed(
                                        context, RouteName.home);
                                  }
                                },
                                child: Text(
                                  'Войти',
                                  style: GoogleFonts.openSans(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 70),
                  Text(
                    '—     Или    —',
                    style: GoogleFonts.openSans(fontSize: 15),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child:
                            SvgPicture.asset('assets/images/google_icon.svg'),
                      ),
                      SizedBox(width: 25),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset('assets/images/apple_icon.svg'),
                      ),
                    ],
                  ),
                  SizedBox(height: 60),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RouteName.signup);
                    },
                    child: Text(
                      'Нет аккаунта? Войти',
                      style: GoogleFonts.openSans(
                          fontSize: 13, fontWeight: FontWeight.w200),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }

  void saveLogin() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    _pref.setBool("isLoggedIn", true);
  }
}
