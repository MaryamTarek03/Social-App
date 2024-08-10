class CommentModel{
  final int commentID;
  final int postID;
  final int userID;
  final int likes;
  final String body;
  final String date;

  CommentModel({
    required this.commentID,
    required this.postID,
    required this.userID,
    required this.likes,
    required this.body,
    required this.date,
  });
}
