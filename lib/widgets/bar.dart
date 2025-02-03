import 'package:arobaze/colors.dart';
import 'package:arobaze/person.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AtributeBarList extends StatelessWidget {
  const AtributeBarList({super.key, required this.atributes, required this.showSuperficial});
  final Atributes atributes;
  final bool showSuperficial;

  List<AtributeBar> get superficialAtributes {
    return atributes.superficial.entries.map((entry) {
      return AtributeBar(label: entry.key, percentage: entry.value.toDouble(), isSuperficial: showSuperficial);
    }).toList();
  }

  List<AtributeBar> get factualAtributes {
    return atributes.factual.entries.map((entry) {
      return AtributeBar(label: entry.key, percentage: entry.value.toDouble(), isSuperficial: showSuperficial);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showSuperficial) ...superficialAtributes,
        if (!showSuperficial) ...factualAtributes,
      ],
    );
  }
}


class AtributeBar extends StatefulWidget {
  const AtributeBar({super.key, required this.label, required this.percentage, required this.isSuperficial});
  final String label;
  final double percentage;
  final bool isSuperficial;

  @override
  State<AtributeBar> createState() => _AtributeBarState();
}

class _AtributeBarState extends State<AtributeBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.label, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.white)),
        //progress bar
        SizedBox(
          width: 190,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: widget.percentage / 100,
              backgroundColor: widget.isSuperficial ? AppColors.secondary1 : AppColors.secondary2,
              valueColor: AlwaysStoppedAnimation<Color>(widget.isSuperficial ? AppColors.primary1 : AppColors.primary2),
              minHeight: 14,
            ),
          ),
        ),
      ],
    );
  }
}