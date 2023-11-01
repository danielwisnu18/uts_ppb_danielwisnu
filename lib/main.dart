import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuPage(),
    );
  }
}

class MenuPage extends StatelessWidget {
  final List<Map<String, dynamic>> menuItems = [
    {
      "name": "sate kambing",
      "price": 5000,
      "image": "satekambing.jpeg",
      "description":
          "sate kambing adalah daging kambing yang dihidangkan dengan cara dibakar."
    },
    {
      "name": "ayam bakar",
      "price": 10.000,
      "image": "ayambakar2.jpeg",
      "description":
          "Ayam panggang adalah daging ayam yang ditusuk dan dibakar"
    },
    {
      "name": "sayur bayam",
      "price": 5000,
      "image": "sayurbayam.jpeg",
      "description":
          "Tsayur bayam adalah makanan tradisional yang menggunakan sayur bayam dengan rasa gurih"
    },

    // Tambahkan item-menu lainnya di sini
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilih Menu Makanan'),
      ),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final menuItem = menuItems[index];
          return ListTile(
            leading: Image.asset(menuItem['image']),
            title: Text(menuItem['name']),
            subtitle: Text('\$${menuItem['price']}'),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MenuDetailPage(menuItem: menuItem),
                  ),
                );
              },
              child: Text('Pesan'),
            ),
          );
        },
      ),
    );
  }
}

class MenuDetailPage extends StatefulWidget {
  final Map<String, dynamic> menuItem;

  MenuDetailPage({required this.menuItem});

  @override
  _MenuDetailPageState createState() => _MenuDetailPageState();
}

class _MenuDetailPageState extends State<MenuDetailPage> {
  int quantity = 1;
  int total = 0;

  @override
  void initState() {
    super.initState();
    total = widget.menuItem['price'];
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
      total = widget.menuItem['price'] * quantity;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
        total = widget.menuItem['price'] * quantity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.menuItem['name']),
      ),
      body: Column(
        children: [
          Image.asset(widget.menuItem['image']),
          Text(widget.menuItem['name']),
          Text('\$${widget.menuItem['price']}'),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: decrementQuantity,
                child: Text('-'),
              ),
              Text(quantity.toString()),
              ElevatedButton(
                onPressed: incrementQuantity,
                child: Text('+'),
              ),
            ],
          ),
          Text('Total: \$${total}'),
          ElevatedButton(
            onPressed: () {
              // Tambahkan logika untuk pemesanan di sini
            },
            child: Text('Pesan'),
          ),
        ],
      ),
    );
  }
}
