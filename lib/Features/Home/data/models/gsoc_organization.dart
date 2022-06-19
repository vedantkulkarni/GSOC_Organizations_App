class GsocOrganization {
  final String name;
  final String image_url;
  GsocOrganization({required this.name, required this.image_url});

  factory GsocOrganization.fromJson(Map<String, dynamic> data) {
    final name = data["name"] as String;
    final image_url = data["image_url"] as String;

    return GsocOrganization(name: name, image_url: image_url);
  }
}
