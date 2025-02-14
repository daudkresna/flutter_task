import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:native_bloc_task/presentation/widgets/info_text.dart';

class DeviceInfoScreen extends StatefulWidget {
  const DeviceInfoScreen({super.key});

  @override
  State<DeviceInfoScreen> createState() => _DeviceInfoScreenState();
}

class _DeviceInfoScreenState extends State<DeviceInfoScreen> {
  static const platform = MethodChannel('samples.flutter.dev/platform');
  String _model = 'Unknown';
  String _manufacturer = 'Unknown';
  String _version = 'Unknown';
  int _batteryLevel = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getDeviceInfo();
    _getBatteryLevel();
  }

  Future<void> _getBatteryLevel() async {
    try {
      final int newBatteryLevel = await platform.invokeMethod(
        "getBatteryPercentages",
      );
      setState(() {
        _batteryLevel = newBatteryLevel;
      });
    } on PlatformException catch (e) {
      setState(() {
        _batteryLevel = -1;
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _getDeviceInfo() async {
    try {
      final deviceInfo = await platform.invokeMethod('getDeviceInfo');
      setState(() {
        _model = deviceInfo['model'];
        _manufacturer = deviceInfo['manufacturer'];
        _version = deviceInfo['version'];
      });
    } on PlatformException catch (e) {
      setState(() {
        _model = 'Failed to get device model ${e.message}';
        _manufacturer = 'Failed to get device manufacturer ${e.message}';
        _version = 'Failed to get device version ${e.message}';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
            _isLoading
                ? CircularProgressIndicator()
                : Card(
                  color: Colors.grey,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InfoText(
                          text: 'Model: $_model',
                          icon: Icons.phone_android,
                        ),
                        InfoText(
                          text: 'Manufacturer: $_manufacturer',
                          icon: Icons.business,
                        ),
                        InfoText(text: 'Version: $_version', icon: Icons.info),
                        InfoText(
                          text: 'Battery Level: $_batteryLevel%',
                          icon: Icons.battery_full,
                        ),
                      ],
                    ),
                  ),
                ),
      ),
    );
  }
}
