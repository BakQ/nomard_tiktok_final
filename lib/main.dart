import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nomard_tiktok_final/firebase_options.dart';
import 'package:nomard_tiktok_final/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // ✅ Flutter 엔진과 위젯 바인딩 초기화

//firebase 연결하기
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: TikTokFinalApp()));
}

class TikTokFinalApp extends ConsumerWidget {
  const TikTokFinalApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routerConfig: router,
      title: 'Flutter Final Project',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
    );
  }
}
