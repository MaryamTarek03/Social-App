import 'package:connect_social_app/core/config/constants/numbers.dart';
import 'package:connect_social_app/data/models/post_model.dart';
import 'package:connect_social_app/logic/cubit/app_manager/app_manager_cubit.dart';
import 'package:connect_social_app/presentation/widgets/custom/common_text.dart';
import 'package:connect_social_app/presentation/widgets/custom/fit_container.dart';
import 'package:connect_social_app/presentation/widgets/custom/image_loading.dart';
import 'package:connect_social_app/presentation/widgets/post_mini_button.dart';
import 'package:connect_social_app/presentation/widgets/ui/post_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Post extends StatelessWidget {
  final PostModel post;
  const Post({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    bool imageExist = post.postImage != null;
    return BlocConsumer<AppManagerCubit, AppManagerState>(
      listener: (context, state) {},
      builder: (context, state) {
        return MyFitContainer(
          margin: 0,
          child: Column(
            children: [
              PostHeader(post: post, name: 'Dan Walker'),
              const SizedBox(height: 10),
              VibeText(
                maxLines: imageExist ? 3 : 10,
                text: post.body,
              ),
              const SizedBox(height: 10),
              Stack(
                alignment: Alignment.bottomRight,
                clipBehavior: Clip.none,
                children: [
                  if (post.postImage != null)
                    Container(
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Numbers.radiusMedium),
                      ),
                      child: Image.network(post.postImage!,
                          loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Container(
                          height: 150,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.background,
                            borderRadius:
                                BorderRadius.circular(Numbers.radiusMedium),
                          ),
                          child: ImageLoading(
                            loadingProgress: loadingProgress,
                          ),
                        );
                      }),
                    ),
                  Positioned(
                    bottom: post.postImage != null ? -25 : null,
                    right: post.postImage != null ? 5 : null,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      textDirection: TextDirection.ltr,
                      children: [
                        CircleButton(
                          icon: Icon(
                            Icons.link,
                            size: 15,
                          ),
                        ),
                        CircleButton(
                          icon: Icon(
                            Icons.chat_bubble_outline_rounded,
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
              Padding(
                padding: const EdgeInsets.only(top: Numbers.paddingLarge),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  textDirection: TextDirection.ltr,
                  children: [
                    PostMiniButton(
                      icon: const Icon(
                        Icons.favorite_border_rounded,
                      ),
                      text: post.likesNumber.toString(),
                      onPressed: () {},
                    ),
                    PostMiniButton(
                      icon: const Icon(
                        Icons.chat_bubble_outline_rounded,
                      ),
                      text: post.commentsNumber.toString(),
                      onPressed: () {},
                    ),
                    const Spacer(),
                    PostMiniButton(
                      icon: const Icon(
                        Icons.link_rounded,
                      ),
                      text: '2',
                      onPressed: () {},
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
