import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sanu/ui/core/extensions/context_extension.dart';
import 'package:sanu/ui/message/bloc/message_cubit.dart';

class MessageListener extends BlocListener<MessageCubit, MessageState> {
  MessageListener({super.key})
      : super(
          listener: (context, state) {
            if (state.message != null) {
              ScaffoldMessenger.of(context).clearSnackBars();
              final message = state.message!;
              final snackBar = SnackBar(
                content: Text(message.title, style: const TextStyle(color: Colors.white)),
                backgroundColor: message.type.backgroundColor,
                duration: message.messageDuration.duration,
                behavior: SnackBarBehavior.floating,
                action: message.action != null
                    ? SnackBarAction(
                        textColor: Colors.white,
                        label: message.action!.title,
                        onPressed: () => message.action!.action(context),
                      )
                    : null,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar).closed.then((value) {
                if (context.mounted) context.clearMessage();
              });
            }
          },
        );
}
