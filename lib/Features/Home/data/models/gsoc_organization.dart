class GsocOrganization {
  final String name;
  final String image_url;
  final String image_background_color;
  final String description;
  final String url;
  final String category;
  final String contact_email;
  final String mailing_list;
  final String twitter_url;
  final String blog_url;
  final String irc_channel;
  final String technologies;
  final String topics;
  final Map<String, dynamic> years;
  final List<dynamic> techList ;
  final List<dynamic> topicsList;
  List<Map<String, dynamic>> allProjects = [];

  GsocOrganization(
      {required this.name,
      required this.image_url,
      required this.image_background_color,
      required this.description,
      required this.url,
      required this.category,
      required this.contact_email,
      required this.mailing_list,
      required this.twitter_url,
      required this.blog_url,
      required this.technologies,
      required this.topics,
      required this.years,
      required this.irc_channel,
      required this.techList,
      required this.topicsList }) {
    List<Map<String, dynamic>> temp = [];
    for (var everyYear in years.entries) {
      for (var everyProject in everyYear.value["projects"]) {
        temp.add(everyProject);
      }
    }

    this.allProjects = temp;
  }

  factory GsocOrganization.fromJson(Map<String, dynamic> data) {
    final name = data["name"] as String;
    final imageUrl = data["image_url"] as String;
    final imageBackgroundColor = data["image_background_color"] as String;
    final description = data["description"] as String;
    final url = data["url"] as String;
    final category = data["category"] as String;
    final contactEmail = data["contact_email"] as String;
    final mailingList = data["mailing_list"] as String;
    final twitterUrl = data["twitter_url"] as String;
    final blogUrl = data["blog_url"] as String;
    final irc_channel = data["irc_channel"] as String;
    final techList = data["technologies"] as List<dynamic>;
    final topicsList = data["topics"] as List<dynamic>;
    final technologies = convertListToStringWithoutBracket(
        data["technologies"] as List<dynamic>);
    final topics =
        convertListToStringWithoutBracket(data["topics"] as List<dynamic>);
    final years = data["years"] as Map<String, dynamic>;

    return GsocOrganization(
        name: name,
        image_url: imageUrl,
        image_background_color: imageBackgroundColor,
        description: description,
        url: url,
        category: category,
        contact_email: contactEmail,
        mailing_list: mailingList,
        twitter_url: twitterUrl,
        blog_url: blogUrl,
        technologies: technologies,
        years: years,
        topics: topics,
        irc_channel: irc_channel,
        techList:techList,
        topicsList: topicsList
        );
  }

  static String convertListToStringWithoutBracket(List<dynamic> anyList) {
    String s = anyList.toString();
    s = s.substring(1, s.length - 2);
    return s;
  }
}
