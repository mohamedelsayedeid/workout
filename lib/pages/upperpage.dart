import 'package:flutter/material.dart';

class UpperPage extends StatelessWidget {
  const UpperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //container for displaying the background image
    return Container(
      height: (MediaQuery.of(context).size.height / 2),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/dark.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Workout complete!",
            style: TextStyle(
              color: Colors.greenAccent,
              fontSize: 18,
            ),
          ),
          const Text("MASSIVE UPPER BODY",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Carbo")),
          //create space between the words and row
          const SizedBox(
            height: 50,
          ),
          Row(
            //row for health details
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: const [
                  Icon(Icons.done_rounded, color: Colors.white70),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "24/7",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                children: const [
                  Text(
                    "Kcal",
                    style: TextStyle(color: Colors.white70),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "807",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                children: const [
                  Icon(Icons.access_time_filled_rounded, color: Colors.white70),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "30 days",
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}