import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme.dart';
import 'app_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _secretCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscure = true;
  bool _loading = false;
  String? _error;

  static const Color _vertFonce = Color(0xFF014A06);
  static const Color _vertPrimaire = Color(0xFF027030);

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() { _loading = true; _error = null; });
    final ok = await context.read<AppState>().login(_secretCtrl.text.trim());
    if (!mounted) return;
    if (!ok) {
      setState(() {
        _error = 'Code secret incorrect.';
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _secretCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Colors.white30, width: 1),
    );

    return Scaffold(
      backgroundColor: _vertFonce,
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  // Logo + titre
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: _vertPrimaire.withValues(alpha: 0.2),
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: _vertPrimaire.withValues(alpha: 0.4),
                                  width: 1),
                            ),
                            child: const Icon(Icons.restaurant,
                                color: Colors.white, size: 48),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'FlexFood',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Espace Agent ESATIC',
                            style:
                                TextStyle(color: Colors.white70, fontSize: 16),
                          ),
                          const SizedBox(height: 40),

                          // Champ code secret uniquement
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 24),
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                controller: _secretCtrl,
                                obscureText: _obscure,
                                keyboardType: TextInputType.number,
                                style: const TextStyle(color: _vertFonce),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  isDense: true,
                                  contentPadding:
                                      const EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 16),
                                  hintText: 'Code secret',
                                  hintStyle:
                                      TextStyle(color: _vertFonce.withValues(alpha: 0.5)),
                                  prefixIcon: const Icon(Icons.lock_outline,
                                      color: _vertFonce),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscure
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                      color: _vertFonce,
                                    ),
                                    onPressed: () =>
                                        setState(() => _obscure = !_obscure),
                                  ),
                                  enabledBorder: inputBorder,
                                  focusedBorder: inputBorder.copyWith(
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 1.5)),
                                  errorBorder: inputBorder.copyWith(
                                      borderSide: const BorderSide(
                                          color: AppColors.error)),
                                  focusedErrorBorder: inputBorder.copyWith(
                                      borderSide: const BorderSide(
                                          color: AppColors.error, width: 1.5)),
                                ),
                                validator: (v) =>
                                    v == null || v.trim().isEmpty
                                        ? 'Champ requis'
                                        : null,
                                onFieldSubmitted: (_) => _login(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 40),
                        ],
                      ),
                    ),
                  ),

                  // Carte blanche en bas
                  Container(
                    width: double.infinity,
                    padding:
                        const EdgeInsets.fromLTRB(40, 40, 40, 40),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_error != null) ...[
                          Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.errorBg,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: AppColors.error.withValues(alpha: 0.3)),
                            ),
                            child: Row(children: [
                              const Icon(Icons.error_outline,
                                  color: AppColors.error, size: 18),
                              const SizedBox(width: 8),
                              Expanded(
                                  child: Text(_error!,
                                      style: const TextStyle(
                                          color: AppColors.error,
                                          fontSize: 13))),
                            ]),
                          ),
                        ],

                        GestureDetector(
                          onTap: _loading ? null : _login,
                          child: Container(
                            width: double.infinity,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  _vertPrimaire,
                                  _vertPrimaire.withValues(alpha: 0.8),
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: _vertPrimaire.withValues(alpha: 0.4),
                                  blurRadius: 12,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Center(
                              child: _loading
                                  ? const SizedBox(
                                      height: 22,
                                      width: 22,
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2.5,
                                          color: Colors.white))
                                  : const Text(
                                      'Se Connecter',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),
                        const Text(
                          'FlexFood ESATIC • Abidjan Zone 4',
                          style:
                              TextStyle(color: Colors.black38, fontSize: 11),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
