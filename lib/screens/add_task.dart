import 'package:flutter/material.dart';
import 'package:my_app/utils/app_colors.dart';
import 'package:my_app/widgets/textField_widget.dart';
import 'package:my_app/helpers/button.dart';
import 'package:get/get.dart';

class AddTask extends StatelessWidget{
  const AddTask({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context){
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

    return Scaffold(
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        padding: const EdgeInsets.only(left: 10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              "assets/addTask.jpg"
            )
          )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 40,
                ),

                IconButton(onPressed: (){
                  Get.back();
                }, icon: Icon(Icons.arrow_back, color: AppColors.smallTextColor,))
              ]
            ),
            Column(
              children: [
                TextFieldWidget(textController: nameController, hintText: "Task Name", borderRadius: 15),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(textController: detailController, hintText: "Task Details", borderRadius: 30, maxLines: 4,),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: button(AppColors.mainColor, AppColors.textHolder),
                  onPressed: () {},
                  child: const Text('Add'),
                )
                              
              ]
            ),
            SizedBox(
          height: MediaQuery.of(context).size.height/6,)
          ]
        ),

        
      )
    );
  }
}