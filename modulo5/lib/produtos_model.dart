/*
{
  "produto_id":"60c8as1663faf020930f0e95",
  "produto":"ex ex nulla",
  "endereco":"Broome Street 53,Bawcomville,South Carolina",
  "descricao":"Laboris commodo cupidatat veniam esse",
  "imagem":"hattp",
  "quantidade": "26",
  "preco": "12.37"
},
*/
class Produto {
  final String produtoId;
  final String produto;
  final String endereco;
  final String descricao;
  final String imagem;
  final int quantidade;
  final double preco;

  Produto(this.produtoId, this.produto, this.endereco, this.descricao,
      this.imagem, this.quantidade, this.preco);
      
  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      json['produto_id'],
      json['produto'],
      json['endereco'],
      json['descricao'],
      json['imagem'],
      int.parse(json['quantidade']),
      double.parse(json['preco']),
    );
  }

  Map<String, dynamic> toJson() => {
    'produto_id': this.produtoId,
    'produto': this.produto,
    'endereco': this.endereco,
    'descricao': this.descricao,
    'imagem': this.imagem,
    'quantidade': this.quantidade,
    'preco': this.preco,
  };
}
