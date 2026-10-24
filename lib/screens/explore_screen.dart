import 'package:flutter/material.dart';
import '../models/coffee.dart';
import '../widgets/coffee_card.dart';

/// Halaman 2: daftar kopi dengan pencarian dan filter kategori.
class ExploreScreen extends StatefulWidget {
  final List<Coffee> coffees;
  final String? initialCategory;
  const ExploreScreen({super.key, required this.coffees, this.initialCategory});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late String _category = widget.initialCategory ?? 'Semua';
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final cats = ['Semua', ...{...widget.coffees.map((c) => c.category)}];
    final shown = widget.coffees.where((c) {
      final okCat = _category == 'Semua' || c.category == _category;
      final okQ = c.name.toLowerCase().contains(_query.toLowerCase());
      return okCat && okQ;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Jelajah Kopi')),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
          child: TextField(
            onChanged: (v) => setState(() => _query = v),
            decoration: InputDecoration(
              hintText: 'Cari nama kopi...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide.none),
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: cats.map((c) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              child: ChoiceChip(
                label: Text(c),
                selected: _category == c,
                onSelected: (_) => setState(() => _category = c),
              ),
            )).toList(),
          ),
        ),
        Expanded(
          child: shown.isEmpty
              ? const Center(child: Text('Kopi tidak ditemukan'))
              : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: shown.length,
                  itemBuilder: (_, i) => CoffeeCard(coffee: shown[i]),
                ),
        ),
      ]),
    );
  }
}
