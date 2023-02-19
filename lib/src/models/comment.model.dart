part of 'models.dart';

/// Le model pour les commentaires
class Comment extends Model {
  final int id;
  final int postId;
  final String name;
  final String email;
  final String body;

  /// definir un constructeur privé
  Comment._internal(
      {required this.id,
      required this.postId,
      required this.name,
      required this.email,
      required this.body});

  /// definir un constructur statique
  factory Comment.fromJson(Map<String, dynamic> json) => Comment._internal(
      id: json['id'],
      postId: json['postId'],
      name: json['name'],
      email: json['email'],
      body: json['body']);

  /// Methode qui permet de reccuperer tous les commntaires disponibles
  static Future<List<Comment>> getAllComments() async {
    List jsonComments =
        (await Model.fetch("${Constants.baseApiUrl}/comments")) ?? [];

    return jsonComments.isEmpty
        ? []
        : jsonComments
            .map((jsonComment) => Comment.fromJson(jsonComment))
            .toList();
  }

  /// Methode qui permet de reccuperer les commentainres liés à un post
  static Future<List<Comment>> getPostComments(int postId) async {
    List jsonComments =
        (await Model.fetch("${Constants.baseApiUrl}/posts/$postId/comments")) ??
            [];

    return jsonComments.isEmpty
        ? []
        : jsonComments
            .map((jsonComment) => Comment.fromJson(jsonComment))
            .toList();
  }

  /// methide qui permet de reccuperer un commentaire particulier d'un post
  static Future<Comment?> getComment(int postId, int commentId) async {
    Map<String, dynamic>? jsonComment = await Model.fetch(
        "${Constants.baseApiUrl}/comments/$commentId?postId=$postId");
    return jsonComment == null ? null : Comment.fromJson(jsonComment);
  }
}
