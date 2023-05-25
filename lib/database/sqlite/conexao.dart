class Conexao {
  
  static late Database _conexao;
  static bool _fechado = true;

   static Future<Database> criar() async { //como estamos utilizando o await dentro da função, precisamos tornar a função assíncrona, colocando async
    if(_fechado){
      String path = join(await getDatabasesPath(), 'banco.db'); // precisamos "esperar" (await) o resultado para seguir a execução
      _database = await openDatabase( // precisamos "esperar" (await) a abertuda do database para retorná-lo
       [...]
      );
      _fechado = false;
    }
    return _database;
  }
}