import 'package:flutter/material.dart';

import '../admin/admin_notes_screen.dart';
import '../admin/admin_screen.dart';
import '../azkar/azkar_screen.dart';
import '../guide/guide_screen.dart';
import '../lawyer/lawyer_profile_screen.dart';
import '../obligations/obligations_screen.dart';
import '../prayer/prayer_screen.dart';
import '../quran/quran_screen.dart';

/// تبويب "المزيد": الأعمال الإدارية والالتزامات الشخصية والقسم الإسلامي.
class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = <_Item>[
      _Item('دليل استخدام التطبيق', 'شرح مفصّل لكل قسم، وأفضل طريقة للاستخدام', Icons.help_outline,
          const Color(0xFF00838F), () => const GuideScreen()),
      _Item('ملفي (بيانات المحامي)', 'الاسم ورقم القيد والدرجة — تظهر تلقائيًا في الإنابة والتقارير', Icons.badge,
          const Color(0xFF283593), () => const LawyerProfileScreen()),
      _Item('مفكرة الأعمال الإدارية', 'ورقة حرة: اكتب، أرفق صورة تذكرة أو مستند، ونبّه نفسك', Icons.sticky_note_2_outlined,
          const Color(0xFFF9A825), () => const AdminNotesScreen()),
      _Item('كشوف الأعمال الإدارية', 'قضايا بدون جلسات أو قرارات، إدارية، راكدة، توكيلات', Icons.fact_check_outlined,
          const Color(0xFFD84315), () => const AdminScreen()),
      _Item('الالتزامات الشخصية', 'ديون لي وعليّ، إيجارات، أقساط، فواتير', Icons.account_balance_wallet_outlined,
          const Color(0xFF2E7D32), () => const ObligationsScreen()),
      _Item('مواقيت الصلاة', 'بدون نت، مع تنبيه عند كل صلاة', Icons.access_time_filled,
          const Color(0xFF1565C0), () => const PrayerScreen()),
      _Item('القرآن الكريم', 'المصحف كاملًا، بحث، وعلامة آخر قراءة', Icons.menu_book,
          const Color(0xFF6A1B9A), () => const QuranScreen()),
      _Item('الأذكار', 'الصباح والمساء وبعد الصلاة والنوم', Icons.auto_awesome,
          const Color(0xFF00897B), () => const AzkarScreen()),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('المزيد')),
      body: ListView(padding: const EdgeInsets.all(12), children: [
        for (final it in items)
          Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: it.color.withOpacity(0.15),
                child: Icon(it.icon, color: it.color),
              ),
              title: Text(it.title, style: const TextStyle(fontWeight: FontWeight.w600)),
              subtitle: Text(it.subtitle),
              trailing: const Icon(Icons.chevron_left),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => it.page())),
            ),
          ),
      ]),
    );
  }
}

class _Item {
  final String title, subtitle;
  final IconData icon;
  final Color color;
  final Widget Function() page;
  _Item(this.title, this.subtitle, this.icon, this.color, this.page);
}
