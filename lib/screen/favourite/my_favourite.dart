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
          // Agar koi item favourite nahi hai tu empty message dikhao
          if (value.selectedItem.isEmpty) {
            return const Center(
              child: Text(
                'No Favourites Added Yet!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            );
          }

          return ListView.builder(
            itemCount: value.selectedItem.length, // Sirf selected items ki ginti
            itemBuilder: (context, index) {
              // Yeh line sab se zaroori hai!
              // Yeh index se us item ka asal ID/Number nikalti hai
              final actualItemValue = value.selectedItem[index];

              return ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: Text("Item $actualItemValue"),
                subtitle: Text("Favourite Item App $actualItemValue"),
                trailing: const Icon(
                  Icons.favorite,
                  color: Colors.red, // Taki favourite items pyare lagein
                ),
                onTap: () {
                  // Jab click ho tu index nahi, balki asal value remove karein
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