import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:connect_social_app/logic/cubit/app_manager_cubit.dart';
import 'package:connect_social_app/presentation/widgets/common_text.dart';
import 'package:connect_social_app/presentation/widgets/fit_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    bool imageExist = true;
    return BlocConsumer<AppManagerCubit, AppManagerState>(
      listener: (context, state) {},
      builder: (context, state) {
        AppManagerCubit appManager = AppManagerCubit.get(context);
        return MyFitContainer(
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.all(0),
                leading: const CircleAvatar(),
                title: CommonText(text: 'Name'),
                subtitle: CommonText(
                  text: 'August 30 2024 • 01:37 PM',
                  fontSize: 12,
                ),
                trailing: const Icon(Icons.more_vert_rounded),
              ),
              const SizedBox(height: 10),
              CommonText(
                maxLines: imageExist ? 3 : 10,
                text: 'Post Body ' * 150,
              ),
              const SizedBox(height: 10),
              Stack(
                alignment: Alignment.bottomRight,
                clipBehavior: Clip.none,
                children: [
                  Visibility(
                    visible: imageExist,
                    child: Container(
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Numbers.radiusMedium),
                      ),
                      child: Image.asset('assets/placeholder/image.png'),
                    ),
                  ),
                  Positioned(
                    bottom: imageExist ? -25 : null,
                    right: imageExist ? 5 : null,
                    left: appManager.language == const Locale('ar') ? 0 : null,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleButton(
                          icon: Icon(
                            Icons.chat_bubble_outline_rounded,
                            size: 15,
                          ),
                        ),
                        CircleButton(
                          icon: Icon(
                            Icons.link,
                            size: 15,
                          ),
                        ),
                        CircleButton(
                          icon: Icon(
                            Icons.favorite_border_rounded,
                            size: 15,
                          ),
                          isMini: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(
                  0,
                  Numbers.paddingLarge,
                  0,
                  Numbers.paddingMedium,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(),
                    CircleAvatar(),
                    CircleAvatar(),
                    Spacer(),
                    PostMiniButton(
                      icon: Icon(
                        Icons.favorite_border_rounded,
                      ),
                      text: '10',
                    ),
                    PostMiniButton(
                      icon: Icon(
                        Icons.link_rounded,
                      ),
                      text: '2',
                    ),
                    PostMiniButton(
                      icon: Icon(
                        Icons.chat_bubble_outline_rounded,
                      ),
                      text: '7',
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class PostMiniButton extends StatelessWidget {
  final Widget icon;
  final String text;
  const PostMiniButton({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
        shadowColor: const MaterialStatePropertyAll(Colors.transparent),
        elevation: const MaterialStatePropertyAll(0),
        iconColor: MaterialStatePropertyAll(
            Theme.of(context).colorScheme.outlineVariant),
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: 5),
          CommonText(
            text: text,
            color: Theme.of(context).colorScheme.outlineVariant,
          ),
        ],
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final Widget icon;

  final bool isMini;

  const CircleButton({
    super.key,
    required this.icon,
    this.isMini = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Numbers.paddingSmall),
      child: FloatingActionButton(
        heroTag: null,
        onPressed: () {},
        foregroundColor: Colors.white,
        mini: isMini,
        shape: const CircleBorder(),
        child: icon,
      ),
    );
  }
}
