import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import '../widgets/hero_section_widget.dart';
import '../widgets/product_card_widget.dart';
import '../widgets/subscription_section_widget.dart';
import '../widgets/custom_app_bar_widget.dart';
import '../services/product_service.dart';
import '../models/product_model.dart';
import 'product_detail_screen.dart';
=======
import 'package:usedev_uninassau/src/Widget/hero_section_widget.dart';
import 'package:usedev_uninassau/src/Widget/product_card_widget.dart';
import 'package:usedev_uninassau/src/Widget/subscription_section_widget.dart';
import 'package:usedev_uninassau/src/product/product_service.dart';
import 'package:usedev_uninassau/src/screens/product_detail_screen.dart';
>>>>>>> 7aa0efc8ec4ab86d3bb63d1d51bb5530b3842920

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
<<<<<<< HEAD
  late Future<List<ProductModel>> _productsFuture;

  @override
  void initState() {
    super.initState();
    _productsFuture = ProductService().getPromotions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBarWidget(showLogo: true),
=======
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu, size: 40),
        title: Image.asset('assets/logo_usedev.png', height: 40),
        centerTitle: true,
        actions: [
          Icon(Icons.person_outline, size: 40),
          SizedBox(width: 10),
          Icon(Icons.shopping_cart_outlined, size: 40),
          SizedBox(width: 25),
        ],
      ),
>>>>>>> 7aa0efc8ec4ab86d3bb63d1d51bb5530b3842920
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const HeroSectionWidget(),
            const SizedBox(height: 20),
            Text(
              'Promos Especiais',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                fontFamily: GoogleFonts.orbitron().fontFamily,
              ),
            ),
            const SizedBox(height: 20),
<<<<<<< HEAD
            FutureBuilder<List<ProductModel>>(
              future: _productsFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        '${snapshot.error}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Nenhum produto encontrado.'));
                }

                final products = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(product: product),
                          ),
                        );
                      },
                      child: ProductCardWidget(
                        nome: product.name,
                        url: product.imageUrl,
                        preco: product.formattedPrice, // Corrigido aqui
                      ),
                    );
                  },
                );
              },
            ),
            const SubscriptionSectionWidget(),
=======
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: ProductService.promotions.length,
              itemBuilder: (context, index) {
                final product = ProductService.promotions[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProductDetailScreen(product: product),
                      ),
                    );
                  },
                  child: ProductCardWidget(
                    nome: product.name,
                    url: product.imageUrl,
                    preco: product.price,
                  ),
                );
              },
            ),
            SubscriptionSectionWidget(),
>>>>>>> 7aa0efc8ec4ab86d3bb63d1d51bb5530b3842920
          ],
        ),
      ),
    );
  }
}
