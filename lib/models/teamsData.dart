import 'index.dart';

class TeamsData {
  List<Team> teams;

  TeamsData({required this.teams});

  TeamsData.fromJson(Map<String, dynamic> json) : teams = <Team>[] {
    if (json['teams'] != null) {
      json['teams'].forEach((v) {
        teams.add(Team.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['teams'] = this.teams.map((e) => e.toJson()).toList();
    return data;
  }
}

List<Team> teams = [
  Team(
    name: "Sundar Pichai",
    desc: "Organizer",
    contribution: "Google CEO",
    image:
        "https://pbs.twimg.com/profile_images/864282616597405701/M-FEJMZ0_400x400.jpg",
  ),
  Team(
    name: "Vrijraj",
    desc: "Co-Organizer",
    contribution: "Logistics and travels",
    image: "https://avatars2.githubusercontent.com/u/10599101?s=460&v=4",
  ),
  Team(
    name: "Larry Page",
    desc: "Co-Organizer",
    contribution: "Founder",
    image:
        "https://thumbor.forbes.com/thumbor/960x0/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5c76bcaaa7ea43100043c836%2F400x400.jpg%3Ffit%3Dscale%26background%3D000000",
  ),
  Team(
    name: "Pawan Kumar",
    desc: "Co-Organizer",
    contribution: "Developed the app",
    image:
        "https://avatars1.githubusercontent.com/u/12619420?s=400&u=eac38b075e4e4463edfb0f0a8972825cf7803d4c&v=4",
  ),
  Team(
    name: "Pawan Kumar",
    desc: "Organizer",
    contribution: "Developed the app",
    image:
        "https://avatars1.githubusercontent.com/u/12619420?s=400&u=eac38b075e4e4463edfb0f0a8972825cf7803d4c&v=4",
  ),
];
