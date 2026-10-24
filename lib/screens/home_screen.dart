import 'package:flutter/material.dart';
import '../models/coffee.dart';
import '../widgets/coffee_card.dart';
import 'detail_screen.dart';
import 'explore_screen.dart';

/// Halaman 1: Beranda (sapaan, kategori, populer, terbaru).
class HomeScreen extends StatelessWidget {
  final List<Coffee> coffees;
  final VoidCallback onSeeAll;
  const HomeScreen({super.key, required this.coffees, required this.onSeeAll});

  static const _cats = {
    'Arabika': Icons.local_cafe,
    'Robusta': Icons.coffee,
    'Liberika': Icons.eco,
    'Excelsa': Icons.grain,
  };

  @override
  Widget build(BuildContext context) {
    final popular = [...coffees]..sort((a, b) => b.rating.compareTo(a.rating));
    final latest = [...coffees]..sort((a, b) => b.year.compareTo(a.year));

    return ListView(padding: EdgeInsets.zero, children: [
      Container(
        padding: const EdgeInsets.fromLTRB(20, 56, 20, 28),
        decoration: const BoxDecoration(
          color: Color(0xFF4E342E),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(28)),
        ),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Selamat Datang ☕', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text('Kopi apa yang ingin kamu kenal hari ini?', style: TextStyle(color: Colors.white70)),
        ]),
      ),
      _title('Kategori'),
      SizedBox(
        height: 90,
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: _cats.entries.map((e) => Padding(
            padding: const EdgeInsets.only(right: 16),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () => Navigator.push(context, MaterialPageRoute(
                builder: (_) => ExploreScreen(coffees: coffees, initialCategory: e.key))),
              child: Column(children: [
                CircleAvatar(radius: 30, backgroundColor: const Color(0xFFD7A86E), child: Icon(e.value, color: Colors.white)),
                const SizedBox(height: 4),
                Text(e.key, style: const TextStyle(fontSize: 12)),
              ]),
            ),
          )).toList(),
        ),
      ),
      _title('Kopi Populer'),
      SizedBox(
        height: 150,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: 4,
          itemBuilder: (_, i) {
            final c = popular[i];
            return GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(coffee: c))),
              child: Container(
                width: 200,
                margin: const EdgeInsets.only(right: 12),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(color: Color(c.colorValue), borderRadius: BorderRadius.circular(20)),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Icon(Icons.coffee, color: Colors.white54, size: 36),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(c.name, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                    Text('⭐ ${c.rating} • ${c.roast}', style: const TextStyle(color: Colors.white70, fontSize: 12)),
                  ]),
                ]),
              ),
            );
          },
        ),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _title('Kopi Terbaru'),
        TextButton(onPressed: onSeeAll, child: const Text('Lihat semua')),
      ]),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: latest.take(3).map((c) => CoffeeCard(coffee: c)).toList()),
      ),
      const SizedBox(height: 16),
    ]);
  }

  Widget _title(String t) => Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Text(t, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      );
}
