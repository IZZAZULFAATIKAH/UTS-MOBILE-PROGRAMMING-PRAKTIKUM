import 'package:flutter/material.dart';
import '../models/coffee.dart';
import '../screens/detail_screen.dart';

/// Kartu kopi horizontal yang dipakai di Beranda dan Jelajah.
class CoffeeCard extends StatelessWidget {
  final Coffee coffee;
  const CoffeeCard({super.key, required this.coffee});

  @override
  Widget build(BuildContext context) {
    final c = Color(coffee.colorValue);
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => DetailScreen(coffee: coffee)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(children: [
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(color: c, borderRadius: BorderRadius.circular(14)),
              child: const Icon(Icons.coffee, color: Colors.white, size: 32),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(coffee.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 2),
                Text('${coffee.category} • ${coffee.origin}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 12)),
                const SizedBox(height: 4),
                Row(children: [
                  const Icon(Icons.star, size: 16, color: Colors.amber),
                  Text(' ${coffee.rating}'),
                ]),
              ]),
            ),
            const Icon(Icons.chevron_right),
          ]),
        ),
      ),
    );
  }
}