import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:okoul/providers/theme_provider.dart';
import 'package:okoul/router/router_provider.dart';
import 'package:okoul/utils/language_util.dart';
import 'package:okoul/utils/theme_util.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var _router = ref.read(routerProvider);
    final currentTheme = ref.watch(themeProvider);
    final language = ref.watch(lang);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''), // English, no country code
        Locale('ar', ''), // arabic, no country code
      ],
      locale: language,
      title: 'Flutter Demo',
      routerConfig: _router,
      darkTheme: AppTheme.darkTheme,
      themeMode: currentTheme.maybeWhen(
          light: () => ThemeMode.light,
          dark: () => ThemeMode.dark,
          orElse: () => ThemeMode.system),
      // home: const AppScaffold(),
      // home: const MyHomePage(),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({
//     super.key,
//   });

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: BottomNavyBar(
//         onItemSelected: (item) {
//           print(item);
//         },
//         items: [
//           BottomNavyModel(
//             index: 0,
//             title: '',
//             icon: Icon(
//               Iconsax.home,
//               color: Theme.of(context).primaryColor,
//             ),
//           ),
//           BottomNavyModel(
//             index: 1,
//             title: '',
//             icon: Icon(
//               Iconsax.heart,
//               color: Theme.of(context).primaryColor,
//             ),
//           ),
//           BottomNavyModel(
//             index: 1,
//             title: '',
//             icon: Icon(
//               Iconsax.category_2,
//               color: Theme.of(context).primaryColor,
//             ),
//           ),
//           BottomNavyModel(
//             index: 1,
//             title: '',
//             icon: Icon(
//               Iconsax.discount_shape,
//               color: Theme.of(context).primaryColor,
//             ),
//           ),
//         ],
//       ),

//       floatingActionButton: FloatingActionButton(
//         shape: CircleBorder(),
//         onPressed: () {
//           print('hi');
//         },
//         tooltip: 'Increment',
//         child: const Icon(Iconsax.bag_2),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// class AppBarButton extends StatelessWidget {
//   const AppBarButton({
//     Key? key,
//     this.onPressed,
//     this.child,
//     // required this.size ,
//   }) : super(key: key);
//   final VoidCallback? onPressed;
//   final Widget? child;
//   // final Size size;

//   @override
//   Widget build(BuildContext context) {
//     return RawMaterialButton(
//       fillColor: Theme.of(context).primaryColor,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//       constraints: BoxConstraints(minWidth: 45.0, minHeight: 45.0),
//       onPressed: () {},
//       child: Container(
//         decoration: BoxDecoration(
//             // color: Theme.of(context).primaryColor,
//             borderRadius: BorderRadius.circular(16)),
//         width: 55,
//         height: 55,
//         child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: child,
//         ),
//       ),
//     );
//   }
// }
