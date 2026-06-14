import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:favourite_app_with_provider/provider/favourite_provider.dart'; // Apne mutabiq import check kar lein

class MyFavouriteScreen extends StatelessWidget {
  const MyFavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        backgroundColor: Colors.tealAccent[400],
      ),
      body: Consumer<FavouriteProvider>(
        builder: (context, value, child) {
          if (value.selectedItem.isEmpty) {
            return const Center(
              child: Text(
                'No Favourites Added Yet!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: value.selectedItem.length,
            itemBuilder: (context, index) {

              final actualItemValue = value.selectedItem[index];

              return ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: Text("Item $actualItemValue"),
                subtitle: Text("Favourite Item App $actualItemValue"),
                trailing: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                onTap: () {
                  value.removeItem(actualItemValue);
                },
              );
            },
          );
        },
      ),
    );
  }
}