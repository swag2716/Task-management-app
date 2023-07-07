import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/app_colors.dart';


class ViewTaskScreen extends StatelessWidget{
  final String name;
  final String detail;
  const ViewTaskScreen({Key? key, required this.name, required this.detail}): super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Column(
        children: [
        Container(
            padding: const EdgeInsets.only(left: 10, top: 40),
            alignment: Alignment.topLeft,
            
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height / 3,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage("assets/header.jpg")
                )
            ),
            child: InkWell(
                onTap: () {
                  Get.back();
                  Get.back();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.smallTextColor,
                )),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 20, right: 20, bottom: 10),
            width: double.maxFinite,
            height: MediaQuery.of(context).size.height/14,
            decoration: BoxDecoration(
            color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(name, style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),),
          ),
          ),
          Container(
            margin: const EdgeInsets.only(
              left: 20, right: 20, bottom: 10),
            padding: const EdgeInsets.all(20),
            width: double.maxFinite,
            decoration: BoxDecoration(
            color: AppColors.secondaryColor,
            borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(detail, style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),),
      ),
      )
      ],

      
      )
    );
  }
}