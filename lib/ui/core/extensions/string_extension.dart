import 'package:sanu/ui/core/extensions/object_extension.dart';

extension XString on String? {
  bool get isNullOrEmpty => isNull || this!.isEmpty;

  bool get isNotNullAndNotEmpty => !isNullOrEmpty;
}
