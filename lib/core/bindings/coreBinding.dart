import 'package:core_app/core/auth/session.dart';
import 'package:core_app/core/getx/storage.dart';
import 'package:core_app/core/https/http_service.dart';
import 'package:kitton/kitton.dart';


class CoreBindings extends KittonRegister {
   @override
  @override
  void register() {
    keep(StorageService());

    keep(HttpService(find<StorageService>()));

    keep(KittonApi(find<HttpService>().client));

    keep(Session(find<StorageService>()));
  }
}