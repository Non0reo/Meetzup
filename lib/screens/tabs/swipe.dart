import 'package:arobaze/colors.dart';
import 'package:arobaze/person.dart';
import 'package:arobaze/utils/cache.dart';
import 'package:arobaze/utils/debug.dart';
import 'package:arobaze/widgets/profile.dart';
import 'package:arobaze/widgets/swipe_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwipeTab extends StatefulWidget {
  const SwipeTab({super.key});

  @override
  State<SwipeTab> createState() => _SwipeTabState();
}

class _SwipeTabState extends State<SwipeTab> {  

  List<Person> cardsData = getListOfPeople();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);

    /* cards = [
      SwipeCard(person: createPerson()..name = 'Antoine'),
      SwipeCard(person: createPerson()..name = 'Romain'),
      SwipeCard(person: createPerson()..name = 'Rayan'),
    ]; */
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getGlobalState(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return CardSwiper(
            allowedSwipeDirection: const AllowedSwipeDirection.only(left: true, right: true),
            padding: EdgeInsets.zero,
            onSwipe: (previousIndex, currentIndex, direction) async {
              if(direction == CardSwiperDirection.right) {
                Future.delayed(const Duration(milliseconds: 1000)).then((value) async {
                  await showMatchDialog(context, snapshot.data!, cardsData[previousIndex]);
                });
              }
              return true;
            },
            cardsCount: cardsData.length,
            cardBuilder: (context, index, percentThresholdX, percentThresholdY) => SwipeCard(person: cardsData[index], mainSwitchToggled: snapshot.data!),
          );
        } else {
          return const CircularProgressIndicator();
        }
      }
    );
  }
}

/* bool _onSwipe(
  int previousIndex,
  int? currentIndex,
  CardSwiperDirection direction,
  BuildContext context,
  bool mainSwitchToggled,
) {
  debugPrint(
    'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
  );
  if(direction == CardSwiperDirection.right) showMatchDialog(context, mainSwitchToggled, cardsData[currentIndex!]);
  return true;
} */


Future<void> showMatchDialog(BuildContext context, bool mainSwitchToggled, Person matchedProfile) async {
  var color = await getGlobalColor();

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: RichText(
          text: TextSpan(
            text: 'Vous avez match amicalement avec ',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.white),
            children: [
              TextSpan(
                text: matchedProfile.name,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color),
              ),
              TextSpan(text: mainSwitchToggled ? ' !' : ' ! Cependant...', style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        content: !mainSwitchToggled ? 
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ProfileBadge(
                  scale: 0.5,
                  badgeScale: 0.8,
                  person: createSelf(),
                  isSwitched: mainSwitchToggled,
                ),
                Text('<', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.white, fontSize: 30)),
                ProfileBadge(
                  scale: 0.5,
                  badgeScale: 0.8,
                  person: matchedProfile,
                  isSwitched: mainSwitchToggled,
                )
              ],
            ),
            const SizedBox(height: 30),
            RichText(
              text: TextSpan(
                text: 'Vous êtes moins populaire ${matchedProfile.name.startsWith(RegExp('^[aeiouAEIOU]')) ? 'qu\'' : 'que '}',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.white, fontWeight: FontWeight.w300, fontSize: 15),
                children: [
                  TextSpan(
                    text: matchedProfile.name,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: color, fontSize: 15),
                  ),
                  const TextSpan(text: '. Changez votre personnalité pour dépasser celle de votre match afin de pouvoir discuter avec eux.', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
                ],
              ),
            ),
            
          ],
        )
        : Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  const TextSpan(text: 'Vous pourrez désormais parler avec eux directement dans l\'onglet', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
                  const TextSpan(text: ' Messages ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const TextSpan(text: 'de Meetzup !', style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15)),
                ],
              ),
            ),
          ],
        )
        
        ,
        backgroundColor: AppColors.black,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
  
}