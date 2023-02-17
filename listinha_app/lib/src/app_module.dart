import 'package:flutter_modular/flutter_modular.dart';
import 'package:realm/realm.dart';

import 'configuration/configuration_page.dart';
import 'configuration/services/configuration_service.dart';
import 'home/home_module.dart';
import 'shared/services/realm/realm_config.dart';
import 'shared/stores/app_store.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.instance<Realm>(Realm(config)),
        Bind.factory<ConfigurationService>(
          (i) => ConfigurationServiceImpl(i()),
        ),
        Bind.singleton((i) => AppStore(i())),
      ];
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute(
          '/config',
          child: (context, args) => const ConfigurationPage(),
        ),
      ];
}
