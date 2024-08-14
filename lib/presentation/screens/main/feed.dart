import 'package:connect_social_app/config/constants/numbers.dart';
import 'package:connect_social_app/data/models/post_model.dart';
import 'package:connect_social_app/presentation/screens/post_page.dart';
import 'package:connect_social_app/presentation/widgets/custom/post.dart';
import 'package:flutter/material.dart';
import 'dart:math';

List months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];

List randomImages = [
  null,
  'https://runeterraccg.com/wp-content/uploads/Kaisa-2.jpg',
  'https://i.redd.it/coven-kaisa-concept-and-splash-by-v0-c9ijixlwopnc1.jpg?width=1920&format=pjpg&auto=webp&s=3d92c49dd7a42c493bc52485228251183be324cc',
  'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Kaisa_40.jpg',
  'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Camille_21.jpg',
  'https://ddragon.leagueoflegends.com/cdn/img/champion/splash/Camille_11.jpg',
  'https://pbs.twimg.com/media/GArUNrDXMAAbt0d.jpg:large',
  'https://cdna.artstation.com/p/assets/images/images/073/668/956/large/shaoming-luo-2.jpg?1710205450',
  'https://turbosmurfs.gg/storage/splash/Senna_10.jpg',
  'https://thebackdashadmin.com/wp-content/uploads/2024/02/Best-Leona-Build-guide.jpg',
  'https://images7.alphacoders.com/123/1233639.jpg',
  'https://gdm-assets.b-cdn.net/images/ncavvykf/realsport-production/a447a7075b15424e6e2991fb4d921a64bc742aa9-4096x2304.jpg?rect=0,77,4096,2150&w=1200&h=630&auto=format',
];

List<String> randomText = [
 'hair industrial get pride red movie adjective mainly adult given include flew electric strike begun angry plus bring top property variety rule camera apple',
 'heat cat slowly morning neighbor round quite cry leader needle birth though harbor nothing old outer outside cage improve shinning but eaten call population',
 'simplest hour way lonely bank broke married trip ground rice learn rocket seeing tea unusual brought large highway importance flight satisfied ordinary neck however',
 'contain border twice men driving so harbor again wooden deeply composed coast smallest dirty tape church mirror spread push lead produce paid characteristic free',
 'cow passage trick serve cotton bottle stand century development chain view tight feathers wooden lead giant letter lesson settlers aware carefully variety picture page',
 'forget column planet lift learn automobile hard statement effort principle table steep ready total habit student putting grain fruit cool pile direction movement occur',
 'pictured cup few gate skin fence smell zero boat plane sale motion pine mean plan line busy thou grew forth late strip send round',
 'school area railroad bank spite hot desk branch deep universe jet as move call note combination printed been street putting national sound series cheese',
 'atomic passage rest within ear sat trade operation per position fresh decide basis create effect getting are white like car constantly till driven fox',
 'without hold vast method replied numeral salmon myself spin industrial sheep underline physical wherever waste discover new short gulf sat constantly example shallow frame',
 'learn shine cream trade fuel fair brick same chest will sheep minute road shop be think begun yellow strip doctor safety being courage gas',
 'minute wait quarter copper busy almost outline swimming difficulty southern apart society trap receive flight fellow job mood general chamber whenever blow rope shadow',
 'leg mighty scared plain explain bee passage mail citizen science pilot replace frequently whom whether wire hill strength dangerous pile age halfway find pine',
 'five health old from anybody depend cabin built supper powder ruler system audience younger nine book likely break mountain sale building gravity drink body',
 'grade leaving sure bow know period reason as characteristic think wood forty southern valuable whole underline began heard industrial stream continent soil shop view',
 'dead tobacco inch thus mental had suddenly into consider pet bottom public ball firm object promised locate whole easily want hearing smell laugh notice',
 'dozen element character neighbor larger farther sang vote molecular love steady ocean sets both wish knife free blew nails settlers found ourselves clean either',
 'molecular judge suggest progress nature toy into my foot anyway clear proper place bank favorite hope nobody suit wore name coat mine highway tide',
 'leave pilot certain engine replied contain struck sheet birthday skill needs none blow thread that wall golden lips television speech angry failed cowboy poem',
 'slept strange deep laugh teeth himself fed kind bent modern military national price little will fill sound wheel among seat climb standard bread stiff',
];

// Random Post Bodies and Numbers
PostModel generateRandomPost() {
  final random = Random();
  DateTime randomDate = DateTime.now().subtract(
    Duration(
      days: random.nextInt(365),
      hours: random.nextInt(24),
      minutes: random.nextInt(60),
    ),
  );
  String time = (randomDate.hour % 12 == randomDate.hour) ? 'AM' : 'PM';
  String date =
      'On ${randomDate.day} ${months[randomDate.month - 1]} ${randomDate.year} • ${randomDate.hour % 12}:${randomDate.minute} $time';
  return PostModel(
    postID: random.nextInt(1000),
    userID: random.nextInt(100),
    likesNumber: random.nextInt(1000),
    commentsNumber: random.nextInt(1000),
    postImage: randomImages[random.nextInt(randomImages.length)],
    body:
        '${randomText[random.nextInt(randomText.length)]}\n هذا محتوي عشوائي للمنشور',
    date: date,
  );
}

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        PostModel randomPost = generateRandomPost();
        return Padding(
          padding: const EdgeInsets.only(top: Numbers.paddingLarge),
          child: InkWell(
            borderRadius: BorderRadius.circular(Numbers.radiusMedium),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CommentScreen(
                  post: randomPost,
                ),
              ),
            ),
            child: Post(
              post: randomPost,
            ),
          ),
        );
      },
      itemCount: 20,
    );
  }
}
