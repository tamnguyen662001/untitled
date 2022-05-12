import 'dart:async';
import 'dart:developer' as developer;
import 'dart:io';
import 'package:battery_info/battery_info_plugin.dart';
import 'package:battery_info/model/android_battery_info.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cpu_reader/cpuinfo.dart';
import 'package:system_info2/system_info2.dart';
void main() {
  runZonedGuarded(() {
    runApp(const CPU_Z2());
  }, (dynamic error, dynamic stack) {
    developer.log("Something went wrong!", error: error, stackTrace: stack);
  });
}
class CPU_Z2 extends StatefulWidget {
  const CPU_Z2({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<CPU_Z2> {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  Map<String, dynamic> _deviceBattery = <String, dynamic>{};
  Map<String, dynamic> _deviceCpu = <String , dynamic>{};
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }
  List<Row> buildFreqList(AsyncSnapshot<CpuInfo> snapshot) {
    return snapshot.data!.currentFrequencies!.entries
        .map((entry) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text('CPU ${entry.key} '), Text('${entry.value}')]))
        .toList();
  }
  Future<void> initPlatformState() async {
    var deviceData = <String, dynamic>{};
    var batteryData = <String,dynamic>{};
    var cpuData = <String, dynamic>{};
    try {
      if (kIsWeb) {
      } else {
        if (Platform.isAndroid) {
          deviceData =
              _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
          batteryData=await _getAndroidDeviceInfor();
          cpuData = await _getAndroidCpuInfo();
        }
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
      _deviceBattery = batteryData;
      _deviceCpu = cpuData;
    });
  }
  Future<Map<String, dynamic>> _getAndroidCpuInfo() async{
    const int megaByte = 1024 * 1024;
    Map<String, dynamic> a ={};
    for(int i=0 ; i< SysInfo.cores.length;i++){
      a.addAll({'Model': SysInfo.cores[0].vendor,
        'Number of Cores': SysInfo.cores.length,
        'User space bitness' : SysInfo.userSpaceBitness,
        'Architecture': SysInfo.kernelArchitecture,
        'Total Ram': '${SysInfo.getTotalPhysicalMemory() ~/ megaByte} MB',
        'Free Ram':'${SysInfo.getFreeVirtualMemory() ~/ megaByte} MB',
        'Operating system name':SysInfo.kernelName,});
      a.addAll({'Core ${i+1}':SysInfo.cores[i].name});
    }
    return a;
  }
  Future<Map<String, dynamic>> _getAndroidDeviceInfor() async{
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidBatteryInfo?  androidBatteryInfo =
    await BatteryInfoPlugin().androidBatteryInfo;
    AndroidDeviceInfo deviceInfoData = await deviceInfo.androidInfo;
    return {
      'Health': androidBatteryInfo?.health,
      'Level':  "${androidBatteryInfo?.batteryLevel.toString()}%" ,
      'Status':  androidBatteryInfo?.chargingStatus ,
      'Power Source': "${androidBatteryInfo?.pluggedStatus} Source",
      'Technology': androidBatteryInfo?.technology,
      'Battery capacity':androidBatteryInfo?.batteryCapacity?.toString()?? "No info",
      'Temperature':"${androidBatteryInfo?.temperature?.toString()} độ C ",
      'Voltage':  "${androidBatteryInfo?.voltage?.toString() ?? "No info"} mV"
    };
  }
  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'Version securityPatch': build.version.securityPatch,
      'Version sdkInt': build.version.sdkInt,
      'Version release': build.version.release,
      // 'version.previewSdkInt': build.version.previewSdkInt,
      // 'version.incremental': build.version.incremental,
      // 'version.codename': build.version.codename,
      // 'version.baseOS': build.version.baseOS,
      'Board': build.board,
      // 'bootloader': build.bootloader,
      'Brand': build.brand,
      'Device': build.device,
      'Display': build.display,
      // 'fingerprint': build.fingerprint,
      'Hardware': build.hardware,
      // 'host': build.host,
      // 'id': build.id,
      // 'manufacturer': build.manufacturer,
      'Model': build.model,
      'Product': build.product,
      // 'supported32BitAbis': build.supported32BitAbis,
      // 'supported64BitAbis': build.supported64BitAbis,
      // 'supportedAbis': build.supportedAbis,
      // 'tags': build.tags,
      // 'type': build.type,
      // 'isPhysicalDevice': build.isPhysicalDevice,
      // 'androidId': build.androidId,
      // 'systemFeatures': build.systemFeatures,
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.greenAccent,
                title: Text(
                  kIsWeb
                      ? 'Web Browser info'
                      : Platform.isAndroid
                      ? 'Android Device Info'
                      : Platform.isIOS
                      ? 'iOS Device Info'
                      : Platform.isLinux
                      ? 'Linux Device Info'
                      : Platform.isMacOS
                      ? 'MacOS Device Info'
                      : Platform.isWindows
                      ? 'Windows Device Info'
                      : '',
                ),
                bottom: _tabBar()
            ),
            body: TabBarView(
              children: [
                _CpuInfo(),
                _deviceInfor(),
                Center(
                  child: Text("System"),
                ),
                _BatteryInfo()
              ],
            )
        ),
      ),
    );
  }
  PreferredSizeWidget _tabBar() {
    return TabBar(
        indicatorWeight: 5,
        isScrollable: true,
        tabs: [
          Tab(
            child: Text("SOC"),
          ),
          Tab(
            child: Text("DEVICE"),
          ),
          Tab(
            child: Text("SYSTEM"),
          ),
          Tab(
            child: Text("BATTERY"),
          ),

        ]);
  }
  Widget _deviceInfor(){
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(height: 1,),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text('${_deviceData.keys.elementAt(index)}'),
            title: Text('${_deviceData.values.elementAt(index)}',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 15
              ),),
          );
        },
        itemCount: _deviceData.length);
  }
  Widget _BatteryInfo(){
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(height: 1,),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text('${_deviceBattery.keys.elementAt(index)}'),
            title: Text('${_deviceBattery.values.elementAt(index)}',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 15
              ),),
          );
        },
        itemCount: _deviceBattery.length);
  }
  Widget _CpuInfo(){
    return ListView.separated(
        separatorBuilder: (context, index) => Divider(height: 1,),
        itemBuilder: (context, index) {
          return ListTile(
            leading: Text('${_deviceCpu.keys.elementAt(index)}'),
            title: Text('${_deviceCpu.values.elementAt(index)}',
              style: TextStyle(
                  color: Colors.red,
                  fontSize: 15
              ),),
          );
        },
        itemCount: _deviceCpu.length);
  }
}


