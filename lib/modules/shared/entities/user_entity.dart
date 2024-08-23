class MyUserEntity {
  final String id;
  final String name;
  final String username;
  final String bio;
  final String email;
  final String profileImage;
  final String backgroundImage;

  MyUserEntity({
    required this.id,
    required this.name,
    required this.username,
    required this.bio,
    required this.email,
    required this.profileImage,
    required this.backgroundImage,
  });

  Map<String, dynamic> toDocument() {
    return {
      'id': id,
      'bio': bio,
      'name': name,
      'email': email,
      'username': username,
      'profileImage': profileImage,
    };
  }

  static MyUserEntity fromDocument(Map<String, dynamic> doc) {
    return MyUserEntity(
      id: doc['id'],
      bio: doc['bio'],
      name: doc['name'],
      email: doc['email'],
      username: doc['username'],
      profileImage: doc['profileImage'],
      backgroundImage: doc['backgroundImage'],
    );
  }
}
