import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/task_controller.dart';
import '../helpers/button.dart';
import '../utils/app_colors.dart';
import '../widgets/textField_widget.dart';

class EditTaskScreen extends StatelessWidget{
  final TaskController _taskController = Get.find<TaskController>();
  final Task task;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  EditTaskScreen({Key? key, required this.task}): super(key: key){
    nameController.text = task.taskName;
    detailController.text = task.taskDetail;
  }

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
                  TextFieldWidget(textController: nameController, borderRadius: 15),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(textController: detailController, borderRadius: 30, maxLines: 4,),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: button(AppColors.mainColor, AppColors.secondaryColor),
                  onPressed: () async{
                    
                      Task updatedTask = Task(
                        id: task.id,
                        taskName: nameController.text,
                        taskDetail: detailController.text
                      );

                      try{
                          await _taskController.editTask(updatedTask);
                          Get.back();
                          Get.back();
                        } catch(e){
                          print(e);
                          Get.snackbar("error", "Failed to update task");
                        }
                  },
                  child: const Text('Edit'),
                )
                ],
                ),
            ),
          )

        ]
        ),
    );
  }
}