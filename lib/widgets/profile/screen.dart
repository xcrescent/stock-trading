import 'package:flutter/material.dart';
import 'package:stock_trading/models/profile/profile.dart';
import 'package:stock_trading/models/storage/storage.dart';

import 'package:stock_trading/shared/colors.dart';
import 'package:stock_trading/widgets/profile/widgets/profile/profile.dart';
import 'package:stock_trading/widgets/profile/widgets/widget/save_button.dart';

class ProfileScreen extends StatelessWidget {
  final bool isSaved;
  final Color color;
  final ProfileModel profile;

  const ProfileScreen({
    super.key,
    required this.isSaved,
    required this.profile,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          centerTitle: true,
          title: Text(profile.stockQuote.symbol),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions: <Widget>[
            WatchlistButtonWidget(
              storageModel: StorageModel(
                  symbol: profile.stockQuote.symbol,
                  companyName: profile.stockQuote.name),
              isSaved: isSaved,
              color: Colors.white,
            )
          ],
        ),
        backgroundColor: kScaffoldBackground,
        body: SafeArea(
          child: StockProfileWidget(
            color: color,
            stockProfile: profile.stockProfile,
            stockChart: profile.stockChart,
            stockQuote: profile.stockQuote,
          ),
          // ProfileNewsScreen(news: profile.stockNews,),
        ));
  }
}
