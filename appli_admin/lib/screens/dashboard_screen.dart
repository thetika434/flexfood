import 'package:flutter/material.dart';
import '../services/service_admin.dart';

class DashboardScreen extends StatefulWidget {
  final VoidCallback onLogout;
  const DashboardScreen({super.key, required this.onLogout});
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  static const _vert = Color(0xFF1B5E20);
  static const _vertClair = Color(0xFF2E7D32);

  List<EtudiantAdmin> _etudiants = [];
  List<TransactionAdmin> _transactions = [];
  bool _chargement = true;

  @override
  void initState() {
    super.initState();
    _charger();
  }

  Future<void> _charger() async {
    setState(() => _chargement = true);
    final etudiants = await ServiceAdmin.obtenirEtudiants();
    final transactions = await ServiceAdmin.obtenirTransactions();
    if (mounted) setState(() { _etudiants = etudiants; _transactions = transactions; _chargement = false; });
  }

  int get _repasAujourdhui {
    final debut = DateTime.now().copyWith(hour: 0, minute: 0, second: 0);
    return _transactions.where((t) => t.type == 'repas' && t.date.isAfter(debut)).length;
  }

  int get _rechargeAujourdhui {
    final debut = DateTime.now().copyWith(hour: 0, minute: 0, second: 0);
    return _transactions.where((t) => t.type == 'rechargement' && t.date.isAfter(debut)).fold(0, (s, t) => s + t.montant);
  }

  int get _transfertsAujourdhui {
    final debut = DateTime.now().copyWith(hour: 0, minute: 0, second: 0);
    return _transactions.where((t) => t.type == 'transfert_envoye' && t.date.isAfter(debut)).length;
  }

  int get _soldeTotal => _etudiants.fold(0, (s, e) => s + e.solde);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: RefreshIndicator(
        onRefresh: _charger,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 140,
              pinned: true,
              backgroundColor: _vert,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF014A06), _vertClair],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('FlexFood Admin', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                              SizedBox(height: 2),
                              Text('ESATIC • Tableau de bord', style: TextStyle(color: Colors.white70, fontSize: 13)),
                            ],
                          ),
                          IconButton(
                            icon: const Icon(Icons.logout, color: Colors.white70),
                            onPressed: widget.onLogout,
                            tooltip: 'Déconnexion',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (_chargement)
              const SliverFillRemaining(child: Center(child: CircularProgressIndicator()))
            else
              SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    _sectionTitre('Aujourd\'hui'),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(child: _carteStat('Repas servis', '$_repasAujourdhui', Icons.restaurant, const Color(0xFF1565C0))),
                        const SizedBox(width: 12),
                        Expanded(child: _carteStat('Rechargé', '$_rechargeAujourdhui F', Icons.account_balance_wallet, const Color(0xFF6A1B9A))),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(child: _carteStat('Transferts', '$_transfertsAujourdhui', Icons.swap_horiz, const Color(0xFFE65100))),
                        const SizedBox(width: 12),
                        Expanded(child: _carteStat('Étudiants', '${_etudiants.length}', Icons.people, _vert)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _sectionTitre('Aperçu général'),
                    const SizedBox(height: 10),
                    _carteSoldeTotal(),
                    const SizedBox(height: 20),
                    _sectionTitre('Dernières transactions'),
                    const SizedBox(height: 10),
                    if (_transactions.isEmpty)
                      const Center(child: Text('Aucune transaction', style: TextStyle(color: Colors.black45)))
                    else
                      ..._transactions.take(5).map(_carteTx),
                  ]),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitre(String titre) => Text(titre,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF212121)));

  Widget _carteStat(String label, String valeur, IconData icone, Color couleur) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Row(
        children: [
          Container(
            width: 40, height: 40,
            decoration: BoxDecoration(color: couleur.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(10)),
            child: Icon(icone, color: couleur, size: 22),
          ),
          const SizedBox(width: 12),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(valeur, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: couleur)),
              Text(label, style: const TextStyle(fontSize: 11, color: Colors.black54)),
            ],
          )),
        ],
      ),
    );
  }

  Widget _carteSoldeTotal() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF014A06), Color(0xFF2E7D32)]),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: const Color(0xFF1B5E20).withValues(alpha: 0.3), blurRadius: 12, offset: const Offset(0, 4))],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Solde total des étudiants', style: TextStyle(color: Colors.white70, fontSize: 13)),
          const SizedBox(height: 6),
          Text('$_soldeTotal FCFA', style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text('Réparti sur ${_etudiants.length} étudiants', style: const TextStyle(color: Colors.white60, fontSize: 12)),
        ],
      ),
    );
  }

  Widget _carteTx(TransactionAdmin tx) {
    final isRepas = tx.type == 'repas';
    final isRecharge = tx.type == 'rechargement';
    final couleur = isRepas ? const Color(0xFF1565C0) : isRecharge ? const Color(0xFF2E7D32) : const Color(0xFFE65100);
    final icone = isRepas ? Icons.restaurant : isRecharge ? Icons.add_card : Icons.swap_horiz;
    final signe = isRepas ? '-' : '+';
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6)],
      ),
      child: Row(
        children: [
          Container(
            width: 38, height: 38,
            decoration: BoxDecoration(color: couleur.withValues(alpha: 0.1), shape: BoxShape.circle),
            child: Icon(icone, color: couleur, size: 18),
          ),
          const SizedBox(width: 12),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(tx.nomEtudiant, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
              Text(tx.matricule, style: const TextStyle(color: Colors.black45, fontSize: 11)),
            ],
          )),
          Text('$signe${tx.montant} F', style: TextStyle(fontWeight: FontWeight.bold, color: couleur, fontSize: 14)),
        ],
      ),
    );
  }
}
