import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Task{
  final String id;
  final String taskName;
  final String taskDetail;
  final DateTime date;

  Task({required this.id, required this.taskName, required this.taskDetail, required this.date});

  Task withId(String newId) {
    return Task(
      id: newId,
      taskName: taskName,
      taskDetail: taskDetail,
      date: date,
    );
  }

  factory Task.fromJSON(Map<String, dynamic> json){
    return Task(
      id: json['_id'], 
      taskName: json['task_name'], 
      taskDetail: json['task_detail'], 
      date: DateFormat('dd-MM-yyyy').parse(json['date']),
      );
  }

  Map<String, dynamic> toJSON() {
    return {
      '_id':id,
      'task_name':taskName,
      'task_detail':taskDetail,
      'date':DateFormat('dd-MM-yyyy').format(date),
    };
  }

}

class TaskController extends GetxController{
  final tasks = <Task>[].obs;

  Future <void> getTasks(String? taskId) async{
    try{
      String url = 'http://localhost:8000/task';
      if(taskId != null) {
        url+= taskId;
      }
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body) as List<dynamic>;
        tasks.value = jsonData.map((data) => Task.fromJSON(data)).toList();
      } else{
        throw Exception('Failed to fetch tasks');
      }
    } catch(e) {
      throw Exception('Failed to fetch task : $e');
    }
  }

  Future<void> editTask(Task task) async {
    try {
      final response = await http.put(
        Uri.parse('http://localhost:8000/task/${task.id}'),
        body: jsonEncode(task.toJSON()),
        headers: {'Content-Type': 'application/json'},
      );

      if(response.statusCode != 200){
        final index = tasks.indexWhere((t) => t.id == task.id);
        if(index != -1){
          tasks[index] = task;
        }
        throw Exception('Failed to edit task');
      }
    } catch(e) {
      throw Exception('Failed to edit task: $e');
    }
  }

  Future<void> deleteTask(String taskId) async {
    try{
      final response = await http.delete(Uri.parse('http://localhost:8000/task/$taskId'));
      if(response.statusCode == 200){
        tasks.removeWhere((t) => t.id == taskId);
        
      } else{
        throw Exception('Failed to delete task');
      }
    }catch(e) {
      throw Exception('Failed to delete task: $e');
    }
  }

  Future<void> addTask(Task task) async {
    try {
      final response = await http.post(
        Uri.parse('http://localhost:8000/task'),
        body: jsonEncode(task.toJSON()),
        headers: {'Content-Type': 'application/json'},
      );
      if(response.statusCode == 200){
        final createdTask = Task.fromJSON(jsonDecode(response.body));
        tasks.add(createdTask);      
      } else{
        throw Exception('Failed to create task');
      }
    } catch(e) {
      throw Exception('Failed to create task: $e');
    }
  }
}