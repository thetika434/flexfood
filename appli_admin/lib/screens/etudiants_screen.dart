import 'package:flutter/material.dart';
import '../services/service_admin.dart';

class EtudiantsScreen extends StatefulWidget {
  const EtudiantsScreen({super.key});
  @override
  State<EtudiantsScreen> createState() => _EtudiantsScreenState();
}

class _EtudiantsScreenState extends State<EtudiantsScreen> {
  List<EtudiantAdmin> _tous = [];
  String _recherche = '';
  bool _chargement = true;

  @override
  void initState() {
    super.initState();
    _charger();
  }

  Future<void> _charger() async {
    setState(() => _chargement = true);
    final liste = await ServiceAdmin.obtenirEtudiants();
    if (mounted) setState(() { _tous = liste; _chargement = false; });
  }

  List<EtudiantAdmin> get _filtres => _tous.where((e) =>
      e.nomComplet.toLowerCase().contains(_recherche.toLowerCase()) ||
      e.matricule.toLowerCase().contains(_recherche.toLowerCase())).toList();

  @override
  Widget build(BuildContext context) {
    final liste = _filtres;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF212121),
        elevation: 0,
        title: const Text('Étudiants', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [IconButton(icon: const Icon(Icons.refresh), onPressed: _charger)],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: TextField(
              onChanged: (v) => setState(() => _recherche = v),
              decoration: InputDecoration(
                hintText: 'Rechercher nom, matricule…',
                prefixIcon: const Icon(Icons.search, color: Colors.black45),
                filled: true,
                fillColor: const Color(0xFFF0F0F0),
                contentPadding: const EdgeInsets.symmetric(vertical: 10),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
              ),
            ),
          ),
        ),
      ),
      body: _chargement
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: _charger,
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: liste.length,
                itemBuilder: (_, i) => _carteEtudiant(liste[i]),
              ),
            ),
    );
  }

  Widget _carteEtudiant(EtudiantAdmin e) {
    final couleur = e.solde < 1000
        ? const Color(0xFFD32F2F)
        : e.solde < 3000 ? const Color(0xFFE65100) : const Color(0xFF2E7D32);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.05), blurRadius: 6)],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          radius: 22,
          backgroundColor: const Color(0xFF1B5E20).withValues(alpha: 0.12),
          child: Text(e.initiales, style: const TextStyle(color: Color(0xFF1B5E20), fontWeight: FontWeight.bold, fontSize: 15)),
        ),
        title: Text(e.nomComplet, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
        subtitle: Text(e.matricule, style: const TextStyle(fontSize: 11, color: Colors.black45)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${e.solde}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: couleur)),
            const Text('FCFA', style: TextStyle(fontSize: 10, color: Colors.black38)),
          ],
        ),
      ),
    );
  }
}
