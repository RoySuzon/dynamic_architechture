import 'package:dynamic_architechture/data/models/producst_model.dart';
import 'package:dynamic_architechture/data/repository/repository_details.dart';
import 'package:dynamic_architechture/domain/common_functions/common_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future getDatat() async {
    final res = await RepositoryData().getProducts();
    res.fold(
      (l) => Get.snackbar("Error", l, backgroundColor: Colors.red, colorText: Colors.white),
      (r) {
        CommonFucunctions.products.value = productsFromJson(r);
        Get.to(const HomeScreen());
      },
    );
    setState(() {});
  }

  @override
  void initState() {
    getDatat();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(CommonFucunctions.user.value?.email ?? ""),
        ),
        body: GridView.builder(
          itemCount: CommonFucunctions.products.length,
          itemBuilder: (context, index) {
            Products product = CommonFucunctions.products[index];
            return InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  product: product,
                ),
              )),
              child: Card(
                child: Column(
                  children: [
                    Hero(
                      tag: product.id!,
                      child: Image.network(
                        product.imageUrl!,
                        filterQuality: FilterQuality.low,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                        Text(""),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text.rich(TextSpan(text: "\$${product.price}")),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined)),
                      ],
                    )
                  ],
                ),
              ),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 250,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
          ),
        ));
  }
}

class DetailsScreen extends StatelessWidget {
  final Products product;
  const DetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name!)),
      body: Column(
        children: [Hero(tag: product.id!, child: Image.network(product.imageUrl!))],
      ),
    );
  }
}
