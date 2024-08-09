import 'package:eod/screens/selection_screen.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  static const id = 'landing_page';

  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('EOD Reconciliation'
      //   ),
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // margin: const EdgeInsets.all(5),
                child: Image.asset(
                  'assets/images/landing_page.png',
                  fit: BoxFit.fill,
                ),
              ),
              const Text(
                "EOD Reconciliation",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
              SizedBox(
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

              const SizedBox(height: 30),

              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacementNamed(SelectionScreen.id);
                  },
                  // style: ButtonStyle(
                  //   tapTargetSize: MaterialTapTargetSize.padded
                  // ),
                  // icon: const Icon(Icons.arrow_forward_ios_sharp),
                  // label: const Text('Get Started'),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.resolveWith<double>((states) => 0),
                  fixedSize: MaterialStateProperty.resolveWith<Size>(
                        (states) => Size( 425, 50),
                  ),
                ), child: Text("Get Started"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
