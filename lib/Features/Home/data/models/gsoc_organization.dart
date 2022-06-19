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


  GsocOrganization({required this.name, required this.image_url,required this.image_background_color,required this.description,required this.url,required this.category,required this.contact_email,required this.mailing_list,required this.twitter_url,required this.blog_url});

  factory GsocOrganization.fromJson(Map<String, dynamic> data) {
    final name = data["name"] as String;
    final image_url = data["image_url"] as String;
    final image_background_color = data["image_background_color"] as String;
    final description = data["description"] as String;
    final url = data["url"] as String;
    final category = data["category"] as String;
    final contact_email = data["contact_email"] as String;
    final mailing_list = data["mailing_list"] as String;
    final twitter_url = data["twitter_url"] as String;
    final blog_url = data["blog_url"] as String;

    return GsocOrganization(name: name, image_url: image_url,image_background_color: image_background_color,description: description,url: url,category: category,contact_email: contact_email, mailing_list: mailing_list,twitter_url: twitter_url,blog_url: blog_url);
  }
}






// "irc_channel": "string",



