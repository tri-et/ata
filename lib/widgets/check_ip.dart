import 'package:ata/providers/ip_info_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckIP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Consumer<IpInfoNotifier>(
            builder: (_, notifier, __) {
              if (notifier.state == NotifierState.init)
                return Text('Read to load device IP');
              else if (notifier.state == NotifierState.loading)
                return CircularProgressIndicator();
              else {
                return notifier.ipInfo.fold(
                  (failure) => Text(failure.toString()),
                  (ipInfo) => Text(ipInfo.ipAddress),
                );
              }
            },
          ),
          RaisedButton.icon(
            label: Text('Get IP Address'),
            icon: Icon(Icons.refresh),
            onPressed: () => Provider.of<IpInfoNotifier>(
              context,
              listen: false,
            ).fetchDeviceIpInfo(),
          )
        ],
      ),
    );
  }
}