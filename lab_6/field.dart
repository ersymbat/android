
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductScreen(),
    );
  }
}

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  // Таңдалған аяқ киім өлшемі
  int selectedSize = 42;

  // Таңдаулыға қосылғанын тексеру
  bool isFavorite = false;

  // Себеттегі тауарлар саны
  int cartCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // Жоғарғы панель
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'СПОРТМАСТЕР',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              // Себеттегі тауар санын көрсету
              child: Badge(
                isLabelVisible: cartCount > 0,
                label: Text('$cartCount'),
                child: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),

      // Негізгі экранды төмен қарай айналдыруға болады
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Сурет пен таңдаулы батырмасын қабаттастыру
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  color: const Color(0xFFF5F5F5),
                  child: Image.network(
                    'https://cdnkz.sportmaster.com/upload/mdm/media_content/resize/e44/768_1024_aedf/163683490299.jpg',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.shopping_bag_outlined,
                        size: 100,
                      );
                    },
                  ),
                ),

                // Жүрек батырмасы суреттің үстінде тұрады
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(
                      isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: isFavorite
                          ? Colors.red
                          : Colors.black,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Тауардың атауы
            const Text(
              'Etonic Opti-1',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Ерлерге арналған жылы аяқ киім',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 16),

            // Бағасы мен түсін бір қатарға орналастыру
            Row(
              children: [
                const Expanded(
                  child: Text(
                    '30 990 ₸',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    children: [
                      CircleAvatar(
                        radius: 7,
                        backgroundColor: Colors.black,
                      ),
                      SizedBox(width: 8),
                      Text('Қара'),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Өлшем таңдау
            const Text(
              'Өлшемді таңдаңыз',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            // Өлшемдер экранға сыймаса, келесі қатарға өтеді
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [39, 40, 41, 42, 43, 44, 45].map((size) {
                return ChoiceChip(
                  label: Text('$size'),
                  selected: selectedSize == size,
                  selectedColor: Colors.black,
                  labelStyle: TextStyle(
                    color: selectedSize == size
                        ? Colors.white
                        : Colors.black,
                  ),
                  onSelected: (selected) {
                    setState(() {
                      selectedSize = size;
                    });
                  },
                );
              }).toList(),
            ),

            const SizedBox(height: 24),

            // Тауар сипаттамасы
            const Text(
              'Сипаттамасы',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Қыс мезгіліне арналған жылы ерлер аяқ киімі. '
              'Табиғи былғарыдан жасалған. '
              'Ішкі астары жылуды сақтауға көмектеседі. '
              'Резеңке табаны жүру кезінде жақсы ілінісуге '
              'арналған.',
              style: TextStyle(
                fontSize: 15,
                height: 1.5,
                color: Colors.black87,
              ),
            ),

            const SizedBox(height: 20),

            // Wrap арқылы тауар белгілерін көрсету
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: const [
                Chip(label: Text('Қысқы аяқ киім')),
                Chip(label: Text('Табиғи былғары')),
                Chip(label: Text('Жылы астар')),
              ],
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),

      // Төменгі панель экранның төменгі жағында қалады
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(
              top: BorderSide(color: Color(0xFFEEEEEE)),
            ),
          ),
          child: Row(
            children: [
              // Бағаға қажетті орын
              const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Бағасы',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '30 990 ₸',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),

              const SizedBox(width: 16),

              // Батырма қалған бос орынды толық алады
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE31E24),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        cartCount++;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Тауар себетке қосылды!'),
                        ),
                      );
                    },
                    child: const FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Себетке салу',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
