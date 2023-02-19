part of models;

/// Le modele qui sera utilisé pour les posts
class Post extends Model {
  final int id;
  final int userId;
  final String title;
  final String body;


  /// Marquer son constructeur comme etant privé
  Post._internal(
      {required this.id,
      required this.userId,
      required this.title,
      required this.body});

  /// Definir un constructeur statique basé sur un dictionnaire json du post
  factory Post.fromJson(Map<String, dynamic> jsonPost) => Post._internal(
      id: jsonPost['id'],
      userId: jsonPost['userId'],
      title: jsonPost['title'],
      body: jsonPost['body']);

  /// constructeur statique basé sur une chaine de caractere (généré par [toJson])
  factory Post.fromString(String stringPost) =>
      Post.fromJson(json.decode(stringPost));

  /// Methode statique pour reccuperer tous les posts disponibles
  static Future<List<Post>> getAllPosts() async {
    List jsonPosts = (await Model.fetch("${Constants.baseApiUrl}/posts")) ?? [];
    return jsonPosts.isEmpty
        ? []
        : jsonPosts.map((jsonPost) =>  Post.fromJson(jsonPost)).toList();
  }

  /// Methode qui permet de reccuperer un post en partiulier
  static Future<Post?> getPost(int postId) async {
    Map<String, dynamic>? jsonPost =
        await Model.fetch("${Constants.baseApiUrl}/posts/$postId");
    return jsonPost == null ? null : Post.fromJson(jsonPost);
  }
  /// le getter qui genere le dictionnaire (obj)
  String get toJson =>
      json.encode({'id': id, 'title': title, 'body': body, 'userId': userId});
}
