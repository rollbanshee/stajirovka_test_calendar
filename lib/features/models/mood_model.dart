class MoodModel {
  int id;
  String name;
  String image;
  bool isActive;
  bool isWrapActive;

  Map<String, bool> podMoods;

  MoodModel(this.id, this.name, this.image, this.isActive, this.podMoods,
      this.isWrapActive);
}
