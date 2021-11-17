import 'package:get/state_manager.dart';

class ChartController extends GetxController {
  var baseURL = 'https://tr.tradingview.com/chart/?symbol=BINANCE%3A';
  var chartsList = ['BTCUSDT', 'ETHUSDT', 'USDTTRY'];
  var chartsValue = 0.obs;
  var chartsVisible = 1.obs;
}
