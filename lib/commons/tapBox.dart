// Flutter code sample for RaisedButton

// This sample shows how to render a disabled RaisedButton, an enabled RaisedButton
// and lastly a RaisedButton with gradient background.
//
// ![Three raised buttons, one enabled, another disabled, and the last one
// styled with a blue gradient background](https://flutter.github.io/assets-for-api-docs/assets/material/raised_button.png)

import 'package:flutter/material.dart';
import 'package:meau/models/ConsentAcess.dart';
import 'package:meau/models/Credential.dart';
import 'package:meau/services/accounts/consentmentCreationAcess.dart';
import 'package:meau/services/accounts/consentment_creation.dart';

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  Future<Credential> futureCredential;
  Future<ConsentAcess> futureConsentAcess;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 30),
          RaisedButton(
            onPressed: () {
              futureCredential = fetchCredential('1');
              futureCredential.then((value) => {
                    debugPrint('teste' + value.accessToken),
                    futureConsentAcess = fetchConsentAcess(value),
                    futureConsentAcess.then((v) => {
                          debugPrint('teste' + v.permissions.toString()),
                        })
                  });
            },
            child: const Text('Enabled Button', style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
