import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:connect_social_app/presentation/widgets/common_text.dart';
import 'package:connect_social_app/presentation/widgets/fit_container.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    bool imageExist = true;
    return MyFitContainer(
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: const CircleAvatar(),
            title: CommonText(text: 'Name'),
            subtitle: CommonText(
              text: 'Username • 30-07-2024',
              fontSize: 12,
            ),
            trailing: const Icon(Icons.more_vert_rounded),
          ),
          const SizedBox(height: 10),
          CommonText(
            //! remove ignore
            // ignore: dead_code
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
                  height: MediaQuery.of(context).size.height * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Numbers.radiusMedium),
                    image: const DecorationImage(
                      image: AssetImage('assets/placeholder/image.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: imageExist ? -15 : null,
                right: imageExist ? 5 : null,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleButton(
                        icon: Icon(
                      Icons.chat_bubble_outline_rounded,
                      size: 15,
                    )),
                    CircleButton(
                        icon: Icon(
                      Icons.link,
                      size: 15,
                    )),
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
            padding: const EdgeInsets.fromLTRB(
              0,
              Numbers.paddingLarge,
              0,
              Numbers.paddingMedium,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(),
                const CircleAvatar(),
                const CircleAvatar(),
                const Spacer(),
                const Icon(Icons.favorite_border_rounded),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 10,
                  ),
                  child: CommonText(text: '3'),
                ),
                const Icon(Icons.link),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 10,
                  ),
                  child: CommonText(text: '98'),
                ),
                const Icon(Icons.chat_bubble_outline_rounded),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 5,
                    right: 10,
                  ),
                  child: CommonText(text: '12'),
                ),
              ],
            ),
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
        onPressed: () {},
        mini: isMini,
        shape: const CircleBorder(),
        child: icon,
      ),
    );
  }
}
