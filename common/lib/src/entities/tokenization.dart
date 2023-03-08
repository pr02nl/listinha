import 'package:result_dart/result_dart.dart';

import '../value_objects/value_object.dart';
import 'entity.dart';

class Tokenization extends Entity {
  final String accessToken;
  final String refreshToken;

  Tokenization({
    required this.accessToken,
    required this.refreshToken,
  });

  @override
  Validation validator([Object? _]) {
    return Success.unit();
  }
}
