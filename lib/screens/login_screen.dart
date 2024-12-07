import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Image.asset(
                  'assets/images/bisou_logo.png',
                  width: 150,
                ),
                const SizedBox(height: 20),
                // Welcome Text
                const Text(
                  'Welcome Back!',
                  style: TextStyle(
                    fontFamily: 'GianottenLTW04-Regular',
                    fontSize: 28,
                    color: Color.fromARGB(255, 31, 89, 170), // Updated color
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Please login to your account',
                  style: TextStyle(
                    fontFamily: 'Arial_Regular',
                    fontSize: 16,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 30),
                // Email Field
                TextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                      color: Color(0xFF0E3C3D),
                      fontFamily: 'Arial_Regular',
                    ),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Color(0xFFC52127),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFFC52127),
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 20),
                // Password Field
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: Color(0xFF0E3C3D),
                      fontFamily: 'Arial_Regular',
                    ),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Color(0xFFC52127),
                    ),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.9),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: Color(0xFFC52127),
                        width: 2,
                      ),
                    ),
                    contentPadding: const EdgeInsets.all(16),
                  ),
                ),
                const SizedBox(height: 10),
                // Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/forgot_password');
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Color(0xFF0E3C3D),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Arial_Regular',
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                // Login Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFC52127),
                    shadowColor: const Color(0xFFC52127).withOpacity(0.5),
                    elevation: 8,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 100, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'Arial_Regular',
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Social Media Connect Options
                const Text(
                  'Or connect with',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    fontFamily: 'Arial_Regular',
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Facebook Button
                    IconButton(
                      icon: Image.asset('assets/images/facebook.png'),
                      iconSize: 40,
                      onPressed: () {
                        // Add your Facebook authentication logic here
                      },
                    ),
                    const SizedBox(width: 20),
                    // Google Button
                    IconButton(
                      icon: Image.asset('assets/images/google.png'),
                      iconSize: 40,
                      onPressed: () {
                        // Add your Google authentication logic here
                      },
                    ),
                    const SizedBox(width: 20),
                    // Apple Button
                    IconButton(
                      icon: Image.asset('assets/images/apple-logo.png'),
                      iconSize: 40,
                      onPressed: () {
                        // Add your Apple authentication logic here
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Signup Link
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup');
                  },
                  child: const Text(
                    "Don't have an account? Sign Up",
                    style: TextStyle(
                      color: Color(0xFF0E3C3D),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Arial_Regular',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
