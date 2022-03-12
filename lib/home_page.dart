import 'package:flutter/material.dart';
import 'package:listview_builder/app_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = context.read<Counter>();
    final data = context.watch<Counter>();

    return Scaffold(
        appBar: AppBar(title: const Text('Beaking Bad'), toolbarHeight: 90),
        floatingActionButton: FloatingActionButton(
          onPressed: () => (!data.loading) ? provider.getData() : null,
          child: const Icon(Icons.autorenew),
        ),
        body: Consumer<Counter>(
          builder: (_, value, child) {
            return (data.loading)
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: value.characters.length,
                    itemBuilder: (context, index) {
                      final character = value.characters.elementAt(index);
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 8,
                        ),
                        onTap: () {},
                        title:
                            Text('${character.name} (${character.nickname})'),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(character.img),
                        ),
                        subtitle: Text('${character.occupation?.join(', ')}'),
                      );
                    },
                  );
          },
        ));
  }
}
