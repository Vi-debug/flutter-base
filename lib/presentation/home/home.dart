import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:riverpod_example/base/theme/theme_controller.dart';

import '../../base/widgets/component/loading.dart';
import '../../controller/home_controller.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                const Text('hello').tr(),
                Text(' ' + title, style: Theme.of(context).textTheme.headlineSmall,),
              ],
            ),
            actions: [
              Consumer<ThemeController>(
                builder: (context, themeController, _) {
                  return Switch(value: themeController.themeMode == ThemeMode.dark, onChanged: (value) {
                    Provider.of<ThemeController>(context, listen: false).toggleTheme(value);
                  });
                }
              )
            ],
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Consumer<HomeController>(
                builder: (_, data, child) => ListView.builder(
                  itemCount: data.listUser.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(data.listUser[index].gender),
                          const SizedBox(width: 20),
                          Text(data.listUser[index].email),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'add',
                onPressed: () {
                  getController(context).getAllUsers(context);
                },
                child: const Icon(Icons.add),
              ),
              FloatingActionButton(
                heroTag: 'remove',
                onPressed: () {
                  getController(context).removeAllUser();
                },
                child: const Icon(Icons.restore_from_trash),
              )
            ],
          ),
        ),
        Consumer<HomeController>(
          builder: (_, data, child) => Loading(visible: data.isLoading),
        )
      ],
    );
  }

  HomeController getController(BuildContext context) {
    return Provider.of<HomeController>(context, listen: false);
  }
}
