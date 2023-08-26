import 'package:flutter/material.dart';

import 'package:stock_trading/models/data_overview.dart';
import 'package:stock_trading/models/profile/market_index.dart';
import 'package:stock_trading/respository/portfolio/client.dart';

import 'package:stock_trading/widgets/portfolio/widgets/content/portfolio_index.dart';
import 'package:stock_trading/widgets/portfolio/widgets/content/portfolio_stonk.dart';

import 'package:stock_trading/widgets/widgets/empty_screen.dart';

class PortfolioLoaded {
  final List<StockOverviewModel> stocks;
  final List<MarketIndexModel> indexes;

  PortfolioLoaded({
    required this.stocks,
    required this.indexes,
  });
}

class PortfolioStonksSection extends StatefulWidget {
  const PortfolioStonksSection({super.key});

  @override
  State<PortfolioStonksSection> createState() => _PortfolioStonksSectionState();
}

class _PortfolioStonksSectionState extends State<PortfolioStonksSection> {
  late List<MarketIndexModel> indexes;
  late StockOverviewModel stock;
  late List<StockOverviewModel> stocks;
  late final portfolio;
  final _repository = PortfolioClient();

  Future<PortfolioLoaded> getstock() async {
    indexes = await _repository.fetchIndexes();
    stock = await _repository.fetchStocks(symbol: 'DJI');
    stocks = [stock];
    return PortfolioLoaded(stocks: stocks, indexes: indexes);
  }

  @override
  void initState() {
    portfolio = getstock();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return
        // BlocBuilder<PortfolioBloc, PortfolioState>(
        //   builder: (BuildContext context, PortfolioState state) {

        // if (state is PortfolioInitial) {
        //   BlocProvider
        //   .of<PortfolioBloc>(context)
        //   .add(FetchPortfolioData());
        // }

        // if (state is PortfolioError) {
        //   return Padding(
        //     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
        //     child: EmptyScreen(message: state.message),
        //   );
        // }

        // if (state is PortfolioStockEmpty) {
        // return
        // Column(
        //   children: <Widget>[
        //     _buildIndexesSection(indexes: []),

        //     Padding(
        //       padding: EdgeInsets.symmetric(
        //         vertical: MediaQuery.of(context).size.height / 5,
        //         horizontal: 4
        //       ),
        //       child: const EmptyScreen(message: 'Looks like you don\'t have any holdings in your watchlist.'),
        //     ),
        //   ],
        // );
        // }

        // if (state is PortfolioLoaded) {
        // return
        Column(
      children: <Widget>[
        _buildIndexesSection(indexes: indexes),
        _buildStocksSection(stocks: stocks)
      ],
    );
    // }

    // return Padding(
    //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
    //   child: CircularProgressIndicator(),
    // );
  }

  // );
  Widget _buildIndexesSection({required List<MarketIndexModel> indexes}) {
    return Container(
      height: 75,
      margin: EdgeInsets.only(top: 16, bottom: 16),
      child: ListView.builder(
          physics: BouncingScrollPhysics(),
          addAutomaticKeepAlives: false,
          addRepaintBoundaries: false,
          scrollDirection: Axis.horizontal,
          itemCount: indexes.length,
          itemBuilder: (BuildContext context, int index) {
            return PortfolioIndexWidget(index: indexes[index]);
          }),
    );
  }

  Widget _buildStocksSection({required List<StockOverviewModel> stocks}) {
    return ListView.builder(
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemCount: stocks.length,
        itemBuilder: (BuildContext context, int index) {
          return PortfolioStockCard(data: stocks[index]);
        });
  }
}
