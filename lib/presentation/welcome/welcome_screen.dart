import 'package:flutter/material.dart';
import 'package:native_bloc_task/presentation/device_info/device_info_screen.dart';
import 'package:native_bloc_task/presentation/posts/posts_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (BuildContext context) => Posts()),
                );
              },
              child: Text('Ke halaman Post'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => DeviceInfoScreen(),
                  ),
                );
              },
              child: Text('Ke halaman Device Info'),
            ),
          ],
        ),
      ),
    );
  }
}
