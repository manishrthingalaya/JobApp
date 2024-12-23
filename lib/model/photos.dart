class Photos {
  int page;
  int perPage;
  List<Photo> photos;
  int totalResults;
  String nextPage;

  Photos({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
    required this.nextPage,
  });

  // Factory constructor to create an instance from JSON
  factory Photos.fromJson(Map<String, dynamic> json) {
    return Photos(
      page: json['page'],
      perPage: json['per_page'],
      photos: (json['photos'] as List<dynamic>)
          .map((photoJson) => Photo.fromJson(photoJson))
          .toList(),
      totalResults: json['total_results'],
      nextPage: json['next_page'],
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'per_page': perPage,
      'photos': photos.map((photo) => photo.toJson()).toList(),
      'total_results': totalResults,
      'next_page': nextPage,
    };
  }
}

class Photo {
  int id;
  int width;
  int height;
  String url;
  String photographer;
  String photographerUrl;
  int photographerId;
  String avgColor;
  Src src;
  bool liked;
  String alt;

  Photo({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });

  // Factory constructor to create an instance from JSON
  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      photographer: json['photographer'],
      photographerUrl: json['photographer_url'],
      photographerId: json['photographer_id'],
      avgColor: json['avg_color'],
      src: Src.fromJson(json['src']),
      liked: json['liked'],
      alt: json['alt'],
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'url': url,
      'photographer': photographer,
      'photographer_url': photographerUrl,
      'photographer_id': photographerId,
      'avg_color': avgColor,
      'src': src.toJson(),
      'liked': liked,
      'alt': alt,
    };
  }
}

class Src {
  String original;
  String large2X;
  String large;
  String medium;
  String small;
  String portrait;
  String landscape;
  String tiny;

  Src({
    required this.original,
    required this.large2X,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  // Factory constructor to create an instance from JSON
  factory Src.fromJson(Map<String, dynamic> json) {
    return Src(
      original: json['original'],
      large2X: json['large2x'],
      large: json['large'],
      medium: json['medium'],
      small: json['small'],
      portrait: json['portrait'],
      landscape: json['landscape'],
      tiny: json['tiny'],
    );
  }

  // Method to convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'original': original,
      'large2x': large2X,
      'large': large,
      'medium': medium,
      'small': small,
      'portrait': portrait,
      'landscape': landscape,
      'tiny': tiny,
    };
  }
}
