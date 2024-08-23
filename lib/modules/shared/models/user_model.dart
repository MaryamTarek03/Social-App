import 'package:connect_social_app/modules/shared/entities/user_entity.dart';

class MyUser extends MyUserEntity {
  MyUser({
    required super.id,
    required super.name,
    required super.username,
    required super.bio,
    required super.email,
    required super.profileImage,
    required super.backgroundImage,
  });

  // final String id;
  // final String name;
  // final String username;
  // final String bio;
  // final String email;
  // final String profileImage;
  // final String backgroundImage;

  // MyUserEntity toEntity() {
  //   return MyUserEntity(
  //     id: id,
  //     name: name,
  //     username: username,
  //     bio: bio,
  //     email: email,
  //     profileImage: profileImage,
  //     backgroundImage: backgroundImage,
  //   );
  // }

  // factory MyUser.fromEntity(MyUserEntity entity) {
  //   return MyUser(
  //     id: entity.id,
  //     name: entity.name,
  //     username: entity.username,
  //     bio: entity.bio,
  //     email: entity.email,
  //     profileImage: entity.profileImage,
  //     backgroundImage: entity.backgroundImage,
  //   );
  // }
}
