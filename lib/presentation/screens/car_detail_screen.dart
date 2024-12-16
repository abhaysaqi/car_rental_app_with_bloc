import 'package:car_rental_app/data/models/car.dart';
import 'package:car_rental_app/presentation/screens/maps_detail_screen.dart';
import 'package:car_rental_app/presentation/widgets/car_card.dart';
import 'package:car_rental_app/presentation/widgets/more_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CarDetailScreen extends StatefulWidget {
  final Car car;
  const CarDetailScreen({super.key, required this.car});

  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    _controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    _animation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller!)
      ..addListener(() {
        setState(() {
          _controller!.forward();
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller!.forward();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Icon(Icons.info_outlined), Text("Information")],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              children: [
                CarCard(
                    car: Car(
                        model: "Fortuner GR",
                        distance: 870,
                        fuelCapacity: 12,
                        pricePerHour: 14)),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.2,
                        padding: const EdgeInsets.all(11),
                        // height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                  blurRadius: 2,
                                  spreadRadius: 2,
                                  color: Colors.grey)
                            ]),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              child: Image.asset(
                                "assets/images/user.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "Abhay",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              "\$12",
                              style:
                                  TextStyle(fontSize: 12, color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      MapsDetailScreen(car: widget.car)));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage(
                                  "assets/images/maps.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    blurRadius: 2,
                                    spreadRadius: 2,
                                    color: Colors.grey)
                              ]),
                          height: MediaQuery.of(context).size.height * 0.2,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                MoreCard(
                    car: Car(
                        model: "Range Rover",
                        distance: 3500,
                        fuelCapacity: 50,
                        pricePerHour: 15)),
                const SizedBox(
                  height: 5,
                ),
                MoreCard(
                    car: Car(
                        model: "Tata Punch",
                        distance: 3200,
                        fuelCapacity: 50,
                        pricePerHour: 10)),
                const SizedBox(
                  height: 5,
                ),
                MoreCard(
                    car: Car(
                        model: "Tata Nexon",
                        distance: 2200,
                        fuelCapacity: 50,
                        pricePerHour: 9)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
