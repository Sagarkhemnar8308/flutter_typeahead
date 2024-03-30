import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:flutter_typehead/stateservices.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_gen/gen_l10n/';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final searchController = TextEditingController();
  String? userSelected;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        Locale('en'),
        Locale('mr'),
        Locale('hi')
      ],
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 40,
              child: TypeAheadField(
                emptyBuilder: (context) {
                  return const SizedBox(
                    child: Center(
                      child: Text('No item Found'),
                    ),
                  );
                },
                itemBuilder: (context, String suggestion) {
                  return Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const Icon(Icons.refresh),
                      const SizedBox(
                        width: 10,
                      ),
                       Flexible(
                          child: Text(
                        suggestion,
                      ))
                    ],
                  );
                },
                onSelected: (value) {
                  setState(() {
                    userSelected=value;
                  });
                },
                suggestionsCallback: (search) {
                  return Stateservices.getSuggesitions(search);
                },
              ),
            ),
            Center(
              child: Text(userSelected ?? "Data"),
            )
          ],
        ),
      ),
    );
  }
}
