import 'package:json_annotation/json_annotation.dart';

class OttItem {
  ///  @SerializedName("provider_id")
//     private int provider_id;
//     @SerializedName("logo_path")
//     private String logo_path;
//     @SerializedName("provider_name")
//     private String provider_name;
//     @SerializedName("display_priority")
//     private int display_priority;

  @JsonKey(name: 'logo_path')
  String logoPath;

  @JsonKey(name: 'provider_id')
  int providerId;

  @JsonKey(name: 'provider_name')
  String providerName;

  @JsonKey(name: 'display_priority')
  int displayPriority;

//<editor-fold desc="Data Methods">
  OttItem({
    required this.logoPath,
    required this.providerId,
    required this.providerName,
    required this.displayPriority,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OttItem &&
          runtimeType == other.runtimeType &&
          logoPath == other.logoPath &&
          providerId == other.providerId &&
          providerName == other.providerName &&
          displayPriority == other.displayPriority);

  @override
  int get hashCode => logoPath.hashCode ^ providerId.hashCode ^ providerName.hashCode ^ displayPriority.hashCode;

  @override
  String toString() {
    return 'OttItem{ logoPath: $logoPath, providerId: $providerId, providerName: $providerName, displayPriority: $displayPriority,}';
  }

  OttItem copyWith({
    String? logoPath,
    int? providerId,
    String? providerName,
    int? displayPriority,
  }) {
    return OttItem(
      logoPath: logoPath ?? this.logoPath,
      providerId: providerId ?? this.providerId,
      providerName: providerName ?? this.providerName,
      displayPriority: displayPriority ?? this.displayPriority,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'logoPath': logoPath,
      'providerId': providerId,
      'providerName': providerName,
      'displayPriority': displayPriority,
    };
  }

  factory OttItem.fromJson(Map<String, dynamic> json) {
    return OttItem(
      logoPath: json['logoPath'] as String,
      providerId: json['providerId'] as int,
      providerName: json['providerName'] as String,
      displayPriority: json['displayPriority'] as int,
    );
  }

//</editor-fold>
}
