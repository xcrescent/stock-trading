
import 'package:flutter/material.dart';
import 'package:stock_trading/models/search/search.dart';

// import 'package:stock_trading/widgets/search/search_results/search_history.dart';
import 'package:stock_trading/widgets/search/search_results/search_results.dart';

// import 'package:stock_trading/widgets/widgets/message.dart';

class SearchScreenSection extends StatelessWidget {
  const SearchScreenSection({super.key});


  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<SearchBloc, SearchState>(
    //   builder: (BuildContext context, SearchState state) {

    //     if (state is SearchInitial) {
    //       BlocProvider
    //       .of<SearchBloc>(context)
    //       .add(FetchSearchHistory());
    //     }

    //     if (state is SearchResultsLoadingError) {
    //       return MessageScreen(message: state.message, action: Container());
    //     }

    //     if (state is SearchData) {
          return _buildWrapper(data: [], listType: ListType.searchResults);
        // }

        // return Padding(
        //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
        //   child: const CircularProgressIndicator(),
        // );
      }
    // );
  // }

  Widget _buildWrapper({required List<StockSearch> data, required ListType listType}) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (BuildContext ctx, int i) {
        // return listType == ListType.searchHistory 
        // ? SearchHistoryWidget(search: data[i])
        // : 
        return SearchResultsWidget(search: data[i]);
      }
    );
  }
}
