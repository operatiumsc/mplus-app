import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PurchaseOrderStatusIcon extends StatelessWidget {
  final int? _status;
  const PurchaseOrderStatusIcon({super.key, int? status}) : _status = status;

  @override
  Widget build(BuildContext context) {
    switch (_status) {
      case 0:
        return const Icon(
          FontAwesomeIcons.circleQuestion,
          color: Colors.blue,
        );
      case 1:
        return const Icon(
          FontAwesomeIcons.circleExclamation,
          color: Colors.amber,
        );
      case 2:
        return const Icon(
          FontAwesomeIcons.circleCheck,
          color: Colors.lightGreen,
        );
      case 3:
        return const Icon(
          FontAwesomeIcons.clock,
          color: Colors.amber,
        );
      case 4:
        return const Icon(
          FontAwesomeIcons.circleCheck,
          color: Colors.lightGreen,
        );
      case 5:
        return const Icon(
          FontAwesomeIcons.circleXmark,
          color: Colors.grey,
        );
      case 6:
        return const Icon(
          FontAwesomeIcons.circlePause,
          color: Colors.red,
        );
      case 7:
        return const Icon(
          FontAwesomeIcons.clock,
          color: Colors.orange,
        );
      case 8:
        return const Icon(
          FontAwesomeIcons.circleArrowUp,
          color: Colors.blue,
        );
      default:
        return const SizedBox();
    }
  }
}