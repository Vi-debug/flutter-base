import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/base/extension/widget_ref_extension.dart';

import '../../../../base/widgets/custom_loading.dart';
import '../../../../base/extension/async_value_extension.dart';
import '../../controller/user_controller.dart';
import '../../models/user/user.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<User>> listUserAsyncValue =
        ref.watch(listUserProvider);

    ref.listenAsyncValue<AsyncValue<List<User>>>(
      listUserProvider,
      context,
      onFinishLoading: (prev, next) {
        // implement action after finish loading here. Ex: show dialoag
      },
    );
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(title),
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
                heroTag: 'add',
                onPressed: () {
                  ref.read(listUserProvider.notifier).getAllUsers();
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                heroTag: 'remove',
                onPressed: () {
                  ref.read(listUserProvider.notifier).removeAllUser();
                },
                child: const Icon(Icons.restore_from_trash),
              )
            ],
          ),
        ),
        Loading(visible: listUserAsyncValue.isLoading),
      ],
    );
  }
}
