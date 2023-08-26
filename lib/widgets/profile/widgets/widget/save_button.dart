import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stock_trading/models/storage/storage.dart';

class WatchlistButtonWidget extends StatefulWidget {

  final Color color;
  final bool isSaved;
  final StorageModel storageModel;

  const WatchlistButtonWidget({super.key, 
    required this.color,
    required this.isSaved,
    required this.storageModel
  });

  @override
  State<WatchlistButtonWidget> createState() => _WatchlistButtonWidgetState();
}

class _WatchlistButtonWidgetState extends State<WatchlistButtonWidget> {

  late bool isSaved;
  late Color color;
  
  @override
  void initState() {
    isSaved = widget.isSaved;
    color = isSaved 
    ? widget.color 
    : const Color(0X88ffffff);

    super.initState();
  }

  @override
  void dispose() {
    isSaved ;
    color;

    super.dispose();
  }

  void changeState({required bool isSaved, required Color color}) {
    setState(() {
      this.isSaved = isSaved;
      this.color = color;
    });
  }

  // void onPressedHandler() {

  //   if (this.isSaved) {
  //     changeState(isSaved: false, color: Color(0X88ffffff));

  //     BlocProvider
  //     .of<PortfolioBloc>(context)
  //     .add(DeleteProfile(symbol: widget.storageModel.symbol));
  //   } else {
  //     changeState(isSaved: true, color: widget.color);

  //     BlocProvider
  //     .of<PortfolioBloc>(context)
  //     .add(SaveProfile(storageModel: this.widget.storageModel));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      icon: Icon(FontAwesomeIcons.solidBookmark, color: color), 
      onPressed: () => {}
    );
  }
}