// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:solid_software_test/flows/choose_image_screen/presentation/screens/choose_image_screen.dart'
    as _i1;

abstract class $AppRouter extends _i2.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    ChooseImageRoute.name: (routeData) {
      return _i2.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ChooseImageScreen(),
      );
    }
  };
}

/// generated route for
/// [_i1.ChooseImageScreen]
class ChooseImageRoute extends _i2.PageRouteInfo<void> {
  const ChooseImageRoute({List<_i2.PageRouteInfo>? children})
      : super(
          ChooseImageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChooseImageRoute';

  static const _i2.PageInfo<void> page = _i2.PageInfo<void>(name);
}
