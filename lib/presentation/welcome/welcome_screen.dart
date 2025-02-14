import 'package:flutter/material.dart';
import 'package:native_bloc_task/presentation/device_info/device_info_screen.dart';
import 'package:native_bloc_task/presentation/posts/posts_screen.dart';
import 'package:native_bloc_task/presentation/widgets/animated_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.lightBlue,
              margin: EdgeInsets.all(20),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  textAlign: TextAlign.center,
                  'Welcome to Native Bloc Task',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (BuildContext context) => DeviceInfoScreen(),
                //       ),
                //     );
                //   },
                //   child: Text('Device Info Page'),
                // ),
                // SizedBox(width: 40),
                // ElevatedButton(
                //   onPressed: () {
                //     Navigator.of(context).push(
                //       MaterialPageRoute(
                //         builder: (BuildContext context) => Posts(),
                //       ),
                //     );
                //   },
                //   child: Text('Post Page'),
                // ),
                AnimatedButton(
                  label: 'Device Info Page',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => DeviceInfoScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(width: 40),
                AnimatedButton(
                  label: 'Post Page',
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) => Posts(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
