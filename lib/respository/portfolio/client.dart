import 'package:dio/dio.dart';
import 'package:stock_trading/helpers/http_helper.dart';
import 'package:stock_trading/models/data_overview.dart';
import 'package:stock_trading/models/profile/market_index.dart';

class PortfolioClient extends FetchClient {
  Future<List<MarketIndexModel>> fetchIndexes() async {
    final Response<dynamic> response = await super
        .financialModelRequest('/api/v3/quote/^DJI,^GSPC,^IXIC,^RUT,^VIX');
    return MarketIndexModel.toList(response.data);
  }

  Future<StockOverviewModel> fetchStocks({required String symbol}) async {
    final Response<dynamic> response =
        await super.financialModelRequest('/api/v3/quote/$symbol');
    print(response.data[0]);
    return StockOverviewModel.fromJson(response.data[0]);
  }
}
