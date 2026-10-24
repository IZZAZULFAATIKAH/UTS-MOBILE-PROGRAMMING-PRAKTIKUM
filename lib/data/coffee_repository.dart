import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import '../models/coffee.dart';

/// Sumber data tunggal aplikasi.
/// TODO (tahap API): ganti isi fetchAll() dengan http.get(...) tanpa
/// mengubah halaman manapun, karena UI hanya bergantung pada List<Coffee>.
class CoffeeRepository {
  Future<List<Coffee>> fetchAll() async {
    final raw = await rootBundle.loadString('assets/data/coffees.json');
    final list = json.decode(raw) as List<dynamic>;
    return list.map((e) => Coffee.fromJson(e)).toList();
  }
}
