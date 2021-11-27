// To parse this JSON data, do
//
//     final comicModelResponse = comicModelResponseFromMap(jsonString);

import 'dart:convert';

ComicModelResponse comicModelResponseFromMap(String str) =>
    ComicModelResponse.fromMap(json.decode(str));

String comicModelResponseToMap(ComicModelResponse data) =>
    json.encode(data.toMap());

class ComicModelResponse {
  ComicModelResponse({
    required this.error,
    required this.limit,
    required this.offset,
    required this.numberOfPageResults,
    required this.numberOfTotalResults,
    required this.statusCode,
    required this.results,
    required this.version,
  });

  String error;
  int limit;
  int offset;
  int numberOfPageResults;
  int numberOfTotalResults;
  int statusCode;
  List<Comic>? results;
  String version;

  factory ComicModelResponse.fromMap(Map<String, dynamic> json) =>
      ComicModelResponse(
        error: json["error"] == null ? null : json["error"],
        limit: json["limit"] == null ? null : json["limit"],
        offset: json["offset"] == null ? null : json["offset"],
        numberOfPageResults: json["number_of_page_results"] == null
            ? null
            : json["number_of_page_results"],
        numberOfTotalResults: json["number_of_total_results"] == null
            ? null
            : json["number_of_total_results"],
        statusCode: json["status_code"] == null ? null : json["status_code"],
        results: json["results"] == null
            ? null
            : List<Comic>.from(json["results"].map((x) => Comic.fromMap(x))),
        version: json["version"] == null ? null : json["version"],
      );

  Map<String, dynamic> toMap() => {
        "error": error == null ? null : error,
        "limit": limit == null ? null : limit,
        "offset": offset == null ? null : offset,
        "number_of_page_results":
            numberOfPageResults == null ? null : numberOfPageResults,
        "number_of_total_results":
            numberOfTotalResults == null ? null : numberOfTotalResults,
        "status_code": statusCode == null ? null : statusCode,
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toMap())),
        "version": version == null ? null : version,
      };
}

class Comic {
  Comic({
    this.aliases,
    this.apiDetailUrl,
    this.coverDate,
    this.dateAdded,
    this.dateLastUpdated,
    this.deck,
    this.description,
    this.hasStaffReview,
    this.id,
    this.image,
    this.issueNumber,
    this.name,
    this.siteDetailUrl,
    this.storeDate,
    this.volume,
  });

  String? aliases;
  String? apiDetailUrl;
  DateTime? coverDate;
  DateTime? dateAdded;
  DateTime? dateLastUpdated;
  String? deck;
  String? description;
  bool? hasStaffReview;
  int? id;
  Image? image;
  String? issueNumber;
  String? name;
  String? siteDetailUrl;
  DateTime? storeDate;
  Volume? volume;

  factory Comic.fromMap(Map<String, dynamic> json) => Comic(
        aliases: json["aliases"],
        apiDetailUrl:
            json["api_detail_url"] == null ? null : json["api_detail_url"],
        coverDate: json["cover_date"] == null
            ? null
            : DateTime.parse(json["cover_date"]),
        dateAdded: json["date_added"] == null
            ? null
            : DateTime.parse(json["date_added"]),
        dateLastUpdated: json["date_last_updated"] == null
            ? null
            : DateTime.parse(json["date_last_updated"]),
        deck: json["deck"],
        description: json["description"] == null ? null : json["description"],
        hasStaffReview:
            json["has_staff_review"] == null ? null : json["has_staff_review"],
        id: json["id"] == null ? null : json["id"],
        image: json["image"] == null ? null : Image.fromMap(json["image"]),
        issueNumber: json["issue_number"] == null ? null : json["issue_number"],
        name: json["name"] == null ? null : json["name"],
        siteDetailUrl:
            json["site_detail_url"] == null ? null : json["site_detail_url"],
        storeDate: json["store_date"] == null
            ? null
            : DateTime.parse(json["store_date"]),
        volume: json["volume"] == null ? null : Volume.fromMap(json["volume"]),
      );

