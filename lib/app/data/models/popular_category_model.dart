class ListPopularCategory {
  List<PopularCategory>? popularCategory;

  ListPopularCategory({this.popularCategory});

  ListPopularCategory.fromJson(Map<String, dynamic> json) {
    if (json['popularCategory'] != null) {
      popularCategory = <PopularCategory>[];
      json['popularCategory'].forEach((v) {
        popularCategory!.add(PopularCategory.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (popularCategory != null) {
      data['popularCategory'] =
          popularCategory!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PopularCategory {
  String? name;

  PopularCategory({this.name});

  PopularCategory.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    return data;
  }
}
