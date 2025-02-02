part of 'message_cubit.dart';

class MessageState extends Equatable {
  const MessageState({this.message});

  final Message? message;

  @override
  List<Object?> get props => [message];

  MessageState copyWith({
    ValueGetter<Message?>? message,
  }) {
    return MessageState(
      message: message != null ? message() : this.message,
    );
  }
}
