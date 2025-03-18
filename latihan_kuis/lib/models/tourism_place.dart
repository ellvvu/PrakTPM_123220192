class TourismPlace {
  final String name;
  final String location;
  final String description;
  final String openDays;
  final String openTime;
  final String ticketPrice;
  final List<String> imagePath;
  bool isFavorite;

  TourismPlace({
    required this.name,
    required this.location,
    required this.description,
    required this.openDays,
    required this.openTime,
    required this.ticketPrice,
    required this.imagePath,
    this.isFavorite = false,
  });
}

List<TourismPlace> tourismPlaces = [
  TourismPlace(
    name: 'Farm House Lembang',
    location: 'Lembang',
    description:
        'Berada di jalur utama Bandung-Lembang, Farm House menjadi objek wisata yang tidak pernah sepi pengunjung. Selain karena letaknya strategis, kawasan ini juga menghadirkan nuansa wisata khas Eropa. Semua itu diterapkan dalam bentuk spot swafoto instagramable.',
    openDays: 'Open Everyday',
    openTime: '09:00 - 20:00',
    ticketPrice: 'Rp 25000',
    imagePath: [
      'assets/lembang1.jpeg',
      'assets/lembang2.webp',
      'assets/lembang3.webp',
    ],
  ),
  TourismPlace(
    name: 'Observatorium Bosscha',
    location: 'Lembang',
    description:
        'Observatorium Bosscha adalah observatorium astronomi tertua di Indonesia yang terletak di Lembang, Jawa Barat. Observatorium ini menjadi tempat penelitian dan pengamatan bintang.',
    openDays: 'Open Everyday',
    openTime: '09:00 - 17:00',
    ticketPrice: 'Rp 20000',
    imagePath: [
      'https://example.com/bosscha1.jpg',
      'https://example.com/bosscha2.jpg',
      'https://example.com/bosscha3.jpg',
    ],
  ),
  TourismPlace(
    name: 'Jalan Asia Afrika',
    location: 'Kota Bandung',
    description:
        'Jalan Asia Afrika adalah salah satu jalan bersejarah di Bandung yang terkenal dengan bangunan kolonialnya.',
    openDays: 'Open Everyday',
    openTime: '24 Hours',
    ticketPrice: 'Free',
    imagePath: [
      'https://example.com/asiaafrika1.jpg',
      'https://example.com/asiaafrika2.jpg',
      'https://example.com/asiaafrika3.jpg',
    ],
  ),
  TourismPlace(
    name: 'Stone Garden',
    location: 'Padalarang',
    description:
        'Stone Garden adalah taman batu alami yang terletak di Padalarang, Bandung.',
    openDays: 'Open Everyday',
    openTime: '08:00 - 17:00',
    ticketPrice: 'Rp 15000',
    imagePath: [
      'https://example.com/stonegarden1.jpg',
      'https://example.com/stonegarden2.jpg',
      'https://example.com/stonegarden3.jpg',
    ],
  ),
];
