import 'package:connect_social_app/modules/shared/entities/user_entity.dart';

class MyUser {
  final String id;
  final String name;
  final String username;
  final String bio;
  final String email;
  final String profileImage;
  final String backgroundImage;

  MyUser({
    required this.id,
    required this.name,
    required this.username,
    required this.bio,
    required this.email,
    required this.profileImage,
    required this.backgroundImage,
  });

  // static final empty = MyUser(
	// 	userId: '', 
	// 	email: '', 
	// 	name: '',
  //   hasActiveCart: false,
	// );

  MyUserEntity toEntity() {
    return MyUserEntity(
      id: id,
      name: name,
      username: username,
      bio: bio,
      email: email,
      profileImage: profileImage,
      backgroundImage: backgroundImage,
    );
  }
}
