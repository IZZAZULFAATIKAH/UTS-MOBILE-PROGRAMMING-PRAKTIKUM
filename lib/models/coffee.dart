/// Model data kopi. Struktur field disesuaikan agar mudah dipetakan
/// dari respons JSON API pada tahap pengembangan berikutnya.
class Coffee {
  final int id;
  final String name, origin, category, roast, altitude, description, tips;
  final int price, year, colorValue;
  final double rating;
  final List<String> flavor;

  const Coffee({
    required this.id,
    required this.name,
    required this.origin,
    required this.category,
    required this.roast,
    required this.altitude,
    required this.description,
    required this.tips,
    required this.price,
    required this.year,
    required this.colorValue,
    required this.rating,
    required this.flavor,
  });

  factory Coffee.fromJson(Map<String, dynamic> j) => Coffee(
        id: j['id'],
        name: j['name'],
        origin: j['origin'],
        category: j['category'],
        roast: j['roast'],
        altitude: j['altitude'],
        description: j['description'],
        tips: j['tips'],
        price: j['price'],
        year: j['year'],
        colorValue: j['color'],
        rating: (j['rating'] as num).toDouble(),
        flavor: List<String>.from(j['flavor']),
      );
}
