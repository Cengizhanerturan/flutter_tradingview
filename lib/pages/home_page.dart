import 'package:flutter/material.dart';
import 'package:flutter_tradingview/constants/color.dart';
import 'package:flutter_tradingview/constants/text.dart';
import 'package:flutter_tradingview/controller/chart_controller.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

ChartController _chartController = Get.put(ChartController());

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  WebViewController? _controller;
  final _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                child: Row(
                  children: [
                    Text(
                      'Crypto App',
                      style: ConstantsText.textStyle24BB,
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
                              height: 300,
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
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  _chartController.chartsValue.value = 0;
                                  if (_controller != null) {
                                    debugPrint('if');
                                    _controller!.loadUrl(
                                        _chartController.baseURL +
                                            _chartController.chartsList[0]);
                                    debugPrint(_chartController
                                        .chartsValue.value
                                        .toString());
                                  } else {
                                    debugPrint('else');
                                    _controller!.reload();
                                    _controller!.loadUrl(
                                        _chartController.baseURL +
                                            _chartController.chartsList[0]);
                                  }
                                },
                                child: Obx(
                                  () => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color:
                                          _chartController.chartsValue.value ==
                                                  0
                                              ? Colors.green
                                              : Colors.red,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 4.0),
                                      child: Text(
                                        'BTC/USDT',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _chartController.chartsValue.value = 1;
                                  if (_controller != null) {
                                    debugPrint('if');
                                    _controller!.loadUrl(
                                        _chartController.baseURL +
                                            _chartController.chartsList[1]);
                                    debugPrint(_chartController
                                        .chartsValue.value
                                        .toString());
                                  } else {
                                    debugPrint('else');
                                    _controller!.reload();
                                    _controller!.loadUrl(
                                        _chartController.baseURL +
                                            _chartController.chartsList[1]);
                                  }
                                },
                                child: Obx(
                                  () => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color:
                                          _chartController.chartsValue.value ==
                                                  1
                                              ? Colors.green
                                              : Colors.red,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 4.0),
                                      child: Text(
                                        'ETH/USDT',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  _chartController.chartsValue.value = 2;
                                  if (_controller != null) {
                                    debugPrint('if');
                                    _controller!.loadUrl(
                                        _chartController.baseURL +
                                            _chartController.chartsList[2]);
                                    debugPrint(_chartController
                                        .chartsValue.value
                                        .toString());
                                  } else {
                                    debugPrint('else');
                                    _controller!.reload();
                                    _controller!.loadUrl(
                                        _chartController.baseURL +
                                            _chartController.chartsList[2]);
                                  }
                                },
                                child: Obx(
                                  () => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color:
                                          _chartController.chartsValue.value ==
                                                  2
                                              ? Colors.green
                                              : Colors.red,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 4.0),
                                      child: Text(
                                        'USDT/TRY',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    : Container(),
              ),
              Center(
                child: Container(
                  width: Get.width * 0.9,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: ConstantsColor.appColorB.withOpacity(0.7),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
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
                                color:
                                    ConstantsColor.appColorB.withOpacity(0.4),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
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
                      style: ConstantsText.textStyle20BB,
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
                              color: ConstantsColor.appColorB.withOpacity(0.7),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        '\$145,250',
                                        style: ConstantsText.textStyle20WB,
                                      ),
                                      Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: ConstantsColor.appColorB
                                              .withOpacity(0.4),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
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
                                                '+20%  ',
                                                style:
                                                    ConstantsText.textStyle16W,
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
                            color: ConstantsColor.appColorB.withOpacity(0.7),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
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
                                        borderRadius: BorderRadius.circular(16),
                                        color: ConstantsColor.appColorB
                                            .withOpacity(0.4),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 7,
                                            offset: Offset(0, 3),
                                          ),
                                        ],
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
                                              '+8%  ',
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
                              color: ConstantsColor.appColorB.withOpacity(0.7),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                        '\$36,945',
                                        style: ConstantsText.textStyle20WB,
                                      ),
                                      Spacer(),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: ConstantsColor.appColorB
                                              .withOpacity(0.4),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.2),
                                              spreadRadius: 1,
                                              blurRadius: 7,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 4.0, vertical: 2.0),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.arrow_drop_down_outlined,
                                                size: 30,
                                                color: Colors.red,
                                              ),
                                              Text(
                                                '-12%  ',
                                                style:
                                                    ConstantsText.textStyle16W,
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
            ],
          ),
        ),
      ),
    );
  }
}
