import 'package:flutter/material.dart';
import 'package:my_app/screens/add_task.dart';
import 'package:my_app/screens/all_tasks.dart';
import 'package:my_app/utils/app_colors.dart';
import 'package:my_app/helpers/button.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage("assets/welcome.jpg"))),
        padding: const EdgeInsets.only(left: 20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                  text: TextSpan(
                      text: "Hello",
                      style: TextStyle(
                          color: AppColors.mainColor,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                      children: [
                    TextSpan(
                      text: "\nStart your beautiful day",
                      style: TextStyle(
                        color: AppColors.smallTextColor,
                        fontSize: 14,
                      ),
                    )
                  ])),

                  SizedBox(
                    height: MediaQuery.of(context).size.height/2.2,
                  ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                  style: button(AppColors.mainColor, AppColors.textHolder),
                  onPressed: () {
                    Get.to(()=> const AddTask(), transition: Transition.zoom, duration: const Duration(milliseconds: 800) );
                  },
                  child: const Text('Add task'),
                ),

                const SizedBox(
                  height: 30,
                ),
              
                ElevatedButton(
                  style: button(AppColors.textHolder, AppColors.mainColor),
                  onPressed: () {
                    Get.to(()=> const AllTasks(), transition: Transition.fade, duration: const Duration(seconds: 1) );
                  },
                  child: const Text('View all'),
                )
                ]
                ),
              ),
            ]),
      ),
    );
  }
}
