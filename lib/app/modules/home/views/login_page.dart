import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 80.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Bagian animasi logo dan nama aplikasi
              Obx(() => AnimatedOpacity(
                    opacity: loginController.showLogo.value ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 500),
                    child: Center(
                      child: Column(
                        children: [
                          Image.asset('assets/logo_meditek.png', height: 120),
                          SizedBox(height: 20),
                          Text(
                            'Meditek',
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
              SizedBox(height: 50),

              // Input Username
              Text(
                'Username',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  loginController.username.value = value; // Update username
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your username',
                ),
              ),
              SizedBox(height: 20),

              // Input Password
              Text(
                'Password',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: (value) {
                  loginController.password.value = value; // Update password
                },
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your password',
                ),
              ),
              SizedBox(height: 30),

              // Tombol Login
              Obx(() => ElevatedButton(
                    onPressed: loginController.isLoading.value
                        ? null
                        : loginController.login,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: loginController.isLoading.value
                        ? CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          )
                        : Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                  )),
              SizedBox(height: 20),

              // Teks Lupa Password dan Daftar Akun
              Center(
                child: Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        Get.snackbar("Forgot Password", "Feature coming soon!",
                            snackPosition: SnackPosition.BOTTOM);
                      },
                      child: Text(
                        'Forgot your password?',
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigasi ke halaman register (misalnya)
                        // Get.toNamed('/register');
                      },
                      child: Text(
                        'Don\'t have an account? Sign up',
                        style: TextStyle(color: Colors.teal),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
