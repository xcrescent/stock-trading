import 'package:flutter/material.dart';

import 'package:stock_trading/shared/colors.dart';


class Profile extends StatelessWidget {
  final String symbol;

  const Profile({
    super.key,
    required this.symbol,
  });

  @override
  Widget build(BuildContext context) {
    // return BlocBuilder<ProfileBloc, ProfileState>(
    //     builder: (BuildContext context, ProfileState state) {
    //   if (state is ProfileLoadingError) {
    //     return Scaffold(
    //         appBar: AppBar(
    //           backgroundColor: kNegativeColor,
    //           title: Text(':('),
    //         ),
    //         backgroundColor: kScaffoldBackground,
    //         body: Center(child: EmptyScreen(message: state.error)));
    //   }

    //   if (state is ProfileLoaded) {
    //     return ProfileScreen(
    //         isSaved: state.isSymbolSaved,
    //         profile: state.profileModel,
    //         color: determineColorBasedOnChange(
    //             state.profileModel.stockProfile.changes));
    //   }

      return Scaffold(
          backgroundColor: kScaffoldBackground,
          body: CircularProgressIndicator());
    // },
    // );
  }
}
