class TaskModel {
  final String name;
  final String startdate;
  final String enddate;
  final int completedtask;
  final int totaltasks;

  TaskModel({
    required this.name,
    required this.startdate,
    required this.enddate,
    required this.completedtask,
    required this.totaltasks,
  });

  // Factory constructor to create an instance of the model from JSON
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      name: json['name'] as String,
      startdate: json['startdate'] as String,
      enddate: json['enddate'] as String,
      completedtask: json['completedtask'] as int,
      totaltasks: json['totaltasks'] as int,
    );
  }

  // Method to convert the model to a JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'startdate': startdate,
      'enddate': enddate,
      'completedtask': completedtask,
      'totaltasks': totaltasks,
    };
  }
}

List<TaskModel> tasks = [
  TaskModel(name: 'Task 1', startdate: '2023-08-01', enddate: '2023-08-05', completedtask: 3, totaltasks: 5),
  TaskModel(name: 'Task 2', startdate: '2023-08-10', enddate: '2023-08-15', completedtask: 5, totaltasks: 7),
  TaskModel(name: 'Task 3', startdate: '2023-08-20', enddate: '2023-08-25', completedtask: 4, totaltasks: 6),
  TaskModel(name: 'Task 4', startdate: '2023-08-26', enddate: '2023-08-28', completedtask: 2, totaltasks: 4),
  TaskModel(name: 'Task 5', startdate: '2023-08-29', enddate: '2023-08-31', completedtask: 1, totaltasks: 3),
  TaskModel(name: 'Task 6', startdate: '2023-09-01', enddate: '2023-09-03', completedtask: 4, totaltasks: 4),
  TaskModel(name: 'Task 7', startdate: '2023-09-05', enddate: '2023-09-07', completedtask: 3, totaltasks: 5),
  TaskModel(name: 'Task 8', startdate: '2023-09-10', enddate: '2023-09-12', completedtask: 2, totaltasks: 3),
  TaskModel(name: 'Task 9', startdate: '2023-09-15', enddate: '2023-09-17', completedtask: 2, totaltasks: 2),
  TaskModel(name: 'Task 10', startdate: '2023-09-20', enddate: '2023-09-22', completedtask: 4, totaltasks: 4),
  TaskModel(name: 'Task 11', startdate: '2023-09-25', enddate: '2023-09-27', completedtask: 3, totaltasks: 6),
  TaskModel(name: 'Task 12', startdate: '2023-10-01', enddate: '2023-10-03', completedtask: 1, totaltasks: 3),
  TaskModel(name: 'Task 13', startdate: '2023-10-05', enddate: '2023-10-07', completedtask: 2, totaltasks: 5),
  TaskModel(name: 'Task 14', startdate: '2023-10-10', enddate: '2023-10-12', completedtask: 4, totaltasks: 5),
  TaskModel(name: 'Task 15', startdate: '2023-10-15', enddate: '2023-10-17', completedtask: 5, totaltasks: 5),
  TaskModel(name: 'Task 16', startdate: '2023-10-20', enddate: '2023-10-22', completedtask: 1, totaltasks: 4),
  TaskModel(name: 'Task 17', startdate: '2023-10-25', enddate: '2023-10-27', completedtask: 2, totaltasks: 3),
  TaskModel(name: 'Task 18', startdate: '2023-11-01', enddate: '2023-11-03', completedtask: 1, totaltasks: 2),
  TaskModel(name: 'Task 19', startdate: '2023-11-05', enddate: '2023-11-07', completedtask: 2, totaltasks: 5),
  TaskModel(name: 'Task 20', startdate: '2023-11-10', enddate: '2023-11-12', completedtask: 3, totaltasks: 5),
];