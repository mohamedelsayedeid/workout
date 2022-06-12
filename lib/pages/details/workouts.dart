import 'package:flutter/material.dart';
import 'package:workout/daymodel.dart';
import 'package:workout/model.dart';
import 'package:workout/pages/details/contentpage.dart';
import 'package:workout/pages/details/floatingpage.dart';

class WorkoutPage extends StatelessWidget {
  final WeekDay day;
  final String file = "assets/images/";
  final List<Exercise> exercises;
  const WorkoutPage({Key? key, required this.day, required this.exercises})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: (MediaQuery.of(context).size.height / 3),
            flexibleSpace: PreferredSize(
              preferredSize: const Size.fromHeight(300),
              child: Image.asset(
                file + day.image,
                height: (MediaQuery.of(context).size.height / 3),
                fit: BoxFit.cover,
              ),
            ),
            backgroundColor: Colors.black87,
            bottom: PreferredSize(
              child: const FloatingPage(),
              preferredSize: Size.fromHeight(
                  (MediaQuery.of(context).size.height / 3) - 40),
            ),
          ),
          SliverFillRemaining(
            child: ContentPage(
              day: day,
              exercises: exercises,
            ),
          ),
        ],
      ),
    );
  }
}