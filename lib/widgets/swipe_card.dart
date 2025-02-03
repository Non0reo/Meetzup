import 'dart:ui';

import 'package:arobaze/colors.dart';
import 'package:arobaze/person.dart';
import 'package:arobaze/widgets/bar.dart';
import 'package:arobaze/widgets/text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SwipeCard extends StatefulWidget {
  const SwipeCard({super.key, required this.person, required this.mainSwitchToggled});
  final Person person;
  final bool mainSwitchToggled;

  static const List<double> gradientStops = [0.4, 1.0];
  static const double carouselCardSize = 550.0;

  @override
  State<SwipeCard> createState() => _SwipeCardState();
}

class _SwipeCardState extends State<SwipeCard> {
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _currentImage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_currentImage = 0;
    //if(_carouselController.ready) _carouselController.jumpToPage(1);
    
  }

  //get the i image from the person.images list
  Builder buildCarousel(BuildContext context, int i, Person person) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 0),
          decoration: BoxDecoration(
            color: AppColors.black,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            fit: StackFit.expand,
            children: [
              Image.asset(
                person.images[i],
                fit: BoxFit.cover,
              ),
              ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.black, Colors.black.withOpacity(0)],
                        stops: SwipeCard.gradientStops).createShader(rect);
                  },
                  blendMode: BlendMode.dstOut,
                  child: Image.asset(
                      person.images[i],
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter),
                )
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //print('building card for ${widget.person.name}, _currentImage: $_currentImage');

    return Container(
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          

          Stack(
            alignment: Alignment.topCenter,
            children: [                   

              Stack(
                alignment: Alignment.centerLeft,
                fit: StackFit.loose,
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      viewportFraction: 1.0,
                      height: SwipeCard.carouselCardSize,
                      scrollDirection: Axis.vertical,
                      onPageChanged: (index, reason) {
                      setState(() {
                        _currentImage = index;
                      });
                    }),
                    carouselController: _carouselController,
                    items: [
                      for (int i = 0; i < widget.person.images.length; i++)
                        buildCarousel(context, i, widget.person),
                    ],
                  ),

                  //carousel dots
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: widget.person.images.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _carouselController.animateToPage(entry.key),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentImage == entry.key
                                    ? AppColors.white
                                    : AppColors.gray),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),

              
              Positioned(
                top: 50,
                child: Text(
                  '@${widget.person.username}',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.white, fontSize: 30, shadows: [const Shadow(color: Color.fromARGB(101, 18, 19, 15), offset: Offset(0, 5), blurRadius: 20)]),
                ),
              ),

              
              //gradient
              IgnorePointer(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [AppColors.transparant, AppColors.black],
                      stops: [0, SwipeCard.carouselCardSize / 830],
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //name, age
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: widget.mainSwitchToggled ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${widget.person.name}, ${widget.person.age}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            widget.person.description,
                            style: Theme.of(context).textTheme.bodySmall,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 2,
                            textAlign:  widget.mainSwitchToggled ? TextAlign.center : TextAlign.left,
                          ),
                        ],
                      ),
                    ),
                    
                    if(!widget.mainSwitchToggled) Expanded(
                      flex: 0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CairoText(text: widget.person.pointCount.toString(), style: Theme.of(context).textTheme.bodyLarge),
                          const SizedBox(width: 5),
                          CairoText(text: 'pts', style: Theme.of(context).textTheme.bodyMedium!.copyWith(height: 3, color: AppColors.primary1)),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: AtributeBarList(atributes: widget.person.atributes, showSuperficial: !widget.mainSwitchToggled),
                ),

                const SizedBox(height: 30),
            
                SizedBox(
                  width: 250,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.close_outlined, color: AppColors.darkGray, size: 25),
                      Row(
                        children: [
                          const Icon(Icons.chevron_left_rounded, color: AppColors.gray, size: 25),
                          Text('Swipe', style: Theme.of(context).textTheme.bodySmall),
                          const Icon(Icons.chevron_right_rounded, color: AppColors.gray, size: 25),
                        ],
                      ),
                      const Icon(Icons.favorite_border_outlined, color: AppColors.red, size: 25),
                    ],
                  ),
                )
            
              ],
            ),
          ),
        ],
      )
    );
  }
}