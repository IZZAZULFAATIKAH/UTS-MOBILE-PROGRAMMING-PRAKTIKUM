import 'package:flutter/material.dart';
import '../models/coffee.dart';

/// Halaman 3: detail informasi satu kopi.
class DetailScreen extends StatefulWidget {
  final Coffee coffee;
  const DetailScreen({super.key, required this.coffee});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _fav = false;

  @override
  Widget build(BuildContext context) {
    final c = widget.coffee;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          // Header berwarna + tombol kembali & favorit
          Stack(children: [
            Container(
              height: 240,
              width: double.infinity,
              color: Color(c.colorValue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.coffee, size: 90, color: Colors.white38),
                  const SizedBox(height: 8),
                  Text(
                    c.category.toUpperCase(),
                    style: const TextStyle(color: Colors.white70, letterSpacing: 3),
                  ),
                ],
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  CircleAvatar(
                    backgroundColor: Colors.black38,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black38,
                    child: IconButton(
                      icon: Icon(_fav ? Icons.favorite : Icons.favorite_border, color: Colors.white),
                      onPressed: () => setState(() => _fav = !_fav),
                    ),
                  ),
                ]),
              ),
            ),
          ]),
          // Konten
          Transform.translate(
            offset: const Offset(0, -24),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFFFFF3E0),
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(c.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text(c.origin, style: TextStyle(color: Colors.grey.shade700)),
                const SizedBox(height: 12),
                Wrap(spacing: 8, children: c.flavor.map((f) => Chip(label: Text(f))).toList()),
                const SizedBox(height: 8),
                Card(
                  color: Colors.white,
                  surfaceTintColor: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(children: [
                      _row('Kategori', c.category),
                      _row('Sangrai', c.roast),
                      _row('Ketinggian', c.altitude),
                      _row('Rating', '⭐ ${c.rating}'),
                      _row('Harga/250g', 'Rp ${c.price}'),
                    ]),
                  ),
                ),
                const SizedBox(height: 12),
                const Text('Tentang', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(c.description, style: const TextStyle(height: 1.5)),
                const SizedBox(height: 16),
                const Text('Tips Seduh', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(c.tips, style: const TextStyle(height: 1.5)),
              ]),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _row(String k, String v) => Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(children: [
      SizedBox(width: 110, child: Text(k, style: const TextStyle(fontWeight: FontWeight.w600))),
      const Text(': '),
      Expanded(child: Text(v)),
    ]),
  );
}