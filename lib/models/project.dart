class Project {
  Project({
    required this.title,
    required this.index,
    required this.link,
    required this.images,
    required this.tools,
    required this.gitHub,
    required this.logo,
  });

  final String title;
  final int index;
  final String images;
  final List<String> tools;
  final String link;
  final String gitHub;
  final String logo;
}
