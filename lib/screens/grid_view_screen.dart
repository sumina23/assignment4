import 'package:flutter/material.dart';

class GridViewScreen extends StatelessWidget {
  const GridViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid View'),
      ),

      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(10),

        children: List.generate(6, (index) {

          return Card(
            color: Colors.teal.shade100,

            child: Center(
              child: Text(
                'Item ${index + 1}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}