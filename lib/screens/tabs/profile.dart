import 'package:arobaze/colors.dart';
import 'package:arobaze/utils/debug.dart';
import 'package:arobaze/widgets/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key, this.callback});
  final Function? callback;

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool switchValue = false;
  Color globalColor = AppColors.primary1;
  late Widget _topPart;

  Future<bool> getState() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('mainSwitchActivated') ?? false;
  }

  Future<void> writeState(bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('mainSwitchActivated', value);
  }

  Future<void> changeSwitch(bool value) async {
    await writeState(value);
    setState(() {
      
      globalColor = value ? AppColors.primary2 : AppColors.primary1;
      switchValue = value;
      _topPart = buildProfile(value);
    });
    await widget.callback!();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _topPart = const Column(children: []);

    getState().then((value) {
      setState(() {
        switchValue = value;
        _topPart = buildProfile(value);
      });
    });
  }


  Widget buildProfile(bool isSwitched) {
    print('switchValue: $isSwitched');

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ProfileBadge(
            showCompletion: true,
            person: createSelf(),
            isSwitched: isSwitched,
          )
        ),

        const SizedBox(height: 30),

        SvgPicture.asset(
          switchValue ? 'assets/images/placeholders/profile/daniel_positive.svg' : 'assets/images/placeholders/profile/daniel_negative.svg',
          semanticsLabel: 'Daniel',
          height: MediaQuery.of(context).size.width * 0.7,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [

        const SizedBox(height: 10),
        
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: _topPart,
        ),


        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Column(
            children: [
              Text('Devenir moi même', style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: switchValue ? AppColors.primary2 : AppColors.primary1, fontSize: 20)),
              SizedBox(
                width: 80,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Switch(
                    activeTrackColor: AppColors.secondary2,
                    inactiveTrackColor: AppColors.secondary1,
                    thumbColor: MaterialStateProperty.all(switchValue ? AppColors.primary2 : AppColors.primary1),
                    trackOutlineColor: MaterialStateProperty.all(AppColors.transparant),
                    value: switchValue,
                    onChanged: (value) {
                      changeSwitch(value);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),

      ],
    );
  }
}