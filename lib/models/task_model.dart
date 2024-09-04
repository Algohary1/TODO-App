class TaskModel {
  String id;
  String title;
  String description;
  int date;
  bool isDone;
  String userID;

  TaskModel(
      {this.id = '',
      required this.title,
      required this.description,
      required this.date,
      required this.userID,
      this.isDone = false});

  TaskModel.fromJson(Map <String, dynamic> json) : this (
  title: json['title'],
  description: json['description'],
  date: json['date'],
  isDone: json['isDone'],
  id: json['id'],
  userID: json['userID'],
  );

  Map<String,dynamic> toJson(){
    return{
      'title': title,
      'description': description,
      'date': date,
      'isDone': isDone,
      'id': id,
      'userID': userID,
    };
  }
}
