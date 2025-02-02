import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Message extends Equatable {
  const Message({
    required this.title,
    this.type = MessageType.neutral,
    this.messageDuration = MessageDuration.short,
    this.action,
  });

  final String title;
  final MessageType type;
  final MessageAction? action;
  final MessageDuration messageDuration;

  @override
  List<Object?> get props => [
        title,
        type,
        action,
        messageDuration,
      ];
}

enum MessageType {
  success,
  neutral,
  warning,
  error;

  Color get backgroundColor {
    switch (this) {
      case MessageType.success:
        return Colors.green.shade900;
      case MessageType.neutral:
        return Colors.grey.shade900;
      case MessageType.warning:
        return Colors.orange.shade900;
      case MessageType.error:
        return Colors.red.shade900;
    }
  }
}

enum MessageDuration {
  short,
  medium,
  long;

  Duration get duration {
    switch (this) {
      case MessageDuration.short:
        return const Duration(seconds: 4);
      case MessageDuration.medium:
        return const Duration(seconds: 7);
      case MessageDuration.long:
        return const Duration(seconds: 10);
    }
  }
}

class MessageAction {
  MessageAction({
    required this.title,
    required this.action,
  });

  final String title;
  final void Function(BuildContext context) action;
}
