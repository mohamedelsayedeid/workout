import 'package:flutter/material.dart';
import '../../model.dart';

class ExerciseList extends StatelessWidget {
  final List<Exercise> exercises;
  const ExerciseList({Key? key, required this.exercises}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: exercises.length,
      itemBuilder: (context, index) {
        return ExerciseTile(exercise: exercises[index]);
      },
    );
  }
}

class ExerciseTile extends StatelessWidget {
  final Exercise exercise;
  final String file = "assets/images/workouts/";
  const ExerciseTile({Key? key, required this.exercise}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Text(
            exercise.duration,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          title: Text(
            exercise.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.asset(
              file + exercise.image,
              height: 50,
              width: 60,
              fit: BoxFit.fill,
            ),
          ),
          //function
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => SimpleDialog(
                // elevation: 80.0,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.asset(
                            file + exercise.image,
                            // width: 150,
                            height: 160,
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          exercise.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          exercise.description,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
                backgroundColor: const Color.fromRGBO(21, 37, 49, 1.0),
              ),
            );
          },
        ),
        const Divider(
          height: 10,
          color: Colors.white54,
        ),
      ],
    );
  }
}