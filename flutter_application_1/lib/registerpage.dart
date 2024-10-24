import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Pindahkan deklarasi ke dalam State class
  final formKey = GlobalKey<FormState>();
  final namaLengkapController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    // Jangan lupa untuk membersihkan controller setelah tidak dipakai
    namaLengkapController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey, // Jangan lupa menambahkan formKey di sini
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: namaLengkapController, // Tambahkan controller
                decoration: InputDecoration(
                  labelText: 'Nama Lengkap',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama Tidak Boleh Kosong';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailController, // Tambahkan controller
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  }
                  if (!RegExp(r'^[^@]+@[^@]+.[^@]+').hasMatch(value)) {
                    return 'Masukkan email yang valid';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordController, // Tambahkan controller
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  }
                  if (value.length < 6) {
                    return 'Masukkan Password yang Valid';
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: confirmPasswordController, // Tambahkan controller
                decoration: InputDecoration(
                  labelText: 'Konfirmasi Password',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Isikan Konfirmasi Password Anda';
                  }
                  if (value != passwordController.text) {
                    return 'Password Tidak Cocok';
                  }
                  return null;
                },
                obscureText: true,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, '/');
                  }
                },
                child: Text('Daftar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Sudah punya akun? Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
