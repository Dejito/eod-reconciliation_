import 'package:eod_reconcilaton/screens/selection_screen.dart';
import 'package:eod_reconcilaton/widgets/loading_indicator.dart';
import 'package:eod_reconcilaton/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  static const id = 'landing_page';

  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('EOD Reconciliation'
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(16),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/landing_page.png',
                  fit: BoxFit.fill,
                ),
                const Text(
                  "EOD Reconciliation",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                const SizedBox(
                  height: 48,
                ),
                const TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Enter your phone number",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: "Enter your pin",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),

                // Spacer(),

                const SizedBox(height: 100),

                buildElevatedButton(
                    onPressed: () async {
                      showLoadingIndicator();
                      await Future.delayed(const Duration(seconds: 2));
                      dismissLoadingIndicator();
                      if (context.mounted) {
                        Navigator.of(context)
                            .pushReplacementNamed(SelectionScreen.id);
                      }
                    },
                    label: "Login",

                    buttonColor: Colors.blueAccent.shade200,
                    textColor: Colors.white,
                    borderColor: Colors.transparent),
                const SizedBox(
                  height: 10,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    const Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(top: 15),
    width: 260,
    height: 44,
    child: GestureDetector(
      onTap: () {},
      child: const Text(
        "Forgot Password",
        style: TextStyle(
            decoration: TextDecoration.underline, decorationColor: Colors.blue),
      ),
    ),
  );
}