  Map<String, dynamic> toMap() => {
        "aliases": aliases,
        "api_detail_url": apiDetailUrl == null ? null : apiDetailUrl,
        "cover_date": coverDate == null
            ? null
            : "${coverDate!.year.toString().padLeft(4, '0')}-${coverDate!.month.toString().padLeft(2, '0')}-${coverDate!.day.toString().padLeft(2, '0')}",
        "date_added": dateAdded == null ? null : dateAdded!.toIso8601String(),
        "date_last_updated":
            dateLastUpdated == null ? null : dateLastUpdated!.toIso8601String(),
        "deck": deck,
        "description": description == null ? null : description,
        "has_staff_review": hasStaffReview == null ? null : hasStaffReview,
        "id": id == null ? null : id,
        "image": image == null ? null : image!.toMap(),
        "issue_number": issueNumber == null ? null : issueNumber,
        "name": name == null ? null : name,
        "site_detail_url": siteDetailUrl == null ? null : siteDetailUrl,
        "store_date": storeDate == null
            ? null
            : "${storeDate!.year.toString().padLeft(4, '0')}-${storeDate!.month.toString().padLeft(2, '0')}-${storeDate!.day.toString().padLeft(2, '0')}",
        "volume": volume == null ? null : volume!.toMap(),
      };
}

class Image {
  Image({
    this.iconUrl,
    this.mediumUrl,
    this.screenUrl,
    this.screenLargeUrl,
    this.smallUrl,
    this.superUrl,
    this.thumbUrl,
    this.tinyUrl,
    this.originalUrl,
    this.imageTags,
  });

  String? iconUrl;
  String? mediumUrl;
  String? screenUrl;
  String? screenLargeUrl;
  String? smallUrl;
  String? superUrl;
  String? thumbUrl;
  String? tinyUrl;
  String? originalUrl;
  ImageTags? imageTags;

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        iconUrl: json["icon_url"] == null ? null : json["icon_url"],
        mediumUrl: json["medium_url"] == null ? null : json["medium_url"],
        screenUrl: json["screen_url"] == null ? null : json["screen_url"],
        screenLargeUrl:
            json["screen_large_url"] == null ? null : json["screen_large_url"],
        smallUrl: json["small_url"] == null ? null : json["small_url"],
        superUrl: json["super_url"] == null ? null : json["super_url"],
        thumbUrl: json["thumb_url"] == null ? null : json["thumb_url"],
        tinyUrl: json["tiny_url"] == null ? null : json["tiny_url"],
        originalUrl: json["original_url"] == null ? null : json["original_url"],
        imageTags: json["image_tags"] == null
            ? null
            : imageTagsValues.map[json["image_tags"]],
      );

  Map<String, dynamic> toMap() => {
        "icon_url": iconUrl == null ? null : iconUrl,
        "medium_url": mediumUrl == null ? null : mediumUrl,
        "screen_url": screenUrl == null ? null : screenUrl,
        "screen_large_url": screenLargeUrl == null ? null : screenLargeUrl,
        "small_url": smallUrl == null ? null : smallUrl,
        "super_url": superUrl == null ? null : superUrl,
        "thumb_url": thumbUrl == null ? null : thumbUrl,
        "tiny_url": tinyUrl == null ? null : tinyUrl,
        "original_url": originalUrl == null ? null : originalUrl,
        "image_tags":
            imageTags == null ? null : imageTagsValues.reverse![imageTags],
      };
}

enum ImageTags { ALL_IMAGES }

final imageTagsValues = EnumValues({"All Images": ImageTags.ALL_IMAGES});

class Volume {
  Volume({
    this.apiDetailUrl,
    this.id,
    this.name,
    this.siteDetailUrl,
  });

  String? apiDetailUrl;
  int? id;
  String? name;
  String? siteDetailUrl;

  factory Volume.fromMap(Map<String, dynamic> json) => Volume(
        apiDetailUrl:
            json["api_detail_url"] == null ? null : json["api_detail_url"],
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        siteDetailUrl:
            json["site_detail_url"] == null ? null : json["site_detail_url"],
      );

  Map<String, dynamic> toMap() => {
        "api_detail_url": apiDetailUrl == null ? null : apiDetailUrl,
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "site_detail_url": siteDetailUrl == null ? null : siteDetailUrl,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
