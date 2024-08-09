import 'package:eod_reconcilaton/screens/selection_screen.dart';
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
        
                const SizedBox(height: 30),
        
                forgotPassword(),


                ElevatedButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.resolveWith<double>((states) => 0),
                    fixedSize: MaterialStateProperty.resolveWith<Size>(
                          (states) => Size(425, 50),
                    ),
                    shape: MaterialStateProperty.resolveWith<OutlinedBorder>((states) {
                      Color borderColor = Colors.blueAccent;
                      return RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular4.r),
                        side: BorderSide(width: 2, color: this.borderColor ?? borderColor),
                      );
                    }),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                          (Set<MaterialState> states) {
                        if (states.contains(MaterialState.disabled) || onPressed == null) {
                          return (color ?? AppColors.iAmAliveBlue.withOpacity(0.2));
                        }
                        return color ?? AppColors.iAmAliveBlue;
                      },
                    ),
                  ),
                  onPressed: onPressed,
                  child: text != null
                      ? Text(text!,
                      style: GoogleFonts.inter(
                        fontSize: fontSize ?? 16.sp,
                        color: textColor ?? Colors.white,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                      ))
                      : child,
                )

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
                          (states) => const Size( 425, 50),
                    ),
                  ),
                  child: const Text("Get Started"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


// Widget buildLoginAndRegButton(
//     String buttonName,
//     String buttonType, void Function() onTap,
//     ) {
//   return GestureDetector(
//     onTap: onTap,
//     child: Container(
//       width: 350.w,
//       height: 50.h,
//       margin: EdgeInsets.only(top: buttonType == "login" ? 40.h : 20.h),
//       decoration: BoxDecoration(
//           color: buttonType == 'login'
//               ? AppColors.primaryElement
//               : AppColors.primaryBackground,
//           borderRadius: BorderRadius.circular(15.w),
//           border: Border.all(
//             color: buttonType == 'login'
//                 ? Colors.transparent
//                 : AppColors.primaryFourElementText,
//           ),
//           boxShadow: [
//             BoxShadow(
//                 spreadRadius: 1,
//                 blurRadius: 2,
//                 offset: const Offset(0, 1),
//                 color: Colors.grey.withOpacity(0.1))
//           ]),
//       child: Center(
//         child: Text(
//           buttonName,
//           style: TextStyle(
//               color: buttonType == 'login' ? Colors.white : Colors.black,
//               fontSize: 16),
//         ),
//       ),
//     ),
//   );
// }

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