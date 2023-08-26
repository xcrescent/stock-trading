
import 'package:stock_trading/models/news/news.dart';
import 'package:stock_trading/respository/news/news_client.dart';

class NewsRepository extends NewsClient {
  
  
  @override
  Future<NewsDataModel> fetchNews({required String title}) async => await super.fetchNews(title: title);

}