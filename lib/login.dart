import 'package:flutter/material.dart';
import 'package:latihankuis/homepage.dart'; // Pastikan path ini benar

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = "";
  String password = "";
  bool isLoginSuccess = true;
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    // Menggunakan Center untuk memastikan konten berada di tengah
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selamat Datang"),
        centerTitle: true,
        backgroundColor: Colors.indigo.shade700,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: _loginCard(context),
        ),
      ),
    );
  }

  Widget _loginCard(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Masuk ke Akun Anda",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            // Indikator Pesan Status (jika gagal)
            if (!isLoginSuccess)
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Text(
                  "Login Gagal! Username atau password salah.",
                  style: TextStyle(
                    color: Colors.red.shade700,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            _usernameField(),
            const SizedBox(height: 16),
            _passwordField(),
            const SizedBox(height: 24),
            _LoginButton(context),
          ],
        ),
      ),
    );
  }

  // Widget untuk input Username
  Widget _usernameField() {
    return TextFormField(
      enabled: true,
      onChanged: (value) {
        username = value;
      },
      decoration: InputDecoration(
        labelText: 'Username',
        prefixIcon: const Icon(Icons.person_outline),
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: isLoginSuccess ? Colors.indigo.shade400 : Colors.red, // Warna border dinamis
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.indigo, width: 2.0),
        ),
      ),
    );
  }

  // Widget untuk input Password
  Widget _passwordField() {
    return TextFormField(
      enabled: true,
      onChanged: (value) {
        password = value;
      },
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(Icons.lock_outline),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: isLoginSuccess ? Colors.indigo.shade400 : Colors.red, // Warna border dinamis
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.indigo, width: 2.0),
        ),
      ),
    );
  }

  // Widget untuk tombol Login
  Widget _LoginButton(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo.shade600,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(vertical: 14),
        elevation: 5,
      ),
      onPressed: () {
        // Logika autentikasi
        if (username == "faza" && password == "12345") {
          setState(() {
            isLoginSuccess = true;
          });
          // Menggunakan `pushReplacement` agar user tidak bisa kembali ke halaman login setelah sukses
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) {
              return homepage(username: username);
            }),
          );
          // Tampilkan snackbar sukses
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login Berhasil! Selamat datang."),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          setState(() {
            isLoginSuccess = false; // Set status gagal
          });
          // Tampilkan snackbar gagal
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login Gagal: Username atau password salah."),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: const Text(
        "LOGIN",
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
