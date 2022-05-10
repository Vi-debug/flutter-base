import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/base/extension/async_value_extension.dart';
import 'package:riverpod_example/features/home/controller/user_controller.dart';
import 'package:riverpod_example/features/home/models/user.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<User>> listUserAsyncValue =
        ref.watch(listUserProvider);

    ref.listen<AsyncValue<List<User>>>(
        listUserProvider, (e, state) => state.showSnackBarOnError(context));
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: const Text('Riverpod demo'),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: listUserAsyncValue.when(
                data: (listUser) => ListView.builder(
                  itemCount: listUser.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(listUser[index].gender),
                          const SizedBox(width: 20),
                          Text(listUser[index].email),
                        ],
                      ),
                    );
                  },
                ),
                error: (_, __) => null,
                loading: () => null,
              ),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  ref.read(listUserProvider.notifier).getAllUsers();
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                onPressed: () {
                  ref.read(listUserProvider.notifier).removeAllUser();
                },
                child: const Icon(Icons.restore_from_trash),
              )
            ],
          ),
        ),
        Visibility(
          visible: listUserAsyncValue.isLoading,
          child: Positioned.fill(
            child: Container(
              color: Colors.black26,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
