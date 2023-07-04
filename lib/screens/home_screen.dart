import 'package:flutter/material.dart';
import 'package:my_app/utils/app_colors.dart';
import 'package:my_app/helpers/button.dart';

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
                children: [ElevatedButton(
                  style: button(AppColors.mainColor, AppColors.textHolder),
                  onPressed: () {},
                  child: const Text('Add task'),
                ),

                SizedBox(
                  height: MediaQuery.of(context).size.height/25,
                ),
              
                ElevatedButton(
                  style: button(AppColors.textHolder, AppColors.mainColor),
                  onPressed: () {},
                  child: const Text('View all'),
                )
                ]
                ),
              ),

              // ButtonWidget(text: "Add Task", backgroundColor: AppColors.mainColor, textColor: AppColors.textHolder)
            ]),
      ),
    );
  }
}
