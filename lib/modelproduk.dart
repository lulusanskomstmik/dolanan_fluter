class Produk {
  final int  id;
  final String kode;
  final String nama;
  final String namaBarang;
  final String kondisi;

  Produk(
    {this.id, this.kode, this.nama, this.namaBarang, this.kondisi}
  );

  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id: json['id'],
      kode: json['kode_qr'],
      nama: json['nama'],
      namaBarang: json['nama_barang'],
      kondisi: json['kondisi'],

    );
  }
}