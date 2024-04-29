import 'dart:async';
import 'package:http/http.dart' as http;
void main()async{

final uri = Uri.https('www.example.com','/');
print(uri);

final future =http.get(uri);
future.then((response) => {
  if (response.statusCode == 200){
    print('Página carregada com sucesso.'),
    print(response.body)
  }
   else if (response.statusCode == 301){
    print('Página movida permanentemente.')
  }
   else if (response.statusCode == 404){
    print('Página não encontrada.')
  }
   else if (response.statusCode == 500){
    print('Erro interno do servidor.')
  },

});
future.catchError((onError) => print('Erro'));
future.whenComplete(() => print('Future completo!'));
}
