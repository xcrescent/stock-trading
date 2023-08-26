import 'package:flutter/material.dart';
import 'package:stock_trading/helpers/color/color_helper.dart';
import 'package:stock_trading/helpers/text/text_helper.dart';
import 'package:stock_trading/models/profile/stock_chart.dart';
import 'package:stock_trading/models/profile/stock_profile.dart';
import 'package:stock_trading/models/profile/stock_quote.dart';

import 'package:stock_trading/widgets/profile/widgets/profile/profile_graph.dart';
import 'package:stock_trading/widgets/profile/widgets/profile/profile_summary.dart';

import 'package:stock_trading/widgets/profile/widgets/styles.dart';

class StockProfileWidget extends StatefulWidget {
  final Color color;
  final StockQuote stockQuote;
  final StockProfile stockProfile;
  final List<StockChart> stockChart;

  const StockProfileWidget({
    super.key,
    required this.color,
    required this.stockProfile,
    required this.stockQuote,
    required this.stockChart,
  });

  @override
  State<StockProfileWidget> createState() => _StockProfileWidgetState();
}
//  final _httpClient = ProfileClient();
//   late Future<ProfileModel> futureTemp;

//   @override
//   void initState() {
//     futureTemp = _httpClient.fetchStockData(symbol: widget.symbol);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<ProfileModel>(
//         future: futureTemp,
//         builder: (context, g) {
//           if (g.hasError) {
//             return Scaffold(
//                 appBar: AppBar(
//                   backgroundColor: kNegativeColor,
//                   title: Text(':('),
//                 ),
//                 backgroundColor: kScaffoldBackground,
//                 body: Center(child: EmptyScreen(message: g.error.toString())));
//           }

//           if (g.hasData) {
//             return ProfileScreen(
//                 isSaved: g.data!.stockQuote,
//                 profile: g.data.stockProfile,
//                 color: determineColorBasedOnChange(
//                     state.profileModel.stockProfile.changes));
//           }

class _StockProfileWidgetState extends State<StockProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(left: 26, right: 26, top: 26),
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(widget.stockQuote.name, style: kProfileCompanyName),
            _buildPrice(),
            Container(
                height: 250,
                padding: const EdgeInsets.only(top: 26),
                child: SimpleTimeSeriesChart(
                    chart: widget.stockChart, color: widget.color)),
            StatisticsWidget(
              quote: widget.stockQuote,
              profile: widget.stockProfile,
            )
          ],
        ),
      ],
    );
  }

  Widget _buildPrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('\$${formatText(widget.stockQuote.price)}', style: priceStyle),
          const SizedBox(height: 8),
          Text(
              '${determineTextBasedOnChange(widget.stockQuote.change)}  (${determineTextPercentageBasedOnChange(widget.stockQuote.changesPercentage)})',
              style: determineTextStyleBasedOnChange(widget.stockQuote.change))
        ],
      ),
    );
  }
}
