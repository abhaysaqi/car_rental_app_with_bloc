import 'package:car_rental_app/data/models/car.dart';
import 'package:flutter/material.dart';

class MoreCard extends StatelessWidget {
  final Car car;
  const MoreCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.black87, borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                car.model,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.car_crash_rounded,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('${car.distance.toStringAsFixed(1)} km',
                      style: const TextStyle(
                        color: Colors.white,
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.battery_full,
                    color: Colors.white,
                    size: 20,
                  ),
                  Text('> ${car.fuelCapacity} km',
                      style: const TextStyle(
                        color: Colors.white,
                      ))
                ],
              )
            ],
          ),
          const Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Colors.white,
            size: 30,
          )
        ],
      ),
    );
  }
}
