class AppConfig {
  String dateTime;
  bool appUpdate;
  bool forceUpdate;

  AppConfig(this.dateTime, this.appUpdate, this.forceUpdate);

  AppConfig.fromJson(Map<String, dynamic> json) {
    dateTime = json['dateTime'];
    appUpdate = json['appUpdate'];
    forceUpdate = json['forceUpdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateTime'] = this.dateTime;
    data['appUpdate'] = this.appUpdate;
    data['forceUpdate'] = this.forceUpdate;

    return data;
  }
}
