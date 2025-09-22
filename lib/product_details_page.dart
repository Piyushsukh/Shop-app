import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/cart_provider.dart';

class ProductDetailsPage extends StatefulWidget {
  final Map<String, Object> products;
  const ProductDetailsPage({super.key, required this.products});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  int selectedSize = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Details',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.products['title'] as String,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Image.asset(
              widget.products['imageUrl'] as String,
              height: 250,
            ),
          ),
          Spacer(
            flex: 2,
          ),
          Container(
            height: 250,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: [
                Text(
                  '\$${widget.products['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: (widget.products['size'] as List<int>).length,
                    itemBuilder: (context, index) {
                      final size =
                          (widget.products['size'] as List<int>)[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedSize = size;
                            });
                          },
                          child: Chip(
                            label: Text(
                              size.toString(),
                            ),
                            backgroundColor: selectedSize == size
                                ? Theme.of(context).colorScheme.primary
                                : null,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton.icon(
                    onPressed: () {
                      final cart =
                          Provider.of<CartProvider>(context, listen: false)
                              .cart;
                      bool b = cart.any((pro) =>
                          pro['id'] == widget.products['id'] &&
                          pro['size'] == selectedSize);
                      if (selectedSize != 0 && !b) {
                        Provider.of<CartProvider>(context, listen: false)
                            .addProduct(
                          {
                            'id': widget.products['id']!,
                            'title': widget.products['title']!,
                            'price': widget.products['price']!,
                            'imageUrl': widget.products['imageUrl']!,
                            'company': widget.products['company']!,
                            'size': selectedSize,
                            'Qty': 1
                          },
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text('Product added successfully!'),
                          ),
                        );
                      } else if (b) {
                        int i = cart.indexWhere((item) =>
                            item["id"] == widget.products['id'] &&
                            item["size"] == selectedSize);
                        Provider.of<CartProvider>(context, listen: false)
                            .cart[i]['Qty']++;
                        Provider.of<CartProvider>(context, listen: false)
                            .hihi();
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text('Product added successfully!'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            duration: Duration(milliseconds: 300),
                            content: Text('Please select size of the product'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      overlayColor: Colors.white,
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      fixedSize: Size(350, 50),
                    ),
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.black,
                    ),
                    label: Text(
                      'Add to cart',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
