import 'package:futebol_app/models/time.dart';

int favoritar(List<Time> times, int index, int contador){
  times[index].favorito = !times[index].favorito;
  if(times[index].favorito){
    contador++;
  }else{
    contador--;
  }
  return contador;
}