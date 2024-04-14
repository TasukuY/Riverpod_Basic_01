import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
Followed a Riverpod tutorial by ルビーDog #9 Fluuter入門講座 riverpod編
Link: https://youtu.be/w2xo2FjDUNQ?si=3uxZTleP13FOF0hK
*/

void main() {
  //　アプリ
  const app = MaterialApp(home: Sample());
  // プロバイダースコープで囲む
  const scope = ProviderScope(child: app);
  // アプリケーションの起動
  runApp(scope);
}

final nicknameProvider = StateProvider<String>((ref) {
  //　変化するデータ
  return 'Ruby Dog';
});

class Sample extends ConsumerWidget {
  const Sample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // データをwatchしておく
    final nickname = ref.watch(nicknameProvider);

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(nickname),
            ElevatedButton(
                onPressed: () => tapCat(ref), child: const Text('Cat')),
            ElevatedButton(
                onPressed: () => tapBird(ref), child: const Text('Bird')),
            ElevatedButton(
                onPressed: () => tapFish(ref), child: const Text('Fish')),
          ],
        ),
      ),
    );
  }

  tapCat(WidgetRef ref) {
    final notifier = ref.read(nicknameProvider.notifier);
    notifier.state = 'Ruby Cat';
  }

  tapBird(WidgetRef ref) {
    final notifier = ref.read(nicknameProvider.notifier);
    notifier.state = 'Ruby Bird';
  }

  tapFish(WidgetRef ref) {
    final notifier = ref.read(nicknameProvider.notifier);
    notifier.state = 'Ruby Fish';
  }
}
