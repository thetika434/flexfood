class Formateur {
  Formateur._();

  static String formaterSolde(int montant) {
    final valeur = montant.abs();
    if (valeur >= 1000) {
      final milliers = valeur ~/ 1000;
      final reste = valeur % 1000;
      return '$milliers.${reste.toString().padLeft(3, '0')}';
    }
    return valeur.toString();
  }

  static String formaterMontantTransaction(int montant) {
    final signe = montant >= 0 ? '+' : '-';
    final valeur = montant.abs();
    if (valeur >= 1000) {
      final milliers = valeur ~/ 1000;
      final reste = valeur % 1000;
      if (reste == 0) return '$signe$milliers.000 FCFA';
      return '$signe$milliers.${reste.toString().padLeft(3, '0')} FCFA';
    }
    return '$signe$valeur FCFA';
  }

  static String formaterDate(DateTime date) {
    final maintenant = DateTime.now();
    final hier = maintenant.subtract(const Duration(days: 1));

    final estAujourdhui = date.year == maintenant.year &&
        date.month == maintenant.month &&
        date.day == maintenant.day;

    final estHier = date.year == hier.year &&
        date.month == hier.month &&
        date.day == hier.day;

    final heure =
        '${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';

    if (estAujourdhui) return "Aujourd'hui, $heure";
    if (estHier) return 'Hier, $heure';

    const mois = [
      'jan.', 'fév.', 'mar.', 'avr.', 'mai', 'juin',
      'juil.', 'août', 'sep.', 'oct.', 'nov.', 'déc.'
    ];
    return '${date.day} ${mois[date.month - 1]}, $heure';
  }

  static String formaterDateGroupe(DateTime date) {
    final maintenant = DateTime.now();
    final hier = maintenant.subtract(const Duration(days: 1));

    final estAujourdhui = date.year == maintenant.year &&
        date.month == maintenant.month &&
        date.day == maintenant.day;

    final estHier = date.year == hier.year &&
        date.month == hier.month &&
        date.day == hier.day;

    if (estAujourdhui) return "AUJOURD'HUI";
    if (estHier) return 'HIER';

    const mois = [
      'JANVIER', 'FÉVRIER', 'MARS', 'AVRIL', 'MAI', 'JUIN',
      'JUILLET', 'AOÛT', 'SEPTEMBRE', 'OCTOBRE', 'NOVEMBRE', 'DÉCEMBRE'
    ];
    return '${date.day} ${mois[date.month - 1]}';
  }
}
