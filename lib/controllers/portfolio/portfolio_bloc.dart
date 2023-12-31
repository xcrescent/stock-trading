import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stock_trading/helpers/sentry_helper.dart';

import 'package:stock_trading/models/data_overview.dart';
import 'package:stock_trading/models/profile/market_index.dart';
import 'package:stock_trading/models/storage/storage.dart';

import 'package:stock_trading/respository/portfolio/client.dart';

part 'portfolio_event.dart';
part 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  
  // final _databaseRepository = PortfolioStorageClient();
  final _repository = PortfolioClient();

  @override
  PortfolioState get initialState => PortfolioInitial();

  @override
  Stream<PortfolioState> mapEventToState(PortfolioEvent event) async* {

    // if (event is FetchPortfolioData) {
      yield PortfolioLoading();
      yield* _loadContent();
    // }

    // if (event is SaveProfile) {
    //   yield PortfolioLoading();
    //   await this._databaseRepository.save(storageModel: event.storageModel);
    //   yield* _loadContent();
    // }

    // if (event is DeleteProfile) {
    //   yield PortfolioLoading();
    //   await this._databaseRepository.delete(symbol: event.symbol);
    //   yield* _loadContent();
    // }
  }

  Stream<PortfolioState> _loadContent() async* {

    try {
      // final symbolsStored = await _databaseRepository.fetch();
      final indexes = await _repository.fetchIndexes();

      // if (symbolsStored.isNotEmpty) {

        final stocks =   await Future
        .wait(symbolsStored
        .map((symbol) async => await _repository.fetchStocks(symbol: symbol.symbol)));
      
      //   yield PortfolioLoaded(
      //     stocks: stocks, 
      //     indexes: indexes
      //   );

      // } else {
        yield PortfolioStockEmpty(indexes: indexes);
      // }
    
    } catch (e, stack) {
      yield PortfolioError(message: 'There was an unkwon error. Please try again later.');
      await SentryHelper(exception: e, stackTrace: stack).report();
    }
  }
}
