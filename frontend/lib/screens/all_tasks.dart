import 'package:flutter/material.dart';
import 'package:my_app/controller/task_controller.dart';
import 'package:my_app/screens/add_task.dart';
import 'package:my_app/screens/home_screen.dart';
import 'package:my_app/utils/app_colors.dart';
import 'package:get/get.dart';
import '../widgets/task_list_widget.dart';


class AllTasks extends StatefulWidget {
  final String? taskId;
  const AllTasks({Key? key, this.taskId}) : super(key: key);

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  final TaskController _taskController = Get.find<TaskController>();

  @override
  void initState() {
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
                    fit: BoxFit.cover, image: AssetImage("assets/header.jpg"))),
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
              InkWell(
                  onTap: () {
                    Get.to(() => const HomeScreen(),
                        transition: Transition.fade,
                        duration: const Duration(milliseconds: 800));
                  },
                  child: Icon(Icons.home,
                      size: 35, color: AppColors.secondaryColor)),
              Expanded(
                child: Container(),
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.5),
                  color: Colors.black,
                ),
                child: InkWell(
                  onTap: () {
                    Get.to(() => AddTask(),
                        transition: Transition.zoom,
                        duration: const Duration(milliseconds: 800));
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ]),
          ),
          TaskList(
              taskController: _taskController,
              leftEditIcon: leftEditIcon,
              rightDeleteIcon: rightDeleteIcon)
        ],
      ),
    );
  }
}

