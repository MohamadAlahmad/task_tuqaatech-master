import 'package:flutter/material.dart';
import 'package:task_tuqaatech/controller/controller.dart';
import 'package:task_tuqaatech/model/country.dart';
import 'package:task_tuqaatech/utilities/global.dart';

class CountryDialog extends StatelessWidget {
  const CountryDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(color: Colors.transparent,
      child: Center(
        child: Container(
          margin: const EdgeInsets.all(40),
          padding: const EdgeInsets.all(16),
          height: MediaQuery.of(context).size.width,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Globals.backgroundColor,
              border: Border.all(color: Globals.greyColor, width: 2),
              borderRadius: BorderRadius.circular(8)),
          child: FutureBuilder<List<Country>>(
              future: MyConnectionController.getCountries(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.pop(context, snapshot.data![index]);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              snapshot.data![index].name,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          color: Globals.greyColor,
                          height: 2,
                        );
                      },
                      itemCount: snapshot.data!.length);
                }
                if (snapshot.hasError) {
                  return Center(
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(snapshot.error.toString(),style: Theme.of(context).textTheme.titleMedium),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ),
    );
  }
}
