import 'package:flutter/material.dart';
import '../services/service_admin.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});
  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> {
  List<TransactionAdmin> _toutes = [];
  String _filtre = 'tous';
  bool _chargement = true;

  @override
  void initState() {
    super.initState();
    _charger();
  }

  Future<void> _charger() async {
    setState(() => _chargement = true);
    final liste = await ServiceAdmin.obtenirTransactions();
    if (mounted) setState(() { _toutes = liste; _chargement = false; });
  }

  List<TransactionAdmin> get _filtrees => _toutes.where((t) {
    if (_filtre == 'tous') return true;
    return t.type == _filtre;
  }).toList();

  @override
  Widget build(BuildContext context) {
    final liste = _filtrees;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF212121),
        elevation: 0,
        title: const Text('Transactions', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [IconButton(icon: const Icon(Icons.refresh), onPressed: _charger)],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: Row(
              children: [
                _chip('tous', 'Toutes'),
                const SizedBox(width: 8),
                _chip('repas', 'Repas'),
                const SizedBox(width: 8),
                _chip('rechargement', 'Rechargements'),
                const SizedBox(width: 8),
                _chip('transfert_envoye', 'Transferts'),
              ],
            ),
          ),
        ),
      ),
      body: _chargement
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _charger,
              child: liste.isEmpty
                  ? const Center(child: Text('Aucune transaction', style: TextStyle(color: Colors.black45)))
                  : ListView.builder(
                      padding: const EdgeInsets.all(16),
                      itemCount: liste.length,
                      itemBuilder: (_, i) => _carteTx(liste[i]),
                    ),
            ),
    );
  }

  Widget _chip(String valeur, String label) {
    final actif = _filtre == valeur;
    return GestureDetector(
      onTap: () => setState(() => _filtre = valeur),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
        decoration: BoxDecoration(
          color: actif ? const Color(0xFF1B5E20) : const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(label, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: actif ? Colors.white : Colors.black54)),
      ),
    );
  }

  Widget _carteTx(TransactionAdmin tx) {
    final isRepas = tx.type == 'repas';
    final isRecharge = tx.type == 'rechargement';
    final couleur = isRepas ? const Color(0xFF1565C0) : isRecharge ? const Color(0xFF2E7D32) : const Color(0xFFE65100);
    final icone = isRepas ? Icons.restaurant : isRecharge ? Icons.add_card : Icons.swap_horiz;
    final signe = isRepas ? '-' : '+';
    final heure = '${tx.date.hour.toString().padLeft(2, '0')}:${tx.date.minute.toString().padLeft(2, '0')}';
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6)],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        leading: Container(
          width: 40, height: 40,
          decoration: BoxDecoration(color: couleur.withValues(alpha: 0.1), shape: BoxShape.circle),
          child: Icon(icone, color: couleur, size: 20),
        ),
        title: Text(tx.nomEtudiant, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13)),
        subtitle: Text(tx.matricule, style: const TextStyle(fontSize: 11, color: Colors.black45)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('$signe ${tx.montant} F', style: TextStyle(fontWeight: FontWeight.bold, color: couleur, fontSize: 13)),
            Text(heure, style: const TextStyle(fontSize: 11, color: Colors.black38)),
          ],
        ),
      ),
    );
  }
}
