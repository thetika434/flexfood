import 'package:flutter/material.dart';
import '../services/service_admin.dart';

class LoginScreen extends StatefulWidget {
  final VoidCallback onLogin;
  const LoginScreen({super.key, required this.onLogin});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginCtrl = TextEditingController();
  final _passCtrl  = TextEditingController();
  bool _obscure = true, _loading = false;
  String? _erreur;

  static const _vertFonce   = Color(0xFF014A06);
  static const _vertPrimaire = Color(0xFF027030);

  Future<void> _connexion() async {
    setState(() { _loading = true; _erreur = null; });
    try {
      final ok = await ServiceAdmin.connecter(
        _loginCtrl.text.trim(), _passCtrl.text);
      if (ok) {
        widget.onLogin();
      } else {
        setState(() { _erreur = 'Identifiants incorrects.'; _loading = false; });
      }
    } catch (_) {
      setState(() { _erreur = 'Impossible de joindre le serveur.'; _loading = false; });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _vertFonce,
      body: SafeArea(child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top),
          child: IntrinsicHeight(child: Column(children: [
            const SizedBox(height: 40),
            Expanded(child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [
              Container(
                width: 100, height: 100,
                decoration: BoxDecoration(
                  color: _vertPrimaire.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: _vertPrimaire.withValues(alpha: 0.4)),
                ),
                child: const Icon(Icons.admin_panel_settings, color: Colors.white, size: 50),
              ),
              const SizedBox(height: 24),
              const Text('FlexFood', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, letterSpacing: 2)),
              const SizedBox(height: 6),
              const Text('Administration ESATIC', style: TextStyle(color: Colors.white70, fontSize: 15)),
              const SizedBox(height: 40),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 24), child: Column(children: [
                _champ(controller: _loginCtrl, hint: 'Identifiant', icon: Icons.person_outline),
                const SizedBox(height: 14),
                _champ(controller: _passCtrl, hint: 'Mot de passe', icon: Icons.lock_outline, obscure: true),
              ])),
            ]))),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(32, 32, 32, 32),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(28), topRight: Radius.circular(28)),
              ),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                if (_erreur != null) ...[
                  Container(
                    margin: const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: const Color(0xFFFFEBEE), borderRadius: BorderRadius.circular(8)),
                    child: Row(children: [
                      const Icon(Icons.error_outline, color: Color(0xFFD32F2F), size: 16),
                      const SizedBox(width: 8),
                      Text(_erreur!, style: const TextStyle(color: Color(0xFFD32F2F), fontSize: 13)),
                    ]),
                  ),
                ],
                GestureDetector(
                  onTap: _loading ? null : _connexion,
                  child: Container(
                    width: double.infinity, height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      gradient: LinearGradient(colors: [_vertPrimaire, _vertPrimaire.withValues(alpha: 0.8)]),
                      boxShadow: [BoxShadow(color: _vertPrimaire.withValues(alpha: 0.4), blurRadius: 10, offset: const Offset(0, 4))],
                    ),
                    child: Center(child: _loading
                        ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2.5, color: Colors.white))
                        : const Text('Se connecter', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('FlexFood ESATIC • Abidjan Zone 4', style: TextStyle(color: Colors.black38, fontSize: 11)),
              ]),
            ),
          ])),
        ),
      )),
    );
  }

  Widget _champ({required TextEditingController controller, required String hint, required IconData icon, bool obscure = false}) {
    return TextField(
      controller: controller,
      obscureText: obscure ? _obscure : false,
      style: const TextStyle(color: Color(0xFF014A06)),
      decoration: InputDecoration(
        filled: true, fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        hintText: hint, hintStyle: TextStyle(color: const Color(0xFF014A06).withValues(alpha: 0.5)),
        prefixIcon: Icon(icon, color: const Color(0xFF014A06)),
        suffixIcon: obscure ? IconButton(
          icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility, color: const Color(0xFF014A06)),
          onPressed: () => setState(() => _obscure = !_obscure),
        ) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(28), borderSide: const BorderSide(color: Colors.white30)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(28), borderSide: const BorderSide(color: Colors.white30)),
      ),
      onSubmitted: (_) => _connexion(),
    );
  }
}
