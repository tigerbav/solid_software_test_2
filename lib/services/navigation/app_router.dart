import 'package:auto_route/auto_route.dart';
import 'package:solid_software_test/services/navigation/app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(initial: true, page: ChooseImageRoute.page),
      ];
}
