import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/widgets/task_widget.dart';

import '../controller/task_controller.dart';
import '../helpers/button.dart';
import '../screens/edit_task_screen.dart';
import '../screens/view_task_screen.dart';
import '../utils/app_colors.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required TaskController taskController,
    required this.leftEditIcon,
    required this.rightDeleteIcon,
  }) : _taskController = taskController;

  final TaskController _taskController;
  final Container leftEditIcon;
  final Container rightDeleteIcon;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Obx(() {
        if (_taskController.tasks.isEmpty) {
          return const Center(
            child: Text(
              'No tasks available!',
              style: TextStyle(fontSize: 20),
            ),
          );
        } else {
          return ListView.builder(
              itemCount: _taskController.tasks.length,
              itemBuilder: (context, index) {
                Task task = _taskController.tasks[index];
                return Dismissible(
                  background: leftEditIcon,
                  secondaryBackground: rightDeleteIcon,
                  onDismissed: (DismissDirection direction) {},
                  confirmDismiss: (DismissDirection direction) async {
                    if (direction == DismissDirection.startToEnd) {
                      showModalBottomSheet(
                          backgroundColor: Colors.blue.withOpacity(0.1),
                          barrierColor: Colors.grey.withOpacity(0.8),
                          context: context,
                          builder: (_) {
                            return Container(
                              padding: const EdgeInsets.only(top: 100),
                              width: double.maxFinite,
                              height: 400,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    style: button(AppColors.mainColor,
                                        AppColors.textHolder),
                                    onPressed: () {
                                      Get.to(
                                          () => ViewTaskScreen(
                                              name: task.taskName,
                                              detail: task.taskDetail),
                                          transition: Transition.zoom,
                                          duration: const Duration(
                                              milliseconds: 800));
                                    },
                                    child: const Text('View'),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  ElevatedButton(
                                    style: button(AppColors.mainColor,
                                        AppColors.secondaryColor),
                                    onPressed: () {
                                      Get.to(
                                          () => EditTaskScreen(
                                                task: task,
                                              ),
                                          transition: Transition.zoom,
                                          duration: const Duration(
                                              milliseconds: 800));
                                    },
                                    child: const Text('Edit'),
                                  )
                                ],
                              ),
                            );
                          });
                      return false;
                    } else {
                      showModalBottomSheet(
                          backgroundColor: Colors.blue.withOpacity(0.1),
                          barrierColor: Colors.grey.withOpacity(0.2),
                          context: context,
                          builder: (_) {
                            return Container(
                              padding: const EdgeInsets.only(top: 100),
                              width: double.maxFinite,
                              height: 400,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    style: button(Colors.red, Colors.white),
                                    onPressed: () async {
                                      try {
                                        await _taskController
                                            .deleteTask(task.id);
                                        Get.back();
                                      } catch (e) {
                                        Get.snackbar(
                                            "error", "Failed to delete task");
                                      }
                                    },
                                    child: const Text('Delete'),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  ElevatedButton(
                                    style: button(Colors.green, Colors.white),
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text('Cancel'),
                                  )
                                ],
                              ),
                            );
                          });
                      return false;
                    }
                  },
                  key: ObjectKey(index),
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: TaskWidget(
                        text: task.taskName, color: AppColors.textHolder),
                  ),
                );
              });
        }
      }),
    );
  }
}
