import 'package:flutter/material.dart';

import '../../domain/crowdaction/participant.dart';

class ParticipantAvatars extends StatelessWidget {
  final List<Participant> participants;

  const ParticipantAvatars({
    Key? key,
    required this.participants,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: participants
          .take(3)
          .toList()
          .asMap()
          .entries
          .map((participant) =>
              _createAvatar(participant.value, participant.key))
          .toList(),
    );
  }

  Align _createAvatar(Participant participant, int index) {
    return Align(
      alignment: _getIndexAlignment(index),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.grey[300],
          backgroundImage: NetworkImage(
              participant.photo ?? ""), // Provide your custom image
        ),
      ),
    );
  }

  Alignment _getIndexAlignment(int index) {
    switch (index) {
      case 0:
        return Alignment.centerLeft;
      case 1:
        return Alignment.center;
      default:
        return Alignment.centerRight;
    }
  }
}
