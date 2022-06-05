import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:otpgenerator/pages/colorpallet.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OtpGenerator(),
    ),
  );
}

class OtpGenerator extends StatefulWidget {
  const OtpGenerator({Key? key}) : super(key: key);

  @override
  _OtpGeneratorState createState() => _OtpGeneratorState();
}

class _OtpGeneratorState extends State<OtpGenerator> {
  int length = 0;

  int otp1 = 000000;

  Random r1 = Random();
  TextEditingController lengthcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff15172b),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            const Text(
              "OTP Generator",
              style: TextStyle(
                fontSize: 25,
                color: Color(0xfff6db87),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 50,
              width: 300,
              child: TextField(
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                decoration: const InputDecoration(
                  hintText: "Enter length",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                controller: lengthcontroller,
                maxLength: 1,
                autofocus: true,
                keyboardType: TextInputType.number,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.redAccent),
                fixedSize: const Size(200, 50),
                primary: Color(0xff15172b),
              ),
              onPressed: () {
                FocusScope.of(context).unfocus();
                length = int.parse(lengthcontroller.text);

                setState(() {
                  if (length <= 6 && length >= 2) {
                    if (length == 6) {
                      otp1 = r1.nextInt(999999);

                    } else if (length == 5) {
                      otp1 = r1.nextInt(99999);

                    } else if (length == 4) {

                      otp1 = r1.nextInt(9999);
                    } else if (length == 3) {

                      otp1 = r1.nextInt(999);
                    } else if (length == 2) {

                      otp1 = r1.nextInt(99);
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("length is not less 7..."),
                      ),
                    );
                  }
                });
              },
              child: const Text(
                "Generate OTP",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.center,
              child: const Text(
                "Your OTP is: ",
                style: TextStyle(
                  color: Color(0xfff6db87),
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Text(
                      "$otp1",
                      style: const TextStyle(
                        letterSpacing: 30,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    height: 40,
                    width: 300,
                    alignment: Alignment.center,
                  ),
                ],
              ),
              height: 70,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.redAccent),
                fixedSize: const Size(200, 50),
                primary: Color(0xff15172b),
              ),
              onPressed: () {
                setState(() {
                  otp1 = 0;

                  lengthcontroller.clear();
                });
              },
              child: const Text(
                "Reset",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
