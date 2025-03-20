import 'dart:ui';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:gateflow/controllers/MenuItemController.dart';
import 'package:gateflow/models/devices_entity.dart';
import 'package:gateflow/net/http.dart';
import 'package:gateflow/screens/voice/Rule.dart';
import 'package:gateflow/utils/http.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class VoiceScreen extends StatefulWidget {
  List<DevicesData> devices = List.empty(growable: true);

  VoiceScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TestScreen();
}

class _TestScreen extends State<VoiceScreen> {
  void getDevices() async {
    try {
      var devices = await HttpManager.devicesList();
      setState(() {
        widget.devices = devices;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getDevices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var column = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "语音功能(高级) ",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(
          height: window.physicalSize.height * 0.58,
          width: double.infinity,
          child: DataTable2(
            columnSpacing: defaultPadding,
            minWidth: 600,
            columns: const [
              DataColumn2(
                size: ColumnSize.S,
                label: Text("权重"),
              ),
              DataColumn(
                label: Text("关键字"),
              ),
              DataColumn(
                label: Text("regex"),
              ),
              DataColumn2(
                size: ColumnSize.S,
                label: Text("全量匹配"),
              ),
              DataColumn(
                label: Text("输出"),
              ),
              DataColumn2(
                size: ColumnSize.S,
                label: Text("操作"),
              ),
            ],
            rows: List.generate(
              moniRules.length,
              (index) => devicesDataRow(moniRules[index]),
            ),
          ),
        ),
      ],
    );
    var title = Padding(
      padding: const EdgeInsets.only(
          left: defaultPadding / 2,
          top: defaultPadding / 2,
          bottom: defaultPadding),
      child: Row(
        children: [
          if (!Responsive.isDesktop(context))
            IconButton(
              icon: const Icon(Icons.menu),
              onPressed: context.read<MenuItemController>().controlMenu,
            ),
          Text(
            "设备调试",
            style: Theme.of(context).textTheme.headlineSmall,
          )
        ],
      ),
    );
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: defaultPaddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title,
            Card(
              color: Theme.of(context).cardTheme.color,
              child: Padding(
                padding: defaultPaddingAll,
                child: column,
              ),
            )
            //Card()container,
          ],
        ),
      ),
    );
  }
}

DataRow devicesDataRow(Rule info) {
  return DataRow(
    cells: [
      DataCell(Text(info.priority.toString()), placeholder: true),
      DataCell(Text(info.keywords.toString()), placeholder: true),
      //Text(info.matchAll.toString())

      DataCell(Text(info.regex), placeholder: true),
      DataCell(
          Checkbox(
            value: info.matchAll,
            onChanged: (selected) {
              info.matchAll = selected!;
            },
          ),
          placeholder: true),
      DataCell(Text(info.ttsContent), placeholder: true),
      DataCell(
          Row(
            children: [
              // ElevatedButton(
              //   onPressed: () {
              //     _openGateTest(info);
              //   },
              //   child: const Text(
              //     '开闸调试',
              //     style: TextStyle(color: Colors.white),
              //   ),
              // ),
              IconButton(
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.blue,
                ),
                onPressed: () async {},
              ),
            ],
          ),
          placeholder: true),
    ],
  );
}
