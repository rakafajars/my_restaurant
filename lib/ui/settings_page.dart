import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_restaurant/common/custom_dialog.dart';
import 'package:my_restaurant/provider/scheduling_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  static const String settingsTitle = 'Settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(settingsTitle),
      ),
      body: ListView(
        children: [
          Material(
            child: ListTile(
              title: Text('Scheduling News'),
              trailing: Consumer<SchedulingProvider>(
                builder: (context, scheduled, _) {
                  return Switch.adaptive(
                    value: scheduled.isScheduled,
                    onChanged: (value) async {
                      if (Platform.isIOS) {
                        customDialog(context);
                      } else {
                        scheduled.scheduledRestaurant(value);
                        print(scheduled.scheduledRestaurant(value));
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
