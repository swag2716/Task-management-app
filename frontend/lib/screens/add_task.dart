import 'package:flutter/material.dart';
import 'package:my_app/utils/app_colors.dart';
import 'package:my_app/widgets/textField_widget.dart';
import 'package:my_app/helpers/button.dart';
import 'package:get/get.dart';
import '../controller/task_controller.dart';

class AddTask extends StatelessWidget{
  final TaskController _taskController = Get.find<TaskController>();
  AddTask({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context){
    TextEditingController nameController = TextEditingController();
    TextEditingController detailController = TextEditingController();

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
                },
                child: Icon(
                  Icons.arrow_back,
                  color: AppColors.smallTextColor,
                )),
          ),

          Expanded(
            child: SingleChildScrollView(
              child: Column(
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
                      onPressed: () async{
                        Task newTask = Task(
                          id: "",
                          taskName: nameController.text, 
                          taskDetail: detailController.text, 
                          taskId: "",
                          // date: ,
                          );

                          try{
                            await _taskController.addTask(newTask);
                            Get.back();
                          } catch(e){
                            Get.snackbar("error", "Failed to add task");
                          }
                      },
                      child: const Text('Add'),
                    )
                                  
                  ]
                ),
                
            ),
            ),

        ]
        ),
    );
  }
}










