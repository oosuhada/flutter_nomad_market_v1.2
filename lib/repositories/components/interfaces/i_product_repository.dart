import '../../../models/components/entities/product.dart';
import '../../../models/components/entities/product_image.dart';

abstract class IProductRepository {
  Future<Product> createProduct(Product product);
  Future<Product?> getProductById(String id);
  Future<List<Product>> getProductsBySeller(String sellerId);
  Future<List<Product>> searchProducts(String category, String status);
  Future<Product> updateProduct(Product product);
  Future<void> deleteProduct(String id);
  Future<ProductImage> addProductImage(String productId, ProductImage image);
  Future<void> deleteProductImage(String imageId);
}
