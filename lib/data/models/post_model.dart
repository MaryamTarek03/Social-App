class PostModel {
  final int postID;
  final int userID;
  final int likesNumber;
  final int commentsNumber;
  final String postImage;
  final String body;
  final String date;

  PostModel({
    required this.postID,
    required this.userID,
    required this.likesNumber,
    required this.commentsNumber,
    required this.body,
    required this.date,
    required this.postImage,
  });
}
