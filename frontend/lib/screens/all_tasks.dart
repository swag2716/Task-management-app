import 'package:flutter/material.dart';
import 'package:my_app/controller/task_controller.dart';
import 'package:my_app/screens/view_task_screen.dart';
import 'package:my_app/utils/app_colors.dart';
import 'package:my_app/widgets/task_widget.dart';
import 'package:my_app/helpers/button.dart';
import 'package:get/get.dart';

import 'edit_task_screen.dart';
class AllTasks extends StatefulWidget {
  final String? taskId;
  const AllTasks({Key? key, this.taskId}) : super(key: key);

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  final TaskController _taskController = Get.find<TaskController>();

  @override
  void initState(){
    super.initState();
    _taskController.getTasks(widget.taskId);
  }

  @override
  Widget build(BuildContext context) {


    final leftEditIcon = Container(
      padding: const EdgeInsets.only(left: 20),
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
          color: AppColors.smallTextColor,
          borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.centerLeft,
      child: const Icon(
        Icons.edit,
        color: Colors.white,
      ),
    );
    final rightDeleteIcon = Container(
      padding: const EdgeInsets.only(right: 20),
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      decoration: BoxDecoration(
          color: Colors.red, borderRadius: BorderRadius.circular(10)),
      alignment: Alignment.centerRight,
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
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
          Container(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(children: [
              Icon(Icons.home, color: AppColors.secondaryColor),
              const SizedBox(
                width: 10,
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.5),
                  color: Colors.black,
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Icon(Icons.calendar_month_sharp, color: AppColors.secondaryColor),
              const SizedBox(
                width: 10,
              ),
              Text(
                "2",
                style: TextStyle(fontSize: 20, color: AppColors.secondaryColor),
              )
            ]),
          ),
          Flexible(
            child: Obx(
              () => ListView.builder(
                  itemCount: _taskController.tasks.length,
                  itemBuilder: (context, index) {
                    Task task = _taskController.tasks[index];
                    return Dismissible(
                      background: leftEditIcon,
                      secondaryBackground: rightDeleteIcon,
                      onDismissed: (DismissDirection direction) {
                        print("After dismiss");
                      },
                      confirmDismiss: (DismissDirection direction) async {
                        if(direction==DismissDirection.startToEnd){
                          showModalBottomSheet(
                            backgroundColor: Colors.blue.withOpacity(0.1),
                            barrierColor: Colors.grey.withOpacity(0.2),
                            context: context, builder: (_){
                              if(direction == DismissDirection.startToEnd){}
                              return Container(
                                padding: const EdgeInsets.only(top: 100),
                                width: double.maxFinite,
                                height: 400,
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                      style: button(AppColors.mainColor, AppColors.textHolder),
                                      onPressed: () {
                                        Get.to(()=> ViewTaskScreen(name: task.taskName, detail: task.taskDetail), transition: Transition.zoom, duration: const Duration(milliseconds: 800) );
                                      },
                                      child: const Text('View'),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    ElevatedButton(
                                      style: button(AppColors.mainColor, AppColors.secondaryColor),
                                      onPressed: () {
                                        Get.to(()=> EditTaskScreen(task: task,), transition: Transition.zoom, duration: const Duration(milliseconds: 800) );
                                      },
                                      child: const Text('Edit'),
                                    )
                                  ],
                                ),
                              );
                            }
                          );
                          return false;
                        }else{
                          showModalBottomSheet(
                            backgroundColor: Colors.blue.withOpacity(0.1),
                            barrierColor: Colors.grey.withOpacity(0.2),
                            context: context, builder: (_){
                              if(direction == DismissDirection.startToEnd){}
                              return Container(
                                padding: const EdgeInsets.only(top: 100),
                                width: double.maxFinite,
                                height: 400,
                                child: Column(
                                  children: [
                                    ElevatedButton(
                                      style: button(Colors.red, Colors.white),
                                      onPressed: () {},
                                      child: const Text('Delete'),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    ElevatedButton(
                                      style: button(Colors.green, Colors.white),
                                      onPressed: () {},
                                      child: const Text('Cancel'),
                                    )
                                  ],
                                ),
                              );
                            }
                          );
                          return Future.delayed(const Duration(seconds: 1), ()=> direction == DismissDirection.endToStart);
                        }
                      },
                      key: ObjectKey(index),
                      child: Container(
                        margin: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 10),
                        child: TaskWidget(
                            text: task.taskName, color: AppColors.textHolder),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
