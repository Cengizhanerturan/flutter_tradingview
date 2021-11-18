import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_tradingview/constants/color.dart';
import 'package:flutter_tradingview/constants/text.dart';
import 'package:flutter_tradingview/controller/chart_controller.dart';
import 'package:flutter_tradingview/controller/socket_controller.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

ChartController _chartController = Get.find<ChartController>();
SocketController _socketController = Get.find<SocketController>();

class TradesPage extends StatelessWidget {
  String coinIsim;

  TradesPage({required this.coinIsim, Key? key}) : super(key: key);

  WebViewController? _controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ConstantsColor.appColorDark,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Row(
                children: [
                  Text(
                    'Crypto App',
                    style: ConstantsText.textStyle24WB,
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      _chartController.chartsVisible.value == 0
                          ? _chartController.chartsVisible.value = 1
                          : _chartController.chartsVisible.value = 0;
                    },
                    child: Icon(
                      Icons.bar_chart_rounded,
                      size: 30,
                      color: ConstantsColor.appColorW,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                child: Text(
                  coinIsim.toUpperCase(),
                  style: ConstantsText.textStyle24WB,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Obx(
              () => _chartController.chartsVisible.value == 1
                  ? Column(
                      children: [
                        Center(
                          child: Container(
                            height: 260,
                            width: MediaQuery.of(context).size.width,
                            child: WebView(
                              initialUrl: _chartController.baseURL +
                                  _chartController.chartsList[0],
                              javascriptMode: JavascriptMode.unrestricted,
                              onWebViewCreated:
                                  (WebViewController webViewController) {
                                _controller = webViewController;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    )
                  : Container(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Text(
                'Trades',
                style: ConstantsText.textStyle20WB,
              ),
            ),
            Expanded(
              child: Container(
                height: 600,
                width: Get.width,
                child: StreamBuilder(
                  stream: _socketController.channelTrades.stream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      debugPrint(snapshot.data.toString());
                      Map myMap = jsonDecode(snapshot.data);
                      _socketController.tradesList.add(myMap);
                      List tradesList =
                          _socketController.tradesList.reversed.toList();
                      return ListView.builder(
                          itemCount: _socketController.tradesList.length,
                          itemBuilder: (BuildContext context, index) {
                            return tradesList[index]['base']
                                        .toString()
                                        .toUpperCase() ==
                                    coinIsim.toUpperCase()
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 2.0),
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      color: tradesList[index]['direction']
                                                  .toString() ==
                                              "buy"
                                          ? Colors.green
                                          : Colors.red,
                                      child: ListTile(
                                        title: Text(
                                          tradesList[index]['base']
                                              .toString()
                                              .toUpperCase(),
                                          style: ConstantsText.textStyle18WB,
                                        ),
                                        subtitle: Text(
                                          tradesList[index]['price'].toString(),
                                          style: ConstantsText.textStyle16WB,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container();
                          });
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
