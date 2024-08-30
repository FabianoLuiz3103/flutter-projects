import '../models/to_do.dart';

List<ToDo> lista_toDo(){
       final todos = List.generate(
      20,
       (i) => ToDo(
        'ToDo $i',
        'Descrição do ToDo $i'
       )
       );
       return todos;

  }