import 'dart:convert';

import 'package:devfest_demo/home/home_provider.dart';
import 'package:devfest_demo/utils/dependency_injection.dart';
import 'package:devfest_demo/utils/devfest.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'index.dart';
import 'package:devfest_demo/models/index.dart';

class MockClient implements IClient {
  @override
  Future<MappedNetworkServiceResponse<T>> getAsync<T>(String resourcePath, {bool customHeaders = false}) async {
    var resultClass;
    String rawString;

    //? For Speakers Hardcoded Data
    if (resourcePath == HomeProvider.kConstGetSpeakersUrl) {
      if (Injector().currentDataMode == DataMode.DART) {
        rawString = jsonEncode(SpeakersData(speakers: speakers));
      }
      else {
        rawString = await rootBundle.loadString(Devfest.speakersAssetJson);
      }
      resultClass = await compute(jsonParserIsolate, rawString);
    }

    //? For Sessions Hardcoded Data
    else if (resourcePath == HomeProvider.kConstGetSessionsUrl) {
      if (Injector().currentDataMode == DataMode.DART) {
        rawString = jsonEncode(SessionsData(sessions: sessions));
      }
      else {
        rawString = await rootBundle.loadString(Devfest.sessionsAssetJson);
      }
      resultClass = await compute(jsonParserIsolate, rawString);
    }

    //? For Teams Hardcoded Data
    else if (resourcePath == HomeProvider.kConstGetTeamsUrl) {
      if (Injector().currentDataMode == DataMode.DART) {
        rawString = jsonEncode(TeamsData(teams: teams));
      }
      else {
        rawString = await rootBundle.loadString(Devfest.teamsAssetJson);
      }
      resultClass = await compute(jsonParserIsolate, rawString);
    }

    return MappedNetworkServiceResponse<T>(
      mappedResult: resultClass,
      networkServiceResponse: NetworkServiceResponse<T>(success: true),
    );
  }
  
  @override
  Future<MappedNetworkServiceResponse<T>> postAsync<T>(String resourcePath, data, {bool customHeaders = false}) async {
    return MappedNetworkServiceResponse(
      networkServiceResponse: NetworkServiceResponse()
    );
  }

  static Map<String, dynamic> jsonParserIsolate(String res) {
    return jsonDecode(res);
  }
}