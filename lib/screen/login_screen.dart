import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:three_screen_test_project/material/color.dart';
import 'package:three_screen_test_project/screen/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColors.colorPrimary,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 10),
              child:
                  Center(child: Image.asset('assets/images/login_sc_logo.png')),
            ),
            const Center(
              child: Text(
                'Login to your account & start delivering.',
                style: TextStyle(
                    color: AppColors.secondaryTextColor, fontSize: 16),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  hintText: 'Enter Your Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.colorPrimary),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                cursorColor: AppColors.colorPrimary,
              ),
            ),
            const SizedBox(height: 20), // Add some space between text fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                obscureText: true, // For password field
                decoration: InputDecoration(
                  hintText: 'Enter Your password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6)),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.visibility),
                    onPressed: () {},
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.colorPrimary),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                ),
                cursorColor: AppColors.colorPrimary,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10, right: 20),
              alignment: Alignment.centerRight,
              child: const Text(
                'Forgot Password?',
                style: TextStyle(color: AppColors.colorPrimary, fontSize: 14),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.call,
                  color: AppColors.colorPrimary,
                  size: 16,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'Login with phone number',
                  style: TextStyle(color: AppColors.colorPrimary, fontSize: 16),
                )
              ],
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const DashboardScreen(),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(10),
                  height: 48,
                  width: 358,
                  decoration: BoxDecoration(
                      color: AppColors.colorPrimary,
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(color: AppColors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
