import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:connect_social_app/presentation/widgets/custom/common_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class OldPost extends StatelessWidget {
  const OldPost({super.key});

  @override
  Widget build(BuildContext context) {
    bool imageExist = true;
    return InkWell(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(Numbers.paddingMedium),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColorLight,
          borderRadius: BorderRadius.circular(Numbers.radiusMedium),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: const CircleAvatar(),
              title: VibeText(
                text: 'Name',
                fontWeight: FontWeight.bold,
              ),
              subtitle: VibeText(
                text: 'Username • 30-07-2024',
                fontSize: 12,
              ),
              trailing: const Icon(Icons.menu),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                Numbers.paddingMedium,
                0,
                Numbers.paddingMedium,
                Numbers.paddingMedium,
              ),
              child: VibeText(
                  //! remove ignore
                  // ignore: dead_code
                  maxLines: imageExist ? 3 : 10,
                  text:
                      'Post BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost BodyPost Body'),
            ),
            Visibility(
              visible: imageExist,
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('lib/assets/images/a-cup-of-coffee.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(Numbers.paddingMedium),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const FaIcon(FontAwesomeIcons.heart),
                  const SizedBox(width: 15),
                  InkWell(
                    onTap: () => onCommentTap(context),
                    child: const FaIcon(FontAwesomeIcons.comment),
                  ),
                  const Spacer(),
                  const FaIcon(FontAwesomeIcons.bookmark),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> onCommentTap(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      isScrollControlled: true,
      useSafeArea: true,
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      builder: (_) {
        return DraggableScrollableSheet(
          expand: true,
          initialChildSize: 1,
          maxChildSize: 1,
          builder: (_, controller) {
            return Scaffold(
              body: ListView.builder(
                controller: controller, // set this too
                itemBuilder: (_, i) => ListTile(
                  title: Text('Comment $i'),
                ),
              ),
              bottomNavigationBar: const SizedBox(
                height: 80,
                child: Padding(
                  padding: EdgeInsets.all(Numbers.paddingMedium),
                  child: Row(
                    children: [
                      CommentTextField(),
                      Padding(
                        padding: EdgeInsets.all(Numbers.paddingMedium),
                        child: FaIcon(FontAwesomeIcons.paperPlane),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class CommentTextField extends StatelessWidget {
  const CommentTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          contentPadding: const EdgeInsets.all(Numbers.paddingMedium),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Numbers.radiusMedium),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Numbers.radiusMedium),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColorDark,
            ),
          ),
          hintText: 'Reply',
          hintStyle: GoogleFonts.tajawal(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
