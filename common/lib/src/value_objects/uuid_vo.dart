import 'package:result_dart/result_dart.dart';
import 'package:string_validator/string_validator.dart' as string_validator;

import 'value_object.dart';

class UuidVO extends ValueObject<String> {
  const UuidVO(super.value);

  @override
  Validation validator([Object? obj]) {
    if (!string_validator.isUUID(value)) {
      return 'Uuid inválido'.toFailure();
    }

    return Success.unit();
  }
}
