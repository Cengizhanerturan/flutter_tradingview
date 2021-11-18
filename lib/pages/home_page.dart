import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_tradingview/constants/color.dart';
import 'package:flutter_tradingview/constants/text.dart';
import 'package:flutter_tradingview/controller/chart_controller.dart';
import 'package:flutter_tradingview/controller/socket_controller.dart';
import 'package:flutter_tradingview/data/markets.dart';
import 'package:flutter_tradingview/pages/trades_page.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:convert';

ChartController _chartController = Get.put(ChartController());
SocketController _socketController = Get.put(SocketController());

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  WebViewController? _controller;
  final _key = GlobalKey();

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
                              key: _key,
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
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     InkWell(
                        //       onTap: () {
                        //         _chartController.chartsValue.value = 0;
                        //         if (_controller != null) {
                        //           debugPrint('if');
                        //           _controller!.loadUrl(
                        //               _chartController.baseURL +
                        //                   _chartController.chartsList[0]);
                        //           debugPrint(_chartController
                        //               .chartsValue.value
                        //               .toString());
                        //         } else {
                        //           debugPrint('else');
                        //           _controller!.reload();
                        //           _controller!.loadUrl(
                        //               _chartController.baseURL +
                        //                   _chartController.chartsList[0]);
                        //         }
                        //       },
                        //       child: Obx(
                        //         () => Container(
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(16),
                        //             color:
                        //                 _chartController.chartsValue.value ==
                        //                         0
                        //                     ? Colors.green
                        //                     : Colors.red,
                        //             // boxShadow: [
                        //             //   BoxShadow(
                        //             //     color: Colors.grey.withOpacity(0.5),
                        //             //     spreadRadius: 5,
                        //             //     blurRadius: 7,
                        //             //     offset: Offset(0, 3),
                        //             //   ),
                        //             // ],
                        //           ),
                        //           child: Padding(
                        //             padding: const EdgeInsets.symmetric(
                        //                 horizontal: 16.0, vertical: 4.0),
                        //             child: Text(
                        //               'BTC/USDT',
                        //               style: TextStyle(
                        //                 color: Colors.white,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     InkWell(
                        //       onTap: () {
                        //         _chartController.chartsValue.value = 1;
                        //         if (_controller != null) {
                        //           debugPrint('if');
                        //           _controller!.loadUrl(
                        //               _chartController.baseURL +
                        //                   _chartController.chartsList[1]);
                        //           debugPrint(_chartController
                        //               .chartsValue.value
                        //               .toString());
                        //         } else {
                        //           debugPrint('else');
                        //           _controller!.reload();
                        //           _controller!.loadUrl(
                        //               _chartController.baseURL +
                        //                   _chartController.chartsList[1]);
                        //         }
                        //       },
                        //       child: Obx(
                        //         () => Container(
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(16),
                        //             color:
                        //                 _chartController.chartsValue.value ==
                        //                         1
                        //                     ? Colors.green
                        //                     : Colors.red,
                        //             // boxShadow: [
                        //             //   BoxShadow(
                        //             //     color: Colors.grey.withOpacity(0.5),
                        //             //     spreadRadius: 5,
                        //             //     blurRadius: 7,
                        //             //     offset: Offset(0, 3),
                        //             //   ),
                        //             // ],
                        //           ),
                        //           child: Padding(
                        //             padding: const EdgeInsets.symmetric(
                        //                 horizontal: 16.0, vertical: 4.0),
                        //             child: Text(
                        //               'ETH/USDT',
                        //               style: TextStyle(
                        //                 color: Colors.white,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     InkWell(
                        //       onTap: () {
                        //         _chartController.chartsValue.value = 2;
                        //         if (_controller != null) {
                        //           debugPrint('if');
                        //           _controller!.loadUrl(
                        //               _chartController.baseURL +
                        //                   _chartController.chartsList[2]);
                        //           debugPrint(_chartController
                        //               .chartsValue.value
                        //               .toString());
                        //         } else {
                        //           debugPrint('else');
                        //           _controller!.reload();
                        //           _controller!.loadUrl(
                        //               _chartController.baseURL +
                        //                   _chartController.chartsList[2]);
                        //         }
                        //       },
                        //       child: Obx(
                        //         () => Container(
                        //           decoration: BoxDecoration(
                        //             borderRadius: BorderRadius.circular(16),
                        //             color:
                        //                 _chartController.chartsValue.value ==
                        //                         2
                        //                     ? Colors.green
                        //                     : Colors.red,
                        //             // boxShadow: [
                        //             //   BoxShadow(
                        //             //     color: Colors.grey.withOpacity(0.5),
                        //             //     spreadRadius: 5,
                        //             //     blurRadius: 7,
                        //             //     offset: Offset(0, 3),
                        //             //   ),
                        //             // ],
                        //           ),
                        //           child: Padding(
                        //             padding: const EdgeInsets.symmetric(
                        //                 horizontal: 16.0, vertical: 4.0),
                        //             child: Text(
                        //               'USDT/TRY',
                        //               style: TextStyle(
                        //                 color: Colors.white,
                        //               ),
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    )
                  : Container(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome',
                                style: ConstantsText.textStyle16W,
                              ),
                              Text(
                                'Arya Wijaya',
                                style: ConstantsText.textStyle20WB,
                              ),
                            ],
                          ),
                          Spacer(),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor:
                                ConstantsColor.appColorB.withOpacity(0.4),
                            child: Icon(
                              Icons.photo_camera_rounded,
                              color: ConstantsColor.appColorW.withOpacity(0.8),
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          color: ConstantsColor.appColorB.withOpacity(0.4),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Colors.grey.withOpacity(0.5),
                          //     spreadRadius: 2,
                          //     blurRadius: 7,
                          //     offset: Offset(0, 3),
                          //   ),
                          // ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Balance',
                                style: ConstantsText.textStyle16W,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '\$450,933',
                                style: ConstantsText.textStyle24WB,
                              ),
                              Spacer(),
                              Text(
                                'Monthly profit',
                                style: ConstantsText.textStyle16W,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$12,484',
                                    style: ConstantsText.textStyle24WB,
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: ConstantsColor.appColorB
                                          .withOpacity(0.4),
                                      // boxShadow: [
                                      //   BoxShadow(
                                      //     color: Colors.grey.withOpacity(0.2),
                                      //     spreadRadius: 1,
                                      //     blurRadius: 7,
                                      //     offset: Offset(0, 3),
                                      //   ),
                                      // ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0, vertical: 2.0),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.arrow_drop_up_outlined,
                                            size: 30,
                                            color: Colors.green,
                                          ),
                                          Text(
                                            '+10%  ',
                                            style: ConstantsText.textStyle16W,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'My Portfolio',
                            style: ConstantsText.textStyle20WB,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16.0),
                                child: Container(
                                  width: Get.width * 0.6,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: ConstantsColor.appColorB
                                        .withOpacity(0.4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              child: Image.network(
                                                'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency/256/Bitcoin-icon.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'BTC/BIDR',
                                              style:
                                                  ConstantsText.textStyle18WB,
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Text(
                                          'Portfolio',
                                          style: ConstantsText.textStyle16W,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '\$145,250',
                                              style:
                                                  ConstantsText.textStyle20WB,
                                            ),
                                            Spacer(),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: ConstantsColor.appColorB
                                                    .withOpacity(0.4),
                                                // boxShadow: [
                                                //   BoxShadow(
                                                //     color:
                                                //         Colors.grey.withOpacity(0.2),
                                                //     spreadRadius: 1,
                                                //     blurRadius: 7,
                                                //     offset: Offset(0, 3),
                                                //   ),
                                                // ],
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4.0,
                                                        vertical: 2.0),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .arrow_drop_up_outlined,
                                                      size: 30,
                                                      color: Colors.green,
                                                    ),
                                                    Text(
                                                      '+20%  ',
                                                      style: ConstantsText
                                                          .textStyle16W,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: Get.width * 0.6,
                                height: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color:
                                      ConstantsColor.appColorB.withOpacity(0.4),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 50,
                                            child: Image.network(
                                              'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/256/Ethereum-ETH-icon.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            'ETH/BIDR',
                                            style: ConstantsText.textStyle18WB,
                                          ),
                                        ],
                                      ),
                                      Spacer(),
                                      Text(
                                        'Portfolio',
                                        style: ConstantsText.textStyle16W,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '\$250,245',
                                            style: ConstantsText.textStyle20WB,
                                          ),
                                          Spacer(),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              color: ConstantsColor.appColorB
                                                  .withOpacity(0.4),
                                              // boxShadow: [
                                              //   BoxShadow(
                                              //     color: Colors.grey.withOpacity(0.2),
                                              //     spreadRadius: 1,
                                              //     blurRadius: 7,
                                              //     offset: Offset(0, 3),
                                              //   ),
                                              // ],
                                            ),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 4.0,
                                                      vertical: 2.0),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .arrow_drop_up_outlined,
                                                    size: 30,
                                                    color: Colors.green,
                                                  ),
                                                  Text(
                                                    '+8%  ',
                                                    style: ConstantsText
                                                        .textStyle16W,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Container(
                                  width: Get.width * 0.6,
                                  height: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    color: ConstantsColor.appColorB
                                        .withOpacity(0.4),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0, vertical: 16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 50,
                                              height: 50,
                                              child: Image.network(
                                                'https://icons.iconarchive.com/icons/cjdowner/cryptocurrency-flat/256/Litecoin-LTC-icon.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              'LTC/BIDR',
                                              style:
                                                  ConstantsText.textStyle18WB,
                                            ),
                                          ],
                                        ),
                                        Spacer(),
                                        Text(
                                          'Portfolio',
                                          style: ConstantsText.textStyle16W,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              '\$36,945',
                                              style:
                                                  ConstantsText.textStyle20WB,
                                            ),
                                            Spacer(),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: ConstantsColor.appColorB
                                                    .withOpacity(0.4),
                                                // boxShadow: [
                                                //   BoxShadow(
                                                //     color:
                                                //         Colors.grey.withOpacity(0.2),
                                                //     spreadRadius: 1,
                                                //     blurRadius: 7,
                                                //     offset: Offset(0, 3),
                                                //   ),
                                                // ],
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 4.0,
                                                        vertical: 2.0),
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .arrow_drop_down_outlined,
                                                      size: 30,
                                                      color: Colors.red,
                                                    ),
                                                    Text(
                                                      '-12%  ',
                                                      style: ConstantsText
                                                          .textStyle16W,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: Text(
                        'Coin List',
                        style: ConstantsText.textStyle20WB,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 500,
                      width: Get.width,
                      child: StreamBuilder(
                        stream: _socketController.channelPrices.stream,
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          // debugPrint(_socketController.coinList.toString());
                          if (snapshot.hasData) {
                            Map coinMap = jsonDecode(snapshot.data);
                            if (coinMap.length > 0) {
                              coinMap.entries.forEach((element) {
                                _socketController.coinList.forEach((myMap) {
                                  if (myMap.entries.first.key.toString() ==
                                      element.key.toString()) {
                                    var fark = double.parse(
                                            myMap.values.elementAt(0)) -
                                        double.parse(element.value);
                                    if (fark < 0) {
                                      myMap.update(myMap.keys.elementAt(1),
                                          (value) => "1");
                                    } else if (fark > 0) {
                                      myMap.update(myMap.keys.elementAt(1),
                                          (value) => "0");
                                    } else {
                                      myMap.update(myMap.keys.elementAt(1),
                                          (value) => "2");
                                    }
                                    myMap.update(myMap.entries.first.key,
                                        (value) => element.value.toString());
                                  }
                                });
                              });
                              return ListView.builder(
                                itemCount: _socketController.coinList.length,
                                itemBuilder: (BuildContext context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0, vertical: 2.0),
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(() => TradesPage(
                                            coinIsim: _socketController
                                                .coinList[index]
                                                .entries
                                                .first
                                                .key));
                                      },
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        color: colorAta(_socketController
                                            .coinList[index].values
                                            .elementAt(1)
                                            .toString()),
                                        child: ListTile(
                                          title: Text(
                                            _socketController.coinList[index]
                                                .entries.first.key
                                                .toUpperCase(),
                                            style: ConstantsText.textStyle18WB,
                                          ),
                                          subtitle: Text(
                                            _socketController.coinList[index]
                                                .entries.first.value,
                                            style: ConstantsText.textStyle16WB,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else {
                              return Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: CircularProgressIndicator(),
                                  ),
                                  Spacer(),
                                ],
                              );
                            }
                          } else {
                            return Column(
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(),
                                ),
                                Spacer(),
                              ],
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Padding(
                    //   padding: EdgeInsets.symmetric(horizontal: 16.0),
                    //   child: Text(
                    //     'Trades',
                    //     style: ConstantsText.textStyle20WB,
                    //   ),
                    // ),
                    // Container(
                    //   height: 500,
                    //   width: Get.width,
                    //   child: StreamBuilder(
                    //     stream: _socketController.channelTrades.stream,
                    //     builder:
                    //         (BuildContext context, AsyncSnapshot snapshot) {
                    //       if (snapshot.hasData) {
                    //         debugPrint(snapshot.data.toString());
                    //         Map myMap = jsonDecode(snapshot.data);
                    //         _socketController.tradesList.add(myMap);
                    //         List tradesList =
                    //             _socketController.tradesList.reversed.toList();
                    //         return ListView.builder(
                    //             itemCount: tradesList.length,
                    //             itemBuilder: (BuildContext context, index) {
                    //               return Padding(
                    //                 padding: const EdgeInsets.symmetric(
                    //                     horizontal: 8.0, vertical: 2.0),
                    //                 child: Card(
                    //                   shape: RoundedRectangleBorder(
                    //                     borderRadius: BorderRadius.circular(16),
                    //                   ),
                    //                   color: tradesList[index]['direction']
                    //                               .toString() ==
                    //                           "buy"
                    //                       ? Colors.green
                    //                       : Colors.red,
                    //                   child: ListTile(
                    //                     title: Text(
                    //                       tradesList[index]['base']
                    //                           .toString()
                    //                           .toUpperCase(),
                    //                       style: ConstantsText.textStyle18WB,
                    //                     ),
                    //                     subtitle: Text(
                    //                       tradesList[index]['price'].toString(),
                    //                       style: ConstantsText.textStyle16WB,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               );
                    //             });
                    //       } else {
                    //         return Container();
                    //       }
                    //     },
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color colorAta(String deger) {
    if (deger == "0") {
      return Colors.red;
    } else if (deger == "1") {
      return Colors.green;
    } else {
      return ConstantsColor.appColorB.withOpacity(0.1);
    }
  }
}
