import 'dart:async';
import 'package:flutter/material.dart';
import '../constantes/couleurs.dart';

class BanniereNotification extends StatefulWidget {
  final Widget enfant;
  const BanniereNotification({super.key, required this.enfant});

  static final GlobalKey<BanniereNotificationEtat> cle = GlobalKey();

  static void afficher(String titre, String message) {
    cle.currentState?.afficher(titre, message);
  }

  @override
  State<BanniereNotification> createState() => BanniereNotificationEtat();
}

class BanniereNotificationEtat extends State<BanniereNotification>
    with SingleTickerProviderStateMixin {
  String _titre = '';
  String _message = '';
  bool _visible = false;
  Timer? _timer;
  late AnimationController _controleur;
  late Animation<Offset> _glissement;

  @override
  void initState() {
    super.initState();
    _controleur = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _glissement = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controleur, curve: Curves.easeOut));
  }

  void afficher(String titre, String message) {
    _timer?.cancel();
    setState(() {
      _titre = titre;
      _message = message;
      _visible = true;
    });
    _controleur.forward(from: 0);
    _timer = Timer(const Duration(seconds: 4), masquer);
  }

  void masquer() {
    _controleur.reverse().then((_) {
      if (mounted) setState(() => _visible = false);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controleur.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.enfant,
        if (_visible)
          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            left: 16,
            right: 16,
            child: SlideTransition(
              position: _glissement,
              child: Material(
                elevation: 6,
                borderRadius: BorderRadius.circular(16),
                child: GestureDetector(
                  onTap: masquer,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                    decoration: BoxDecoration(
                      color: Couleurs.vertFonce,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.notifications, color: Colors.white, size: 20),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_titre,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14)),
                              const SizedBox(height: 2),
                              Text(_message,
                                  style: TextStyle(
                                      color: Colors.white.withValues(alpha: 0.85),
                                      fontSize: 13)),
                            ],
                          ),
                        ),
                        Icon(Icons.close, color: Colors.white.withValues(alpha: 0.6), size: 18),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
