import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
<<<<<<< HEAD
import '../models/product_model.dart';
import '../widgets/custom_app_bar_widget.dart';
import '../services/cart_service.dart';
=======
import 'package:usedev_uninassau/src/models/product_model.dart';
>>>>>>> 7aa0efc8ec4ab86d3bb63d1d51bb5530b3842920

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({
    required this.product,
    super.key,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: const CustomAppBarWidget(title: 'Detalhe do produto'),
=======
      appBar: AppBar(
        leading: const Icon(Icons.menu, size: 40),
        title: const Text('Detalhe do produto'),
        centerTitle: true,
        actions: const [
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
            Image.network(
              product.imageUrl,
              height: 280,
              width: double.infinity,
              fit: BoxFit.cover,
<<<<<<< HEAD
              errorBuilder: (context, error, stackTrace) => const SizedBox(
                height: 280,
                child: Icon(Icons.broken_image, size: 50),
              ),
=======
>>>>>>> 7aa0efc8ec4ab86d3bb63d1d51bb5530b3842920
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.orbitron().fontFamily,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
<<<<<<< HEAD
                    product.formattedPrice,
=======
                    product.price,
>>>>>>> 7aa0efc8ec4ab86d3bb63d1d51bb5530b3842920
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    product.description,
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
<<<<<<< HEAD
                      onPressed: () {
                        // Tópico 12: Lógica de Carrinho
                        CartService().addToCart(product);

                        // Tópico 13: Feedback ao Usuário (SnackBar)
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.name} adicionado ao carrinho!'),
                            duration: const Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
=======
                      onPressed: () {},
>>>>>>> 7aa0efc8ec4ab86d3bb63d1d51bb5530b3842920
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Adicionar ao carrinho',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: GoogleFonts.poppins().fontFamily,
<<<<<<< HEAD
                          color: Colors.white,
=======
>>>>>>> 7aa0efc8ec4ab86d3bb63d1d51bb5530b3842920
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
