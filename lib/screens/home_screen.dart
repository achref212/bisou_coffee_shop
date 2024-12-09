import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0; // Navigation bar selected index
  int selectedFilter = 0; // Filter selection index

  final List<Map<String, dynamic>> products = [
    {
      'name': 'Espresso',
      'price': 2.99,
      'imageUrl': 'https://via.placeholder.com/150/espresso',
      'type': 'Recommendation',
    },
    {
      'name': 'Cappuccino',
      'price': 3.49,
      'imageUrl': 'https://via.placeholder.com/150/cappuccino',
      'type': 'Promo',
    },
    {
      'name': 'Latte',
      'price': 3.99,
      'imageUrl': 'https://via.placeholder.com/150/latte',
      'type': 'Best Sale',
    },
    {
      'name': 'Mocha',
      'price': 4.29,
      'imageUrl': 'https://via.placeholder.com/150/mocha',
      'type': 'All',
    },
    {
      'name': 'Macchiato',
      'price': 3.79,
      'imageUrl': 'https://via.placeholder.com/150/macchiato',
      'type': 'Promo',
    },
    {
      'name': 'Americano',
      'price': 2.89,
      'imageUrl': 'https://via.placeholder.com/150/americano',
      'type': 'Recommendation',
    },
  ];

  final List<Map<String, String>> filters = [
    {'name': 'All', 'value': 'All'},
    {'name': 'Promo', 'value': 'Promo'},
    {'name': 'Recommendations', 'value': 'Recommendation'},
    {'name': 'Best Sale', 'value': 'Best Sale'},
  ];

  List<Map<String, dynamic>> get filteredProducts {
    if (filters[selectedFilter]['value'] == 'All') {
      return products;
    }
    return products
        .where((product) => product['type'] == filters[selectedFilter]['value'])
        .toList();
  }

  final List<Widget> screens = [
    const Center(child: Text('Home Content')),
    const Center(child: Text('Orders Content')),
    const Center(child: Text('Gift Card Content')),
    const Center(child: Text('Profile Content')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: selectedIndex == 0 ? buildHomePage() : screens[selectedIndex],
      bottomNavigationBar: buildNavigationBar(),
    );
  }

  /// Animated Bottom Navigation Bar
  Widget buildNavigationBar() {
    return AnimatedContainer(
      height: 70.0,
      duration: const Duration(milliseconds: 400),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildNavBarItem(Icons.home_outlined, 'Home', 0),
          buildNavBarItem(Icons.shopping_cart_outlined, 'Orders', 1),
          buildNavBarItem(Icons.card_giftcard_outlined, 'Gift Card', 2),
          buildNavBarItem(Icons.person_outline, 'Profile', 3),
        ],
      ),
    );
  }

  Widget buildNavBarItem(IconData icon, String label, int index) {
    bool isActive = selectedIndex == index;
    return GestureDetector(
      onTap: () => setState(() => selectedIndex = index),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isActive ? const Color(0xFFC52127) : Colors.grey),
          const SizedBox(height: 5),
          Text(
            label,
            style: TextStyle(
              color: isActive ? const Color(0xFFC52127) : Colors.grey,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }

  /// Home Page with Filters and Product Display
  Widget buildHomePage() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Good Morning, Jane',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Icon(Icons.notifications_outlined, color: Colors.black87),
                ],
              ),
            ),
            // Filters
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  bool isActive = selectedFilter == index;
                  return GestureDetector(
                    onTap: () => setState(() => selectedFilter = index),
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      decoration: BoxDecoration(
                        color: isActive
                            ? const Color(0xFFC52127)
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        filters[index]['name']!,
                        style: TextStyle(
                          color: isActive ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Horizontal Products
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Best Offers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return buildProductCard(product);
                },
              ),
            ),
            const SizedBox(height: 20),
            // Vertical Products
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'Explore More',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return buildProductCard(product, vertical: true);
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Product Card
  Widget buildProductCard(Map<String, dynamic> product,
      {bool vertical = false}) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment:
            vertical ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              product['imageUrl'],
              width: vertical ? 80 : 100,
              height: vertical ? 80 : 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product['name'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                '\$${product['price']}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
