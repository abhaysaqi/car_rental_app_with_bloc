import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RandomDataScreen extends StatelessWidget {
  const RandomDataScreen({super.key});

  // Function to generate random data
  Map<String, dynamic> generateRandomData() {
    List<String> models = [
      'Tata Nexon',
      'Hyundai Creta',
      'Kia Seltos',
      'Mahindra Thar',
      'Maruti Suzuki Brezza'
    ];
    return {
      'distance': (Random().nextDouble() * 1000), // Random distance
      'fuelCapacity':
          Random().nextInt(50) + 10, // Random fuel capacity between 10 and 60
      'model': models[Random().nextInt(models.length)], // Random model
      'pricePerHour':
          Random().nextInt(10) + 5 // Random price per hour between 5 and 15
    };
  }

  // Function to write random data to Firestore
  Future<void> addRandomDataToFirestore() async {
    final firestore = FirebaseFirestore.instance;

    for (int i = 0; i < 5; i++) {
      final randomData = generateRandomData();
      await firestore.collection('cars').add(randomData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Random Data'),
      ),
      body: const Center(
        child: Text('Press the button to add random data to Firestore'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await addRandomDataToFirestore();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Random data added successfully!')),
            );
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Error: $e')),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
