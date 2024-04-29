import 'dart:async';
void main()async{
  
  print(1);
  print(2);
  print(3);
  //print(4);
  /*
Future<void>quatro = Future.delayed(
    Duration(seconds: 3),
    );
    quatro.then((value) => print(4));
*/
  await quatro();
  print(5);
}
Future<void> quatro()async{
  //print(4);
  return Future.delayed(Duration(seconds: 3), () => print(4));
}