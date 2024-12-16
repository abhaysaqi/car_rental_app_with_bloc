import 'package:car_rental_app/data/models/car.dart';
import 'package:car_rental_app/presentation/screens/car_detail_screen.dart';
import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final Car car;
  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CarDetailScreen(
                      car: car,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(blurRadius: 2, spreadRadius: 2, color: Colors.grey)
            ]),
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset(
              "assets/images/car_image.png",
              height: 120,
            ),
            Text(
              car.model,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/gps.png'),
                    Text('${car.distance.toStringAsFixed(0)}km'),
                    Image.asset('assets/images/pump.png'),
                    Text('${car.fuelCapacity}')
                  ],
                ),
                Text(
                  '\$${car.pricePerHour.toStringAsFixed(1)}/hr',
                  style: const TextStyle(fontSize: 16),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
