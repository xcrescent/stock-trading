import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stock_trading/helpers/sentry_helper.dart';
import 'package:stock_trading/models/profile/profile.dart';
import 'package:stock_trading/respository/profile/client.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final _httpClient = ProfileClient();
  @override
  ProfileState get initialState => ProfileInitial();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is FetchProfileData) {
      yield ProfileLoading();
      yield* _mapProfileState(symbol: event.symbol);
    }
  }

  Stream<ProfileState> _mapProfileState({required String symbol}) async* {
    try {
      yield ProfileLoaded(
        profileModel: await _httpClient.fetchStockData(symbol: symbol),
      );
    } catch (e, stack) {
      yield ProfileLoadingError(error: 'Symbol not supported.');
      await SentryHelper(exception: e, stackTrace: stack).report();
    }
  }
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
 
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  

  @override
  ProfileState get initialState => ProfileInitial();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    if (event is FetchProfileData) {
      yield ProfileLoading();
      yield* _mapProfileState(symbol: event.symbol);
    }
  }

  Stream<ProfileState> _mapProfileState({required String symbol}) async* {
    try {
      yield ProfileLoaded( 
        profileModel: await _httpClient.fetchStockData(symbol: symbol),
      );

    } catch (e, stack) {
      yield ProfileLoadingError(error: 'Symbol not supported.');
      await SentryHelper(exception: e,  stackTrace: stack).report();
    }
  }
}
