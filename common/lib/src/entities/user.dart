import 'package:common/src/value_objects/value_object.dart';

import '../value_objects/email_vo.dart';
import '../value_objects/text_vo.dart';
import '../value_objects/url_vo.dart';
import 'entity.dart';

class User extends Entity {
  final EmailVO email;
  final TextVO name;
  final TextVO lastName;
  final URLVO imageUrl;

  User({
    required this.email,
    required this.name,
    required this.lastName,
    required this.imageUrl,
  });

  @override
  Validation validator([Object? _]) {
    return email
        .validator() //
        .flatMap(name.validator)
        .flatMap(lastName.validator)
        .flatMap(imageUrl.validator);
  }
}
