import 'package:flutter_tradingview/data/markets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SocketController extends GetxController {
  var coinList = [
    {"bitcoin": "0", "renk": "2"},
    {"ethereum": "0", "renk": "2"},
    {"dogecoin": "0", "renk": "2"},
    {"stellar": "0", "renk": "2"},
    {"theta": "0", "renk": "2"},
    {"avalanche": "0", "renk": "2"},
    {"monero": "0", "renk": "2"},
    {"litecoin": "0", "renk": "2"},
    {"tron": "0", "renk": "2"},
    {"solana": "0", "renk": "2"},
    {"uniswap": "0", "renk": "2"},
    {"chainlink": "0", "renk": "2"},
  ].obs;

  var renkList = [2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2].obs;

  var tradesList = [].obs;

  var widgetControl = 0.obs;
  var coinIsim = ''.obs;

  final WebSocketChannel channelPrices = WebSocketChannel.connect(
    Uri.parse(
        'wss://ws.coincap.io/prices?assets=bitcoin,ethereum,dogecoin,stellar,theta,avalanche,monero,litecoin,tron,solana,uniswap,chainlink'),
  );

  final WebSocketChannel channelTrades = WebSocketChannel.connect(
    Uri.parse('wss://ws.coincap.io/trades/binance'),
  );

  Future<Markets> marketsGetir() async {
    var response =
        await http.get(Uri.parse('https://api.coincap.io/v2/assets'));
    if (response.statusCode == 200) {
      return Markets.fromMap(jsonDecode(response.body));
    } else {
      throw Exception('Hata!: ${response.statusCode.toString()}');
    }
  }
}
