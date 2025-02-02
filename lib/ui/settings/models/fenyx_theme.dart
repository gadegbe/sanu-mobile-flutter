import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fenyx_theme.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FenyxTheme extends Equatable {
  const FenyxTheme({
    required this.code,
    required this.name,
  });

  factory FenyxTheme.fromJson(Map<String, dynamic> json) => _$FenyxThemeFromJson(json);

  final String code;
  final String name;

  Map<String, dynamic> toJson() => _$FenyxThemeToJson(this);

  @override
  List<Object?> get props => [
        code,
        name,
      ];
}
