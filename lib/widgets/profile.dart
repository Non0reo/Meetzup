import 'package:arobaze/colors.dart';
import 'package:arobaze/person.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileBadge extends StatelessWidget {
  const ProfileBadge({super.key, required this.isSwitched, required this.person, this.showCompletion = false, this.scale = 1.0, this.badgeScale = 1.0});
  final bool isSwitched;
  final Person person;
  final bool showCompletion;
  final double scale;
  final double badgeScale;

  @override
  Widget build(BuildContext context) {
    double globalScale = scale;

    double boxSize = globalScale * 200;
    double circleSize = globalScale * 6.3;

    return Container(
      transformAlignment: Alignment.center,
      transform: Matrix4.identity()/* .scaled(globalScale /* * 1.2 */) */,
      /* height: boxSize,
      width: boxSize, */
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          Transform.scale(
            scale: 1,
            child: CircleAvatar(
              radius: boxSize / 2,
              backgroundImage: AssetImage(person.profilePicture),
            ),
          ),
          Transform(
            transform: Matrix4.rotationZ(-3.14).scaled(circleSize),
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              color: isSwitched ? AppColors.primary2 : AppColors.primary1,
              backgroundColor: AppColors.darkGray,
              value: person.pointCount / 100,
              strokeWidth: 1,
              strokeCap: StrokeCap.round,
            ),
          ),
      
          if(showCompletion) Positioned(
            bottom: -20,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.8),
                    blurRadius: 20,
                    offset: const Offset(0, -5),
                  )
                ],
                gradient: LinearGradient(colors: [isSwitched ? AppColors.primary2 : AppColors.primary1, AppColors.secondary1]),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text('6% complété', style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.white)),
            ),
          ),
      
          Visibility(
            visible: !isSwitched,
            child: Positioned(
              top: -10,
              right: -10,
              child: Container(
                transform: Matrix4.identity().scaled(badgeScale),
                transformAlignment: Alignment.topRight,
                alignment: Alignment.center,
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      isSwitched ? AppColors.primary2 : AppColors.primary1,
                      AppColors.secondary1
                    ]
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(person.pointCount.toString(), style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.white, fontSize: 28)),
                      Text("pts", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.white, fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}