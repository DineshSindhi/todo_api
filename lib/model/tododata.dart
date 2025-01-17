class TodoModel{
  int? id;
  int? userId;
  String? todo;
  bool? completed;
  TodoModel({required this.id,required this.todo,required this.completed,required this.userId});

  factory TodoModel.fromJson(Map<String,dynamic>json){
    return TodoModel(
        id: json['id'],
        todo: json['todo'],
        completed: json['completed'],
        userId: json['userId']
    );
  }
}