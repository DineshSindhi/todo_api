import 'package:api_todo/model/tododata.dart';

class DataModel{
  int? limit;
  int? skip;
  int? total;
  List<TodoModel>?todos;
  DataModel({required this.limit,required this.skip,required this.todos,required this.total});

  factory DataModel.fromJson(Map<String,dynamic>json){
    List<TodoModel>mTodo=[];
    for(Map<String,dynamic>eachTodo in json['todos']){
      TodoModel model=TodoModel.fromJson(eachTodo);
      mTodo.add(model);
    }
    return DataModel(
        limit: json['limit'],
        skip: json['skip'],
        todos: mTodo,
        total: json['total']
    );
  }
}