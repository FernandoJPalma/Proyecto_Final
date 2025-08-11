import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  final usuarioStorage = GetStorage('usuarioStorage');

  void _login() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    final user = _userController.text;
    final pass = _passwordController.text;

    if (user == usuarioStorage.read('usuario') && pass == usuarioStorage.read('password')){
      usuarioStorage.write('isLoggedIn', true);
      context.go('/homepage');
    } else {
      _showSnackBar('Usuario o contraseña incorrectos');
    }



    //TODO: Borrar antes de mandar 
    // Usuario de prueba para el desarrollo
    /*
    if (user == 'usuario' && pass == '12345678') {
      GetStorage().write('isLoggedIn', true);
      GetStorage().write('user', _userController.text);
      context.go('/homepage');
    } else {
      _showSnackBar('Usuario o contraseña incorrectos');
    }
    */
  }
  

  void _showSnackBar(String mensaje) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensaje)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iniciar sesión')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
          children: [
            TextFormField(
              controller: _userController,
              decoration: const InputDecoration(labelText: 'Usuario'),
              validator: (value) =>
                    value!.isEmpty ? 'Este campo es obligatorio' : null,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: 'Contraseña',
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
              ),
                validator: (value) =>
                    value!.isEmpty ? 'Este campo es obligatorio' : null,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: const Text('Entrar'),
            ),
            TextButton(
              onPressed: () {
                context.push('/signIn');
              },
              child: const Text('¿No tienes cuenta? Regístrate'),
            ),
          ],
          ),
        ),
      ),
    );
  }
}
