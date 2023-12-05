
class ModelTodo {
  int? id;
  String title;
  String content;

  ModelTodo({
    required this.id,
    required this.title,
    required this.content,
  });

  factory ModelTodo.fromJson(Map<String, dynamic> data) => ModelTodo(
        id: data["todo_id"],
        title: data["todo_title"],
        content: data["todo_content"],
      );

  Map<String, dynamic> toJson() => {
        "todo_id": id,
        "todo_title": title,
        "todo_content": content,
      };
}
