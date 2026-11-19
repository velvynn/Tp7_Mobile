import 'package:flutter/material.dart';

class product {
  final String nama;
  final String deskripsi;
  final String gambar; // Tambahan untuk URL gambar

  product(this.nama, this.deskripsi, this.gambar);
}

class CartModel extends ChangeNotifier {
  final List<product> _items = [];

  List<product> get items => _items;
  int get totalItems => _items.length;

  // Fungsi Tambah Barang
  void add(product product) {
    _items.add(product);
    notifyListeners();
  }

  // Fungsi Hapus Barang
  void remove(product product) {
    _items.remove(product);
    notifyListeners();
  }
}