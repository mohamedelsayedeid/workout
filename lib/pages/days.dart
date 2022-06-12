import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:workout/model.dart';
import 'package:workout/daymodel.dart';
import 'package:workout/pages/details/workouts.dart';

class Day extends StatefulWidget {
  const Day({Key? key}) : super(key: key);

  @override
  State<Day> createState() => _DayState();
}

class _DayState extends State<Day> {


  @override
  Widget build(BuildContext context) {
    //list for days of the week
    List<WeekDay> week = [
      WeekDay(
        id: "1",
        day: "First day",
        description: "CHEST, BACK and ARMS",
        image: "chest.jpg",
      ),
      WeekDay(
        id: "2",
        day: "Second day",
        description: "BICEPS and TRICEPS",
        image: "arms.jpg",
      ),
      WeekDay(
        id: "3",
        day: "third day",
        description: "LEGS AND ARMS",
        image: "biceps.jpg",
      ),
      WeekDay(
        id: "4",
        day: "the fourth day",
        description: "CHEST,ABS and ARMS",
        image: "abs.jpg",
      ),
      WeekDay(
        id: "5",
        day: "The fifth day",
        description: "LEGS",
        image: "legs.jpg",
      ),
      WeekDay(
        id: "6",
        day: "the sixth day",
        description: "CHEST, BACK and ARMS",
        image: "chest.jpg",
      ),
      WeekDay(
        id: "7",
        day: "the seventh day",
        description: "BICEPS and TRICEPS",
        image: "arms.jpg",
      ),
      WeekDay(id: "8", day: 'day eight', description: "LEGS AND ARMS", image: "biceps.jpg"),
      WeekDay(id: '9', day: "ninth day", description: 'CHEST,ABS and ARMS', image: "abs.jpg"),
      WeekDay(id: '10', day: "day ten", description: "LEGS", image: "legs.jpg"),
    ];
    // List week = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
    //workout list for each day of the week
    List<Exercise> First_day = [
      Exercise(
          title: "Push ups",
          duration: "10...",
          image: "push-ups.gif",
          description:
          "Lay prone on the ground with arms supporting your body. "
              "Keep your body straight while raising and lowering your body with your arms."
              "This exercise works the chest, shoulders, triceps, back and legs"),
      Exercise(
          title: "Bench Dips",
          duration: "10 ...",
          image: "bench-dips.gif",
          description:
          "Put your hands on the edge of a chair with your body facing outward."
              "Extend your body outward and lower your body towards the ground. Slowly come back up,"
              " and repeat the exercise."),
      Exercise(
          title: "Dumb-bell Press",
          duration: "3 X 15",
          image: "dumbbell-press.gif",
          description:
          "Lie on a bench with your body facing up. Holding dumbbells with both hands, "
              "push your hands straight in the air and slowly bring them down. Repeat again."),
      Exercise(
        title: "Dumb-bell Fly",
        duration: "3 X 15",
        image: "dumbbell-fly.gif",
        description:
        "Lie on a bench with your body facing up. Hold dumbbells straight in the air."
            "Slowly stretch your hands to the side and bring them back to the initial position."
            "Repeat exercise",
      ),
      Exercise(
          title: "Dumb-bell kickback",
          duration: "3 X 16",
          image: "tricep-kickback.gif",
          description:
          "Bend your back parallel to the ground. Hold the dumbbell close to your chest."
              "Moving only the elbow, push the dumbbell outward and slowly bring it back to initial position."
              "Repeat exercise."),
      Exercise(
        title: "Bentover row",
        duration: "3 X 16",
        image: "bentover-row.gif",
        description:
        "Bend your back parallet to the ground. Hold the dumbbells close to your chest."
            "Moving only the shoulder, lower the weights with arms straight. Return to the initial position",
      ),
      Exercise(
          title: "Dumb-bell upright row",
          duration: "3 X 15",
          image: "dumbbell-up.gif",
          description:
          "While standing straight with dumbbells in both hands, slowly raise the hands to chest."
              "Only move the arms and slowly lower the hands."),
      Exercise(
        title: "Arnold Dumb-bell press",
        duration: "3 X 15",
        image: "arnold-press.gif",
        description:
        "While standing straight with dumbbells in both hands close and facing the chest."
            "Push the dumbbells up straight in the air with hands facing outward. Slowly return the start position",
      ),
      Exercise(
          title: "Reverse fly",
          duration: "3 X 12",
          image: "reverse-fly.gif",
          description:
          "Bend your back parallel to the ground. Hold dumbbells straight towards the ground."
              "Slowly stretch your hands to the shoulder side and bring them back to the initial position."
              "Repeat exercise"),
      Exercise(
          title: "Renengade row",
          duration: "3 X 10-@",
          image: "renegade-row.gif",
          description:
          "In the push up position with dumbbells in the hands, slowly rise one hand towards the chest"
              "Do not move any other part of the body except the arms. Slowly return the hand to start position"),
      // Exercise(
      //     title: "Grip curls", duration: "3 X 12", image: "grip-curls.gif"),
      Exercise(
          title: "Shoulder-press",
          duration: "3 X 15",
          image: "shoulder-press.gif",
          description:
          "While standing straight with dumbbells in both hands close to the chest."
              "Push the dumbbells up straight in the air with hands facing outward. Slowly return the start position"),
    ];
    List<Exercise> Second_day = [
      Exercise(
          title: "Dumbbell rows",
          duration: "3 X 15",
          image: "dumbbell-row.gif",
          description:
          "Stand straight with dumbbells in both hands facing the ground."
              " Slowly raise the hand towards the chest and take back to initial position"),
      Exercise(
          title: "Skull crushes",
          duration: "3 X 15",
          image: "skull-crusher.gif",
          description: "Lie on bench with body facing up and arms straight up. "
              "slowly bend the elbow so that the hands tend towards your head."),
      Exercise(
          title: "Hammer curls",
          duration: "3 X 15",
          image: "hammer-curls.gif",
          description:
          "Stand straight with dumbbells in both hands facing the ground."
              " Slowly raise the hand towards the chest and take back to initial position"
              "Make sure youre hands are facing each other through out the exercise."),
      // Exercise(
      //     title: "Tricep extension",
      //     duration: "3 X 15",
      //     image: "tricep-extension.gif"), look like skull crushers
      Exercise(
          title: "Bench dips",
          duration: "3 X 16",
          image: "bench-dips.gif",
          description:
          "Put your hands on the edge of a chair with your body facing outward."
              "Extend your body outward and lower your body towards the ground. Slowly come back up,"
              " and repeat the exercise."),
      Exercise(
        title: "Bentover row",
        duration: "3 X 16",
        image: "bentover-row.gif",
        description:
        "Bend your back parallet to the ground. Hold the dumbbells close to your chest."
            "Moving only the shoulder, lower the weights with arms straight. Return to the initial position",
      ),
      Exercise(
          title: "Concentration curls",
          duration: "3 X 15",
          image: "concentration-curls.gif",
          description: "Sit on a chair and place your elbow on your knee. "
              "Slowly raise your hand towards your chest, and straighten it towards the ground"),
      Exercise(
          title: "Push ups",
          duration: "3 X 15",
          image: "push-ups.gif",
          description:
          "Lay prone on the ground with arms supporting your body. "
              "Keep your body straight while raising and lowering your body with your arms."
              "This exercise works the chest, shoulders, triceps, back and legs"),
      Exercise(
          title: "Cross-body Hammer curls",
          duration: "3 X 15",
          image: "crossbody-curls.gif",
          description:
          "Stand straight with dumbbells in both hands facing the ground."
              " Slowly raise the hand towards the opposite side of the chest and take back to initial position"
              "Make sure youre hands are facing each other through out the exercise."),
      Exercise(
          title: "Dumbbell close grip bench press",
          duration: "3 X 12",
          image: "close-press.gif",
          description:
          "Lie on a bench with your body facing up. Holding dumbbells with both hands close to each other, "
              "push your hands straight in the air and slowly bring them down. Repeat again."),
      Exercise(
          title: "Dumbbell upper-cut",
          duration: "3 X 14 @",
          image: "uppercut.gif",
          description:
          "Standing in a punching position with dumbbells in your hands, "
              "push one hand high in the air in an explosive manner and return to initial position"),
      Exercise(
          title: "Dumbbell kickbacks",
          duration: "3 X 14 @",
          image: "tricep-kickback.gif",
          description:
          "Bend your back parallel to the ground. Hold the dumbbell close to your chest."
              "Moving only the elbow, push the dumbbell outward and slowly bring it back to initial position."
              "Repeat exercise."),
    ];
    List<Exercise> third_day = [
      Exercise(
          title: "Reverse lunges",
          duration: "3 X 10 @",
          image: "reverse-lunge.gif",
          description:
          "Stand straight with arms facing down, using one leg one take a step back"
              " ,lower your body like going to kneel. Raise and return to initial position"
              "Repeat for other leg"),
      Exercise(
          title: "Dead lift",
          duration: "3 X 15",
          image: "stiff-deadlift.gif",
          description:
          "Standing straight, slowly lower the dumbbells towards the front and raise back up"),
      Exercise(
          title: "Dumbbell squat",
          duration: "1 X 15",
          image: "dumbbell-squat.gif",
          description:
          "Standing straight, slowly lower the dumbbells outward of the body"
              " and slowly raise back up. "),
      // Exercise(
      //     title: "Sumo squat", duration: "1 X 15", image: "sumo-squat.gif"),
      Exercise(
          title: "Goblet squat",
          duration: "1 X 15",
          image: "goblet-squat.gif",
          description: "Hold one dumbbell with both hands towards the chest."
              "Slowly lower your body as if sitting and raise back up"),
      Exercise(
          title: "Side lunges",
          duration: "3 X 10 @",
          image: "side-lunge.gif",
          description:
          "Stand straight with arms facing down, using one leg one take a step sideways"
              " ,lower your body like going to kneel. Raise and return to initial position"
              "Repeat for other leg"),
      // Exercise(
      //     title: "Hamstring curls",
      //     duration: "3 X 16",
      //     image: "hamstring-curls.gif"),
      Exercise(
          title: "Eccentric leg raises",
          duration: "3 X 16",
          image: "leg-raise-eccentric.gif",
          description:
          "Lie down on your back and put your hands beneath your hips for support."
              "Then bend your legs and  lift them up until they form a right angl with the floor."
              "Slowly bring your legs back down and repeat the exercise"),
      Exercise(
          title: "Crunches",
          duration: "3 X 15",
          image: "crunches.gif",
          description:
          "Lie on your back with your knees vent and your arms strectched forward"
              "Then lief your upper body off the floor. Hold for a few seconds and slowly return."
              "It primarily works the rectus abdominis muscle and the obliques."),
      // Exercise(
      //     title: "Toe touches", duration: "3 X 15", image: "toe-touches.gif"),
      // Exercise(
      //     title: "Heel touch", duration: "3 X 15", image: "heel-touch.gif"),
      // Exercise(
      //     title: "Shoulder touch",
      //     duration: "3 X 12",
      //     image: "shoulder-touch.gif"),
      //   Exercise(
      //       title: "Dumbbell knee-ins",
      //       duration: "3 X 10",
      //       image: "dumbbell-knee.gif"),
      //   Exercise(
      //       title: "Alternating squats to kneel",
      //       duration: "3 X 10",
      //       image: "alternate-squats.gif"),
    ];
    List<Exercise> the_fourth_day = [
      Exercise(
          title: "Dumbbell bench press",
          duration: "3 X 15",
          image: "dumbbell-press.gif",
          description:
          "Lie on a bench with your body facing up. Holding dumbbells with both hands, "
              "push your hands straight in the air and slowly bring them down. Repeat again."),
      Exercise(
          title: "Dumbbell fly",
          duration: "3 X 15",
          image: "dumbbell-fly.gif",
          description:
          "Bend your back parallel to the ground. Hold dumbbells straight towards the ground."
              "Slowly stretch your hands to the shoulder side and bring them back to the initial position."
              "Repeat exercise"),
      Exercise(
          title: "Push ups",
          duration: "10 ...",
          image: "push-ups.gif",
          description:
          "Lay prone on the ground with arms supporting your body. "
              "Keep your body straight while raising and lowering your body with your arms."
              "This exercise works the chest, shoulders, triceps, back and legs"),
      Exercise(
          title: "Dumbbell curls",
          duration: "3 X 15",
          image: "dumbbell-curls.gif",
          description:
          "Stand straight with dumbbells in both hands facing the ground."
              " Slowly raise the hand towards the chest and take back to initial position"),
      Exercise(
          title: "Reverse fly",
          duration: "3 X 12",
          image: "reverse-fly.gif",
          description:
          "Bend your back parallel to the ground. Hold dumbbells straight towards the ground."
              "Slowly stretch your hands to the shoulder side and bring them back to the initial position."
              "Repeat exercise"),
      Exercise(
          title: "Bench dips",
          duration: "10 ...",
          image: "bench-dips.gif",
          description:
          "Put your hands on the edge of a chair with your body facing outward."
              "Extend your body outward and lower your body towards the ground. Slowly come back up,"
              " and repeat the exercise."),
      Exercise(
          title: "Leg raises",
          duration: "3 X 16",
          image: "leg-raise-eccentric.gif",
          description:
          "Lie down on your back and put your hands beneath your hips for support."
              "Then bend your legs up  and lift them until they form a right angl with the floor."
              "Slowly bring your legs back down and repeat the exercise"),
      // Exercise(
      //     title: "Ups and downs", duration: "3 X 12", image: "up-down.gif"),
      Exercise(
          title: "Crunches",
          duration: "3 X 15",
          image: "crunches.gif",
          description:
          "Lie on your back with your knees vent and your arms strectched forward"
              "Then lief your upper body off the floor. Hold for a few seconds and slowly return."
              "It primarily works the rectus abdominis muscle and the obliques."),
      Exercise(
          title: "Russian twist",
          duration: "3 X 18",
          image: "russian-twist.gif",
          description:
          "Sit on the floor with your knees bent, feet lifted a little and back tilted backwards"
              "Then hold your hands together and twist from side to side."),
      // Exercise(
      //     title: "Heel touch", duration: "3 X 15", image: "heel-touch.gif",
      // description: "Lie on the ground with your legs bent and your arms by your sides."
      // "Slightly lift your upper body off the floor and make your hands alternately reach your heels",),
      // Exercise(title: "Toe touch", duration: "3 X 12", image: "toe-touch.gif"),
      Exercise(
          title: "Plank",
          duration: "3 X 1 min",
          image: "plank.gif",
          description:
          "Lie on the floor with your toes and forearms on the ground. Keep your body straight "
              "and hold this position as long as you can This exercise strengthens the abdomen, back and shoulders"),
    ];
    List<Exercise> The_fifth_day = [
      Exercise(
          title: "Dumbbell squat",
          duration: "3 X 16",
          image: "dumbbell-squat.gif",
          description:
          "Standing straight, slowly lower the dumbbells outward of the body"
              " and slowly raise back up. "),
      // Exercise(
      //     title: "Romanian deadlift",
      //     duration: "3 X 15",
      //     image: "romanian-deadlift.gif"),
      Exercise(
          title: "Calf raise",
          duration: "10 ...",
          image: "calf-raise.gif",
          description:
          "Stand straight facing a wall. Place your hands on the wall for support."
              "Lift your body by rising your heels and standing on your toes."
              " Stand properly again, and repeat the exercise."),
      Exercise(
          title: "Glutte bridge",
          duration: "3 X 16",
          image: "glutte-bridge.gif",
          description: "Lie on your back with legs bent at 90 degrees."
              "Lift your lower back towards the back and slowly go back down"),
      Exercise(
          title: "Reverse lunges",
          duration: "3 X 12 @",
          image: "reverse-lunge.gif",
          description:
          "Stand straight with arms facing down, using one leg one take a step back"
              " ,lower your body like going to kneel. Raise and return to initial position"
              "Repeat for other leg"),
      Exercise(
          title: "Globet squats",
          duration: "3 X 16",
          image: "goblet-squat.gif",
          description: "Hold one dumbbell with both hands towards the chest."
              "Slowly lower your body as if sitting and raise back up"),
      Exercise(
          title: "Side lunge",
          duration: "3 X 12 @",
          image: "side-lunge.gif",
          description:
          "Stand straight with arms facing down, using one leg one take a step sideways"
              " ,lower your body like going to kneel. Raise and return to initial position"
              "Repeat for other leg"),
      Exercise(
          title: "Step ups",
          duration: "3 X 16",
          image: "step-up.gif",
          description: "While standing straight with a chair in front of you, "
              "take one step on top of the chair, then go back down. Repeat for other leg"),
      // Exercise(
      //     title: "Dumbbell crossover lunges",
      //     duration: "3 X 12 @",
      //     image: "dumbbell-lunge.gif"),
      Exercise(
          title: "Stiff legged deadlift",
          duration: "3 X 15",
          image: "stiff-deadlift.gif",
          description:
          "Standing straight, slowly lower the dumbbells towards the front and raise back up"),
      Exercise(
          title: "One leg raised bridge",
          duration: "3 X 12 @",
          image: "oneleg-bridge.gif",
          description:
          "Lie on your back with legs bent at 90 degrees. Raise on leg towards the sky"
              "Lift your lower back towards the back and slowly go back down"),
      // Exercise(
      //     title: "One leg toe raise",
      //     duration: "3 X 15 @",
      //     image: "onleleg-raise.gif"),
      // Exercise(
      //     title: "Dumbbell bugawan split",
      //     duration: "3 X 14",
      //     image: "dumbbell-split.gif"),
    ];
    // List week = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
    //workout list for each day of the week
    List<Exercise> the_sixth_day = [
      Exercise(
          title: "Push ups",
          duration: "10...",
          image: "push-ups.gif",
          description:
          "Lay prone on the ground with arms supporting your body. "
              "Keep your body straight while raising and lowering your body with your arms."
              "This exercise works the chest, shoulders, triceps, back and legs"),
      Exercise(
          title: "Bench Dips",
          duration: "10 ...",
          image: "bench-dips.gif",
          description:
          "Put your hands on the edge of a chair with your body facing outward."
              "Extend your body outward and lower your body towards the ground. Slowly come back up,"
              " and repeat the exercise."),
      Exercise(
          title: "Dumb-bell Press",
          duration: "3 X 15",
          image: "dumbbell-press.gif",
          description:
          "Lie on a bench with your body facing up. Holding dumbbells with both hands, "
              "push your hands straight in the air and slowly bring them down. Repeat again."),
      Exercise(
        title: "Dumb-bell Fly",
        duration: "3 X 15",
        image: "dumbbell-fly.gif",
        description:
        "Lie on a bench with your body facing up. Hold dumbbells straight in the air."
            "Slowly stretch your hands to the side and bring them back to the initial position."
            "Repeat exercise",
      ),
      Exercise(
          title: "Dumb-bell kickback",
          duration: "3 X 16",
          image: "tricep-kickback.gif",
          description:
          "Bend your back parallel to the ground. Hold the dumbbell close to your chest."
              "Moving only the elbow, push the dumbbell outward and slowly bring it back to initial position."
              "Repeat exercise."),
      Exercise(
        title: "Bentover row",
        duration: "3 X 16",
        image: "bentover-row.gif",
        description:
        "Bend your back parallet to the ground. Hold the dumbbells close to your chest."
            "Moving only the shoulder, lower the weights with arms straight. Return to the initial position",
      ),
      Exercise(
          title: "Dumb-bell upright row",
          duration: "3 X 15",
          image: "dumbbell-up.gif",
          description:
          "While standing straight with dumbbells in both hands, slowly raise the hands to chest."
              "Only move the arms and slowly lower the hands."),
      Exercise(
        title: "Arnold Dumb-bell press",
        duration: "3 X 15",
        image: "arnold-press.gif",
        description:
        "While standing straight with dumbbells in both hands close and facing the chest."
            "Push the dumbbells up straight in the air with hands facing outward. Slowly return the start position",
      ),
      Exercise(
          title: "Reverse fly",
          duration: "3 X 12",
          image: "reverse-fly.gif",
          description:
          "Bend your back parallel to the ground. Hold dumbbells straight towards the ground."
              "Slowly stretch your hands to the shoulder side and bring them back to the initial position."
              "Repeat exercise"),
      Exercise(
          title: "Renengade row",
          duration: "3 X 10-@",
          image: "renegade-row.gif",
          description:
          "In the push up position with dumbbells in the hands, slowly rise one hand towards the chest"
              "Do not move any other part of the body except the arms. Slowly return the hand to start position"),
      // Exercise(
      //     title: "Grip curls", duration: "3 X 12", image: "grip-curls.gif"),
      Exercise(
          title: "Shoulder-press",
          duration: "3 X 15",
          image: "shoulder-press.gif",
          description:
          "While standing straight with dumbbells in both hands close to the chest."
              "Push the dumbbells up straight in the air with hands facing outward. Slowly return the start position"),
    ];
    List<Exercise> the_seventh_day = [
      Exercise(
          title: "Dumbbell rows",
          duration: "3 X 15",
          image: "dumbbell-row.gif",
          description:
          "Stand straight with dumbbells in both hands facing the ground."
              " Slowly raise the hand towards the chest and take back to initial position"),
      Exercise(
          title: "Skull crushes",
          duration: "3 X 15",
          image: "skull-crusher.gif",
          description: "Lie on bench with body facing up and arms straight up. "
              "slowly bend the elbow so that the hands tend towards your head."),
      Exercise(
          title: "Hammer curls",
          duration: "3 X 15",
          image: "hammer-curls.gif",
          description:
          "Stand straight with dumbbells in both hands facing the ground."
              " Slowly raise the hand towards the chest and take back to initial position"
              "Make sure youre hands are facing each other through out the exercise."),
      // Exercise(
      //     title: "Tricep extension",
      //     duration: "3 X 15",
      //     image: "tricep-extension.gif"), look like skull crushers
      Exercise(
          title: "Bench dips",
          duration: "3 X 16",
          image: "bench-dips.gif",
          description:
          "Put your hands on the edge of a chair with your body facing outward."
              "Extend your body outward and lower your body towards the ground. Slowly come back up,"
              " and repeat the exercise."),
      Exercise(
        title: "Bentover row",
        duration: "3 X 16",
        image: "bentover-row.gif",
        description:
        "Bend your back parallet to the ground. Hold the dumbbells close to your chest."
            "Moving only the shoulder, lower the weights with arms straight. Return to the initial position",
      ),
      Exercise(
          title: "Concentration curls",
          duration: "3 X 15",
          image: "concentration-curls.gif",
          description: "Sit on a chair and place your elbow on your knee. "
              "Slowly raise your hand towards your chest, and straighten it towards the ground"),
      Exercise(
          title: "Push ups",
          duration: "3 X 15",
          image: "push-ups.gif",
          description:
          "Lay prone on the ground with arms supporting your body. "
              "Keep your body straight while raising and lowering your body with your arms."
              "This exercise works the chest, shoulders, triceps, back and legs"),
      Exercise(
          title: "Cross-body Hammer curls",
          duration: "3 X 15",
          image: "crossbody-curls.gif",
          description:
          "Stand straight with dumbbells in both hands facing the ground."
              " Slowly raise the hand towards the opposite side of the chest and take back to initial position"
              "Make sure youre hands are facing each other through out the exercise."),
      Exercise(
          title: "Dumbbell close grip bench press",
          duration: "3 X 12",
          image: "close-press.gif",
          description:
          "Lie on a bench with your body facing up. Holding dumbbells with both hands close to each other, "
              "push your hands straight in the air and slowly bring them down. Repeat again."),
      Exercise(
          title: "Dumbbell upper-cut",
          duration: "3 X 14 @",
          image: "uppercut.gif",
          description:
          "Standing in a punching position with dumbbells in your hands, "
              "push one hand high in the air in an explosive manner and return to initial position"),
      Exercise(
          title: "Dumbbell kickbacks",
          duration: "3 X 14 @",
          image: "tricep-kickback.gif",
          description:
          "Bend your back parallel to the ground. Hold the dumbbell close to your chest."
              "Moving only the elbow, push the dumbbell outward and slowly bring it back to initial position."
              "Repeat exercise."),
    ];
    List<Exercise> day_eight = [
      Exercise(
          title: "Reverse lunges",
          duration: "3 X 10 @",
          image: "reverse-lunge.gif",
          description:
          "Stand straight with arms facing down, using one leg one take a step back"
              " ,lower your body like going to kneel. Raise and return to initial position"
              "Repeat for other leg"),
      Exercise(
          title: "Dead lift",
          duration: "3 X 15",
          image: "stiff-deadlift.gif",
          description:
          "Standing straight, slowly lower the dumbbells towards the front and raise back up"),
      Exercise(
          title: "Dumbbell squat",
          duration: "1 X 15",
          image: "dumbbell-squat.gif",
          description:
          "Standing straight, slowly lower the dumbbells outward of the body"
              " and slowly raise back up. "),
      // Exercise(
      //     title: "Sumo squat", duration: "1 X 15", image: "sumo-squat.gif"),
      Exercise(
          title: "Goblet squat",
          duration: "1 X 15",
          image: "goblet-squat.gif",
          description: "Hold one dumbbell with both hands towards the chest."
              "Slowly lower your body as if sitting and raise back up"),
      Exercise(
          title: "Side lunges",
          duration: "3 X 10 @",
          image: "side-lunge.gif",
          description:
          "Stand straight with arms facing down, using one leg one take a step sideways"
              " ,lower your body like going to kneel. Raise and return to initial position"
              "Repeat for other leg"),
      // Exercise(
      //     title: "Hamstring curls",
      //     duration: "3 X 16",
      //     image: "hamstring-curls.gif"),
      Exercise(
          title: "Eccentric leg raises",
          duration: "3 X 16",
          image: "leg-raise-eccentric.gif",
          description:
          "Lie down on your back and put your hands beneath your hips for support."
              "Then bend your legs and  lift them up until they form a right angl with the floor."
              "Slowly bring your legs back down and repeat the exercise"),
      Exercise(
          title: "Crunches",
          duration: "3 X 15",
          image: "crunches.gif",
          description:
          "Lie on your back with your knees vent and your arms strectched forward"
              "Then lief your upper body off the floor. Hold for a few seconds and slowly return."
              "It primarily works the rectus abdominis muscle and the obliques."),
      // Exercise(
      //     title: "Toe touches", duration: "3 X 15", image: "toe-touches.gif"),
      // Exercise(
      //     title: "Heel touch", duration: "3 X 15", image: "heel-touch.gif"),
      // Exercise(
      //     title: "Shoulder touch",
      //     duration: "3 X 12",
      //     image: "shoulder-touch.gif"),
      //   Exercise(
      //       title: "Dumbbell knee-ins",
      //       duration: "3 X 10",
      //       image: "dumbbell-knee.gif"),
      //   Exercise(
      //       title: "Alternating squats to kneel",
      //       duration: "3 X 10",
      //       image: "alternate-squats.gif"),
    ];
    List<Exercise> ninth_day = [
      Exercise(
          title: "Dumbbell bench press",
          duration: "3 X 15",
          image: "dumbbell-press.gif",
          description:
          "Lie on a bench with your body facing up. Holding dumbbells with both hands, "
              "push your hands straight in the air and slowly bring them down. Repeat again."),
      Exercise(
          title: "Dumbbell fly",
          duration: "3 X 15",
          image: "dumbbell-fly.gif",
          description:
          "Bend your back parallel to the ground. Hold dumbbells straight towards the ground."
              "Slowly stretch your hands to the shoulder side and bring them back to the initial position."
              "Repeat exercise"),
      Exercise(
          title: "Push ups",
          duration: "10 ...",
          image: "push-ups.gif",
          description:
          "Lay prone on the ground with arms supporting your body. "
              "Keep your body straight while raising and lowering your body with your arms."
              "This exercise works the chest, shoulders, triceps, back and legs"),
      Exercise(
          title: "Dumbbell curls",
          duration: "3 X 15",
          image: "dumbbell-curls.gif",
          description:
          "Stand straight with dumbbells in both hands facing the ground."
              " Slowly raise the hand towards the chest and take back to initial position"),
      Exercise(
          title: "Reverse fly",
          duration: "3 X 12",
          image: "reverse-fly.gif",
          description:
          "Bend your back parallel to the ground. Hold dumbbells straight towards the ground."
              "Slowly stretch your hands to the shoulder side and bring them back to the initial position."
              "Repeat exercise"),
      Exercise(
          title: "Bench dips",
          duration: "10 ...",
          image: "bench-dips.gif",
          description:
          "Put your hands on the edge of a chair with your body facing outward."
              "Extend your body outward and lower your body towards the ground. Slowly come back up,"
              " and repeat the exercise."),
      Exercise(
          title: "Leg raises",
          duration: "3 X 16",
          image: "leg-raise-eccentric.gif",
          description:
          "Lie down on your back and put your hands beneath your hips for support."
              "Then bend your legs up  and lift them until they form a right angl with the floor."
              "Slowly bring your legs back down and repeat the exercise"),
      // Exercise(
      //     title: "Ups and downs", duration: "3 X 12", image: "up-down.gif"),
      Exercise(
          title: "Crunches",
          duration: "3 X 15",
          image: "crunches.gif",
          description:
          "Lie on your back with your knees vent and your arms strectched forward"
              "Then lief your upper body off the floor. Hold for a few seconds and slowly return."
              "It primarily works the rectus abdominis muscle and the obliques."),
      Exercise(
          title: "Russian twist",
          duration: "3 X 18",
          image: "russian-twist.gif",
          description:
          "Sit on the floor with your knees bent, feet lifted a little and back tilted backwards"
              "Then hold your hands together and twist from side to side."),
      // Exercise(
      //     title: "Heel touch", duration: "3 X 15", image: "heel-touch.gif",
      // description: "Lie on the ground with your legs bent and your arms by your sides."
      // "Slightly lift your upper body off the floor and make your hands alternately reach your heels",),
      // Exercise(title: "Toe touch", duration: "3 X 12", image: "toe-touch.gif"),
      Exercise(
          title: "Plank",
          duration: "3 X 1 min",
          image: "plank.gif",
          description:
          "Lie on the floor with your toes and forearms on the ground. Keep your body straight "
              "and hold this position as long as you can This exercise strengthens the abdomen, back and shoulders"),
    ];
    List<Exercise> day_ten = [
      Exercise(
          title: "Dumbbell squat",
          duration: "3 X 16",
          image: "dumbbell-squat.gif",
          description:
          "Standing straight, slowly lower the dumbbells outward of the body"
              " and slowly raise back up. "),
      // Exercise(
      //     title: "Romanian deadlift",
      //     duration: "3 X 15",
      //     image: "romanian-deadlift.gif"),
      Exercise(
          title: "Calf raise",
          duration: "10 ...",
          image: "calf-raise.gif",
          description:
          "Stand straight facing a wall. Place your hands on the wall for support."
              "Lift your body by rising your heels and standing on your toes."
              " Stand properly again, and repeat the exercise."),
      Exercise(
          title: "Glutte bridge",
          duration: "3 X 16",
          image: "glutte-bridge.gif",
          description: "Lie on your back with legs bent at 90 degrees."
              "Lift your lower back towards the back and slowly go back down"),
      Exercise(
          title: "Reverse lunges",
          duration: "3 X 12 @",
          image: "reverse-lunge.gif",
          description:
          "Stand straight with arms facing down, using one leg one take a step back"
              " ,lower your body like going to kneel. Raise and return to initial position"
              "Repeat for other leg"),
      Exercise(
          title: "Globet squats",
          duration: "3 X 16",
          image: "goblet-squat.gif",
          description: "Hold one dumbbell with both hands towards the chest."
              "Slowly lower your body as if sitting and raise back up"),
      Exercise(
          title: "Side lunge",
          duration: "3 X 12 @",
          image: "side-lunge.gif",
          description:
          "Stand straight with arms facing down, using one leg one take a step sideways"
              " ,lower your body like going to kneel. Raise and return to initial position"
              "Repeat for other leg"),
      Exercise(
          title: "Step ups",
          duration: "3 X 16",
          image: "step-up.gif",
          description: "While standing straight with a chair in front of you, "
              "take one step on top of the chair, then go back down. Repeat for other leg"),
      // Exercise(
      //     title: "Dumbbell crossover lunges",
      //     duration: "3 X 12 @",
      //     image: "dumbbell-lunge.gif"),
      Exercise(
          title: "Stiff legged deadlift",
          duration: "3 X 15",
          image: "stiff-deadlift.gif",
          description:
          "Standing straight, slowly lower the dumbbells towards the front and raise back up"),
      Exercise(
          title: "One leg raised bridge",
          duration: "3 X 12 @",
          image: "oneleg-bridge.gif",
          description:
          "Lie on your back with legs bent at 90 degrees. Raise on leg towards the sky"
              "Lift your lower back towards the back and slowly go back down"),
      // Exercise(
      //     title: "One leg toe raise",
      //     duration: "3 X 15 @",
      //     image: "onleleg-raise.gif"),
      // Exercise(
      //     title: "Dumbbell bugawan split",
      //     duration: "3 X 14",
      //     image: "dumbbell-split.gif"),
    ];

    //2D list containing days and their respective workouts.
    List<List<Exercise>> daysWorkoutLists = [
      First_day,
      Second_day,
      third_day,
      the_fourth_day,
      The_fifth_day,
      the_sixth_day,
      the_seventh_day,
      day_eight,
      ninth_day,
      day_ten,
    ];

    return ListView.builder(
      itemCount: week.length,
      itemBuilder: (context, index) {
        WeekDay weekDay = week[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Container(
            width: 300,
            height: 70,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => WorkoutPage(
                      day: weekDay,
                      exercises: daysWorkoutLists[index],
                    ),
                  ),
                );
              },
              title: Center(
                child: Text(
                  weekDay.day,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}