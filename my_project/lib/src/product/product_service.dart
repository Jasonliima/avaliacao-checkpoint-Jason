import '../models/product_model.dart';
import '../models/rating_model.dart';

class ProductService {
  ProductService._();

  static List<ProductModel> getProductsByCategory(ProductCategory category) {
    return _products.where((product) => product.category == category).toList();
  }

  static List<ProductModel> get featuredProducts =>
      getProductsByCategory(ProductCategory.destaque);

  static List<ProductModel> get newProducts =>
      getProductsByCategory(ProductCategory.novidade);

  static List<ProductModel> get bestSellers =>
      getProductsByCategory(ProductCategory.maisVendido);

  static List<ProductModel> get promotions =>
      getProductsByCategory(ProductCategory.promocao);

  static final List<ProductModel> _products = [
    ProductModel(
      id: 'prod-01',
      name: 'Fone de Ouvido AirBass',
      category: ProductCategory.promocao,
      imageUrl: 'https://placehold.co/600x600.png?text=AirBass',
      price: 'R\$ 199,90',
      description: 'Fones com isolamento de ruído e bateria de longa duração.',
      ratings: [
        RatingModel(
          user: 'João',
          stars: 4.5,
          comment: 'Confortável e som cristalino.',
        ),
        RatingModel(
          user: 'Maria',
          stars: 4.0,
          comment: 'Vale a pena pelo preço.',
        ),
      ],
    ),
    ProductModel(
      id: 'prod-02',
      name: 'Smartwatch PulseFit',
      category: ProductCategory.novidade,
      imageUrl: 'https://placehold.co/600x600.png?text=PulseFit',
      price: 'R\$ 349,90',
      description: 'Monitor de atividades com GPS e monitorização de sono.',
      ratings: [
        RatingModel(
          user: 'Carlos',
          stars: 4.8,
          comment: 'Muito funcional e elegante.',
        ),
      ],
    ),
    ProductModel(
      id: 'prod-03',
      name: 'Notebook SlimPro',
      category: ProductCategory.maisVendido,
      imageUrl: 'https://placehold.co/600x600.png?text=SlimPro',
      price: 'R\$ 3.999,00',
      description: 'Ultraleve com processador rápido e excelente bateria.',
      ratings: [
        RatingModel(
          user: 'Fernanda',
          stars: 5.0,
          comment: 'Design incrível e ótimo desempenho.',
        ),
        RatingModel(
          user: 'Luiz',
          stars: 4.7,
          comment: 'Recomendo para trabalhar e estudar.',
        ),
      ],
    ),
    ProductModel(
      id: 'prod-04',
      name: 'Câmera Action Go',
      category: ProductCategory.destaque,
      imageUrl: 'https://placehold.co/600x600.png?text=Action+Go',
      price: 'R\$ 899,00',
      description: 'Gravação em 4K à prova d\'água para aventuras ao ar livre.',
      ratings: [
        RatingModel(
          user: 'Renata',
          stars: 4.3,
          comment: 'Ótima qualidade de imagem em movimento.',
        ),
      ],
    ),
    ProductModel(
      id: 'prod-05',
      name: 'Cafeteira OneTouch',
      category: ProductCategory.promocao,
      imageUrl: 'https://placehold.co/600x600.png?text=OneTouch',
      price: 'R\$ 259,00',
      description: 'Cafeteira compacta com controle por toque e timer.',
      ratings: [
        RatingModel(
          user: 'Pedro',
          stars: 4.1,
          comment: 'Prática e rápida para o dia a dia.',
        ),
      ],
    ),
  ];
}
