import 'package:flutter/material.dart';
import 'package:task_tuqaatech/utilities/global.dart';

class MessageHomeScreen extends StatefulWidget {
  const MessageHomeScreen({Key? key}) : super(key: key);

  @override
  State<MessageHomeScreen> createState() => _MessageHomeScreenState();
}

class _MessageHomeScreenState extends State<MessageHomeScreen> {
  Future<List<String>> getMessages() async {
    await Future.delayed(Duration(seconds: 3));
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return ListView.builder(itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  snapshot.data![index],
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              );
            });
          } else {
            return Center(
              child: Text(
                'oops!\r\nNo messages yet.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(color: Globals.orangeColor),
              ),
            );
          }
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      future: getMessages(),
    );
  }
}
