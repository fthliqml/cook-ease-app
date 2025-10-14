class RecipesData {
  // Static demo data; in a real app this would be fetched from a service/database
  static final List<Map<String, dynamic>> recipes = [
    {
      'id': '1',
      'title': 'Nasi Goreng Spesial',
      'photo': 'assets/images/list1.jpg',
      'cookTime': '20 min',
      'rating': 4.5,
      'description': 'Nasi goreng spesial dengan bumbu rumahan yang kaya rasa.',
    },
    {
      'id': '2',
      'title': 'Ayam Bakar Madu',
      'photo': 'assets/images/list2.jpg',
      'cookTime': '45 min',
      'rating': 4.8,
      'description': 'Ayam bakar dengan glaze madu, manis-gurih dan juicy.',
    },
    {
      'id': '3',
      'title': 'Soto Ayam',
      'photo': 'assets/images/list3.jpg',
      'cookTime': '60 min',
      'rating': 4.3,
      'description': 'Kuah hangat dengan rempah pilihan dan suwiran ayam.',
    },
    {
      'id': '4',
      'title': 'Gado-Gado',
      'photo': 'assets/images/list4.jpg',
      'cookTime': '15 min',
      'rating': 4.2,
      'description': 'Sayuran segar dengan bumbu kacang creamy.',
    },
    {
      'id': '5',
      'title': 'Rendang Daging',
      'photo': 'assets/images/list5.jpg',
      'cookTime': '120 min',
      'rating': 4.9,
      'description': 'Rendang empuk dengan santan dan rempah yang kaya.',
    },
  ];

  static Map<String, dynamic>? getById(String id) {
    try {
      return recipes.firstWhere((r) => r['id']?.toString() == id);
    } catch (_) {
      return null;
    }
  }
}
