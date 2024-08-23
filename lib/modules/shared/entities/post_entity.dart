class PostEntity {
  final String id;
  final String userID;
  final int likesNumber;
  final int commentsNumber;
  final String? postImage;
  final String body;
  final String date;

  PostEntity({
    required this.id,
    required this.userID,
    required this.likesNumber,
    required this.commentsNumber,
    required this.postImage,
    required this.body,
    required this.date,
  });
}
