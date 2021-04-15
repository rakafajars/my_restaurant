class ModelListRestaurant {
  final String imagePath;
  final String nameRestaurant;
  final String addressRestaurant;
  final double rateRestaurant;
  final String detailRestaurant;

  ModelListRestaurant({
    this.imagePath,
    this.nameRestaurant,
    this.addressRestaurant,
    this.rateRestaurant,
    this.detailRestaurant,
  });
}

List<ModelListRestaurant> listRestaurant = [
  ModelListRestaurant(
    imagePath: 'assets/1.jpg',
    nameRestaurant: 'The Restaurant',
    addressRestaurant: 'Ciumbuleuit Bandung',
    rateRestaurant: 4.6,
    detailRestaurant:
        'Saat bersantap di Bandung, tentunya kamu berharap menikmati udara segar, makanan enak, dan pemandangan yang menakjubkan. Untungnya, The Restaurant di Padma Hotel memiliki semua kebutuhan ini. Pemandangan alam dengan posisi restoran di ketinggian, membuat kamu merasa seperti berada di atas pohon. Makanannya lezat dan akan menjadikannya pengalaman bersantap yang istimewa.',
  ),
  ModelListRestaurant(
    imagePath: 'assets/2.jpg',
    nameRestaurant: 'The 18 Restaurant & Lounge',
    addressRestaurant: 'Gatot Subroto',
    rateRestaurant: 4.4,
    detailRestaurant:
        'Jika kamu ingin menikmati makan malam mewah di Bandung, maka 18th Restaurant and Lounge adalah tempat yang wajib kamu kunjungi. Pemandangan malam kota Bandung dari spot ini sangat indah ditemani dengan hidangannya yang tak kalah cantiknya. Terletak di lantai atas Trans Luxury Hotel, spot ini adalah tempat yang populer untuk acara-acara khusus.',
  ),
  ModelListRestaurant(
    imagePath: 'assets/3.jpg',
    nameRestaurant: 'Welfed - Gedong Putih',
    addressRestaurant: 'Lembang',
    rateRestaurant: 4.8,
    detailRestaurant:
        'Nikmati udara segar sambil bersantap menu bergaya Eropa. Welfed adalah tambahan spot yang santai di industri kuliner Bandung. Dengan tempat duduk terbuka memungkinkan udara untuk melewati dengan mudah dan membawa aroma lezat ke seluruh restoran.',
  ),
  ModelListRestaurant(
    imagePath: 'assets/4.jpg',
    nameRestaurant: 'Belle Vue',
    addressRestaurant: 'Universal Hotel',
    rateRestaurant: 4.3,
    detailRestaurant:
        'Bertempat di GH Universal Hotel Bandung, restoran Belle Vue bisa memberikan pengalaman bersantap mewah dengan nuansa interior anggun dan berkelas. Meja-meja yang tertutup linen dan bunga-bunga indah menawarkan kemewahan. Menu ini sesuai dengan esensi santapan lezat dengan kombinasi masakan Prancis dan Italia.',
  ),
  ModelListRestaurant(
    imagePath: 'assets/5.jpg',
    nameRestaurant: 'Feast Restaurant',
    addressRestaurant: 'Ir. Haji Juanda',
    rateRestaurant: 4.1,
    detailRestaurant:
        'Dengan nama seperti Feast, pengunjung mengharapkan hidangan lezat dan kamu tak akan kecewa. Feast Restaurant adalah salah satu restoran halal yang paling disukai di Bandung dan menyajikan berbagai hidangan lokal dan internasional dengan suasana santai. Dengan tata ruang terbuka, ini adalah tempat yang sempurna untuk pertemuan keluarga yang akrab, dinner romantis untuk dua orang, atau jamuan makan malam perusahaan.',
  ),
  ModelListRestaurant(
    imagePath: 'assets/6.jpg',
    nameRestaurant: 'The Peak',
    addressRestaurant: 'Lembang',
    rateRestaurant: 3.8,
    detailRestaurant:
        'Bersantap indoor atau outdoor sambil menikmati hidangan Italia, Western, dan grill. Seperti namanya, kamu bisa merasakan angin segar dan alam yang menakjubkan di spot ini. Untuk indoor, jendela-jendela besar membiarkan cahaya alami masuk.',
  ),
  ModelListRestaurant(
    imagePath: 'assets/7.jpg',
    nameRestaurant: 'Purnawarman Restaurant',
    addressRestaurant: 'Pasi Kaliki',
    rateRestaurant: 3.9,
    detailRestaurant:
        'Jika kamu berada di hotel Hilton Bandung, Purnawarman Restaurant memiliki kemewahan yang ingin bisa kamu nikmati sembari menyaksikan keanggunan hotel Hilton. Makanannya merupakan campuran masakan Asia dan Eropa yang akan memuaskan nafsu makanmu.',
  ),
  ModelListRestaurant(
    imagePath: 'assets/8.jpg',
    nameRestaurant: 'The Wind Chime by Chef Felix',
    addressRestaurant: 'Pasi Kaliki',
    rateRestaurant: 3.2,
    detailRestaurant:
        'Milik Chef Felix yang terkenal, The Wind Chime menawarkan beberapa makanan fine dining yang paling inspiratif dan kreatif di kota Bandung. Menu yang selalu berubah dipenuhi dengan mahakarya kuliner yang akan membuat kamu kembali lagi.',
  ),
];
