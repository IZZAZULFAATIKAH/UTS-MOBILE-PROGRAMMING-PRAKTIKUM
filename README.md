# KopiNusa ☕
Ensiklopedia kopi Nusantara — UTS Mobile Programming (Ganjil 2025/2026).

## Tema & Tujuan
Mengenalkan ragam kopi Indonesia (asal, cita rasa, tips seduh) dengan antarmuka bersih bertema cokelat-krem.

## Halaman
| Halaman | Fungsi |
|---|---|
| Beranda (`home_screen.dart`) | Sapaan, kategori, kopi populer, kopi terbaru |
| Jelajah (`explore_screen.dart`) | Daftar kopi + pencarian + filter kategori |
| Detail (`detail_screen.dart`) | Info lengkap, cita rasa, tips seduh, tombol favorit |

Navigasi: `NavigationBar` (Beranda ↔ Jelajah) dan `Navigator.push` (ke Detail / Jelajah per kategori).

## Struktur
```
lib/
 ├ main.dart
 ├ models/coffee.dart            # model + fromJson
 ├ data/coffee_repository.dart   # sumber data (JSON lokal -> API nanti)
 ├ screens/                      # halaman
 └ widgets/coffee_card.dart      # komponen reusable
assets/data/coffees.json         # data dummy
```

## Menjalankan
1. Pastikan Flutter SDK terpasang (`flutter doctor`).
2. Jika folder android/ios belum ada: `flutter create .` di root proyek.
3. `flutter pub get`
4. `flutter run`

## Rencana pengembangan
Integrasi API di `CoffeeRepository`, penyimpanan favorit lokal, mode gelap, dan gambar asli.
