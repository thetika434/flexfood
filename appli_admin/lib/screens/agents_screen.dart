import 'package:flutter/material.dart';
import '../services/service_admin.dart';

class AgentsScreen extends StatefulWidget {
  const AgentsScreen({super.key});
  @override
  State<AgentsScreen> createState() => _AgentsScreenState();
}

class _AgentsScreenState extends State<AgentsScreen> {
  List<AgentAdmin> _agents = [];
  List<TransactionAdmin> _transactions = [];
  bool _chargement = true;

  @override
  void initState() {
    super.initState();
    _charger();
  }

  Future<void> _charger() async {
    setState(() => _chargement = true);
    final agents = await ServiceAdmin.obtenirAgents();
    final transactions = await ServiceAdmin.obtenirTransactions();
    if (mounted) setState(() { _agents = agents; _transactions = transactions; _chargement = false; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF212121),
        elevation: 0,
        title: const Text('Agents', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [IconButton(icon: const Icon(Icons.refresh), onPressed: _charger)],
      ),
      body: _chargement
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _charger,
              child: _agents.isEmpty
                  ? const Center(child: Text('Aucun agent', style: TextStyle(color: Colors.black45)))
                  : ListView(
                      padding: const EdgeInsets.all(16),
                      children: _agents.map((a) => _carteAgent(a)).toList(),
                    ),
            ),
    );
  }

  Widget _carteAgent(AgentAdmin agent) {
    final repas = _transactions.where((t) => t.type == 'repas').length;
    final rechargeTotal = _transactions.where((t) => t.type == 'rechargement').fold(0, (s, t) => s + t.montant);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.06), blurRadius: 8, offset: const Offset(0, 2))],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: const Color(0xFF1B5E20).withValues(alpha: 0.12),
                  child: Text(agent.initiales, style: const TextStyle(color: Color(0xFF1B5E20), fontWeight: FontWeight.bold, fontSize: 16)),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(agent.nomComplet, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      Text(agent.poste, style: const TextStyle(color: Colors.black45, fontSize: 12)),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(color: const Color(0xFFE8F5E9), borderRadius: BorderRadius.circular(20)),
                  child: const Text('Actif', style: TextStyle(color: Color(0xFF2E7D32), fontSize: 12, fontWeight: FontWeight.w600)),
                ),
              ],
            ),
          ),
          const Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(child: _stat('Repas', '$repas', Icons.restaurant, const Color(0xFF1565C0))),
                const SizedBox(width: 12),
                Expanded(child: _stat('Rechargé', '$rechargeTotal F', Icons.add_card, const Color(0xFF2E7D32))),
                const SizedBox(width: 12),
                Expanded(child: _stat('Total', '${_transactions.length}', Icons.receipt_long, const Color(0xFF6A1B9A))),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(String label, String valeur, IconData icone, Color couleur) {
    return Column(
      children: [
        Icon(icone, color: couleur, size: 22),
        const SizedBox(height: 4),
        Text(valeur, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: couleur)),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.black45), textAlign: TextAlign.center),
      ],
    );
  }
}
