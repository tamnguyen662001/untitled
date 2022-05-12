import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';


void main() => runApp(CPU_Z());

class CPU_Z extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CPU-Z đơn giản',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Ứng dụng CPU-Z đơn giản'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  List<Widget> textWidgets = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Thông tin thiết bị:',
              style: TextStyle(fontSize: 28),
            ),
            ...textWidgets,
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
          setState(() {
            textWidgets.add(Text('androidId: ${androidInfo.androidId}'));
            textWidgets.add(Text('board: ${androidInfo.board}'));
            textWidgets.add(Text('bootloader: ${androidInfo.bootloader}'));
            textWidgets.add(Text('brand: ${androidInfo.brand}'));
            textWidgets.add(Text('device: ${androidInfo.device}'));
            textWidgets.add(Text('display: ${androidInfo.display}'));
            textWidgets.add(Text('fingerprint: ${androidInfo.fingerprint}'));
            textWidgets.add(Text('hardware: ${androidInfo.hardware}'));
            textWidgets.add(Text('hashCode: ${androidInfo.hashCode}'));
            textWidgets.add(Text('host: ${androidInfo.host}'));
            textWidgets.add(Text('id: ${androidInfo.id}'));
            textWidgets
                .add(Text('isPhysicalDevice: ${androidInfo.isPhysicalDevice}'));
            textWidgets.add(Text('manufacturer: ${androidInfo.manufacturer}'));
            textWidgets.add(Text('model: ${androidInfo.model}'));
            textWidgets.add(Text('product: ${androidInfo.product}'));
          });
          //
        },
        tooltip: 'Increment',
        child: Icon(Icons.edit),
      ),
    );
  }

}