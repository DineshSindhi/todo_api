import 'dart:convert';

import 'package:api_todo/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataModel? mTodo;
  @override
  void initState() {
    super.initState();
    getTodo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo'),centerTitle: true,),
      body: mTodo != null?
          mTodo!.todos!.isNotEmpty?
              ListView.builder(
                itemCount: mTodo!.todos!.length,
                itemBuilder: (context, index) =>
                ListTile(
                    tileColor: mTodo!.todos![index].completed==true?Colors.green:Colors.white,
                  leading: Checkbox(
                      value: mTodo!.todos![index].completed,
                      activeColor: Colors.blue,

                      onChanged: (newValue){
                        mTodo!.todos![index].completed=newValue;
                        setState(() {

                        });
                      }),
                  title: Text('${mTodo!.todos![index].todo}'),
                 // trailing: Text('${mTodo!.todos![index].userId}'),
                )
                ,)
              :Center(child: Text('No Todo Yet!!'),)
          :Center(child: CircularProgressIndicator(),)
    );
  }
  getTodo()async{
    String url='https://dummyjson.com/todos';
    var response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      var mData=response.body;
      var rawData=jsonDecode(mData);
      mTodo=DataModel.fromJson(rawData);
      setState(() {

      });
    }
  }
}
