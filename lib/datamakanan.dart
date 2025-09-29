import 'package:latihankuis/modelmakanan.dart';

List<FoodStore> foodList = [
  FoodStore(
    name: 'Nasi Goreng Spesial',
    tags: ['Indonesia', 'Rice', 'Spicy', 'Comfort Food'],
    price: 'Rp 25.000',
    about:
        'Nasi goreng khas Indonesia dengan telur, ayam suwir, dan bumbu rempah yang gurih pedas. Cocok dimakan kapan saja.',
    imageUrls: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Chaufa_salvaje_Selva_17042010.JPG/500px-Chaufa_salvaje_Selva_17042010.JPG',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e5/Korean_cuisine-Kimchi_bokkeumbap.jpg/500px-Korean_cuisine-Kimchi_bokkeumbap.jpg',
      'https://img.inews.co.id/media/600/files/inews_new/2022/02/04/nasi_goreng_spesial.jpg',
    ],
    reviewAverage: '95%',
    reviewCount: '5432',
    linkStore: 'https://gofood.co.id/nasi-goreng-spesial',
  ),
  FoodStore(
    name: 'Ramen Tonkotsu',
    tags: ['Japanese', 'Noodles', 'Soup', 'Comfort Food'],
    price: 'Rp 65.000',
    about:
        'Ramen Jepang dengan kuah tonkotsu creamy, topping chashu pork, telur setengah matang, dan rumput laut.',
    imageUrls: [
      'https://static.vecteezy.com/system/resources/thumbnails/058/051/717/small_2x/bowl-of-ramen-delicious-japanese-noodle-soup-food-presentation-cut-out-transparent-png.png',
      'https://i.pinimg.com/originals/4e/ae/f6/4eaef693f20f425e6d248f5d36c6b453.jpg',
      'https://www.thespruceeats.com/thmb/p1rM7r8vh0mI9ApfZYeKk6N8h14=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/tonkotsu-ramen-2031321-hero-01-63ec98c174c646b98cb7a61f23a25c55.jpg',
    ],
    reviewAverage: '92%',
    reviewCount: '3211',
    linkStore: 'https://gofood.co.id/ramen-tonkotsu',
  ),
  FoodStore(
    name: 'Burger Beef Classic',
    tags: ['Western', 'Fast Food', 'Beef', 'Cheese'],
    price: 'Rp 45.000',
    about:
        'Burger klasik dengan daging sapi panggang juicy, keju cheddar, selada, tomat, dan saus spesial.',
    imageUrls: [
      'https://cdn.pixabay.com/photo/2014/10/23/18/05/burger-500054_1280.jpg',
      'https://www.thespruceeats.com/thmb/sD21xQn3-F7pG99d5Q7m1c7G7Sg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/classic-cheeseburger-recipe-996003-hero-01-2020e7f678364e9691885c3e46e673a9.jpg',
      'https://img.freepik.com/free-photo/delicious-burger-isolated-white-background_1232-2028.jpg',
    ],
    reviewAverage: '89%',
    reviewCount: '2789',
    linkStore: 'https://gofood.co.id/burger-beef-classic',
  ),
  FoodStore(
    name: 'Pizza Pepperoni',
    tags: ['Italian', 'Cheese', 'Fast Food', 'Sharing'],
    price: 'Rp 120.000',
    about:
        'Pizza tipis dengan saus tomat, keju mozzarella leleh, dan topping pepperoni gurih.',
    imageUrls: [
      'https://upload.wikimedia.org/wikipedia/commons/d/d1/Pepperoni_pizza.jpg',
      'https://media.istockphoto.com/id/184946701/photo/pepperoni-pizza.jpg',
      'https://img.freepik.com/premium-photo/pepperoni-pizza-with-mozzarella-cheese.jpg',
    ],
    reviewAverage: '93%',
    reviewCount: '6544',
    linkStore: 'https://gofood.co.id/pizza-pepperoni',
  ),
  FoodStore(
    name: 'Sate Ayam Madura',
    tags: ['Indonesia', 'Grilled', 'Street Food', 'Peanut Sauce'],
    price: 'Rp 30.000',
    about:
        'Sate ayam khas Madura dengan bumbu kacang manis gurih, lontong, dan bawang goreng.',
    imageUrls: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/a/ad/Sate_Ponorogo.jpg/330px-Sate_Ponorogo.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8b/Sate_ayam-1.JPG/500px-Sate_ayam-1.jpg',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Sate_ayam_madura.jpg/960px-Sate_ayam_madura.jpg',
    ],
    reviewAverage: '97%',
    reviewCount: '7121',
    linkStore: 'https://gofood.co.id/sate-ayam-madura',
  ),
  // FoodStore(
  //   name: 'Pad Thai',
  //   tags: ['Thai', 'Noodles', 'Seafood', 'Street Food'],
  //   price: 'Rp 55.000',
  //   about:
  //       'Mie goreng khas Thailand dengan udang, tahu, tauge, kacang tanah, dan saus asam manis gurih.',
  //   imageUrls: [
  //     'https://upload.wikimedia.org/wikipedia/commons/thumb/3/39/Phat_Thai_kung_Chang_Khien_street_stall.jpg/330px-Phat_Thai_kung_Chang_Khien_street_stall.jpg',
  //     'https://image.mfa.go.th/mfa/0/dXEmannXBZ/Pad_Thai__Love__to_the_Noodles_of_Thailand/03.png',
  //     'https://meanderingtales.com/wp-content/uploads/2019/03/FeaturedImage.jpg',
  //   ],
  //   reviewAverage: '90%',
  //   reviewCount: '3540',
  //   linkStore: 'https://gofood.co.id/pad-thai',
  // ),
  FoodStore(
    name: 'Croissant Cokelat',
    tags: ['French', 'Bakery', 'Sweet', 'Breakfast'],
    price: 'Rp 28.000',
    about:
        'Croissant renyah dengan isian cokelat leleh di dalamnya. Cocok untuk sarapan atau camilan sore.',
    imageUrls: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Croissant-Petr_Kratochvil.jpg/500px-Croissant-Petr_Kratochvil.jpg',
      'https://img.freepik.com/free-photo/chocolate-croissant.jpg',
      'https://media.istockphoto.com/id/1278925383/photo/fresh-baked-croissant.jpg',
    ],
    reviewAverage: '88%',
    reviewCount: '1988',
    linkStore: 'https://gofood.co.id/croissant-cokelat',
  ),
  // FoodStore(
  //   name: 'Es Teh Manis',
  //   tags: ['Drink', 'Sweet', 'Refreshing', 'Cold'],
  //   price: 'Rp 8.000',
  //   about:
  //       'Minuman klasik Indonesia berupa teh melati manis dengan es batu. Segar diminum siang hari.',
  //   imageUrls: [
  //     'https://i.pinimg.com/474x/ef/2c/1b/ef2c1b0ccdfa7ad0b24609102ec9b0fe.jpg',
  //     'https://img.freepik.com/premium-photo/iced-tea-glass.jpg',
  //     'https://meanderingtales.com/wp-content/uploads/2019/03/FeaturedImage.jpg',
  //   ],
  //   reviewAverage: '96%',
  //   reviewCount: '8431',
  //   linkStore: 'https://gofood.co.id/es-teh-manis',
  // ),
];
