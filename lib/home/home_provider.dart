import 'package:devfest_demo/models/index.dart';
import 'package:devfest_demo/network/IClient.dart';
import 'package:devfest_demo/utils/dependency_injection.dart';
import 'package:devfest_demo/utils/devfest.dart';

abstract class IHomeProvider {
  Future<SpeakersData> getSpeakers();
  Future<SessionsData> getSessions();
  Future<TeamsData> getTeams();
}

class HomeProvider implements IHomeProvider {
  IClient _client;

  static final String kConstGetSpeakersUrl =
      "${Devfest.baseUrl}/speaker-kol.json";

  //! Not Working
  static final String kConstGetSessionsUrl =
      "${Devfest.baseUrl}/session-kol.json";

  //! Not Working
  static final String kConstGetTeamsUrl = "${Devfest.baseUrl}/team-kol.json";

  HomeProvider(): _client = Injector().currentClient;

  @override
  Future<SpeakersData> getSpeakers() async {
    var result = await _client.getAsync(kConstGetSpeakersUrl);
    if (result.networkServiceResponse.success) {
      SpeakersData res = SpeakersData.fromJson(result.mappedResult);
      return res;
    }
    throw Exception(result.networkServiceResponse.message);
  }

  @override
  Future<SessionsData> getSessions() async {
    var result = await _client.getAsync(kConstGetSessionsUrl);
    if (result.networkServiceResponse.success) {
      SessionsData res = SessionsData.fromJson(result.mappedResult);
      return res;
    }
    throw Exception(result.networkServiceResponse.message);
  }

  @override
  Future<TeamsData> getTeams() async {
    var result = await _client.getAsync(kConstGetTeamsUrl);
    if (result.networkServiceResponse.success) {
      TeamsData res = TeamsData.fromJson(result.mappedResult);
      return res;
    }
    throw Exception(result.networkServiceResponse.message);
  }
}