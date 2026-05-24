import 'package:core_app/app/modules/profile/controllers/profile_controller.dart';
import 'package:core_app/app/modules/profile/providers/profile_repository.dart';
import 'package:core_app/app/modules/profile/services/profile_service.dart';
import 'package:kitton/kitton.dart';

class ProfileModule extends KittonModule {
  @override
  void register() {
    bind(() => ProfileService(find<KittonApi>()));

    bind(() => ProfileProviders(find<ProfileService>()));

    bind(() => ProfileController(find<ProfileProviders>()));
  }
}