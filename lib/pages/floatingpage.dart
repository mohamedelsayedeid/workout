import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FloatingPage extends StatefulWidget {
  const FloatingPage({Key? key}) : super(key: key);

  @override
  State<FloatingPage> createState() => _FloatingPageState();
}

class _FloatingPageState extends State<FloatingPage> {

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: (MediaQuery.of(context).size.height / 2) - 50,
      right: 0,
      left: 0,
      child: Center(
        child: SizedBox(
          height: 90,
          width: 350,
          child: Row(
            children: [
              Container(
                width: 175,
                height: 90,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                  color: Color.fromRGBO(101, 122, 138, 1.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Container(
                          height: 45, width: 4, color: Colors.greenAccent),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Passed!",
                              style: TextStyle(color: Colors.greenAccent)),
                          Text(
                            "Week",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: 175,
                height: 90,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  color: Color.fromRGBO(42, 67, 87, 1.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Lets do it",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        DateFormat.MMMEd().format(DateTime.now()),
                        style: const TextStyle(
                          fontSize: 19,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}