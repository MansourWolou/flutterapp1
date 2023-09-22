// To parse this JSON data, do
//
//     final File = FileFromJson(jsonString);

import 'dart:convert';

File FileFromJson(String str) => File.fromJson(json.decode(str));

String FileToJson(File data) => json.encode(data.toJson());

class File {
    String id;
    String bucketId;
    DateTime createdAt;
    DateTime updatedAt;
    List<String> permissions;
    String name;
    String signature;
    String mimeType;
    int sizeOriginal;
    int chunksTotal;
    int chunksUploaded;

    File({
        required this.id,
        required this.bucketId,
        required this.createdAt,
        required this.updatedAt,
        required this.permissions,
        required this.name,
        required this.signature,
        required this.mimeType,
        required this.sizeOriginal,
        required this.chunksTotal,
        required this.chunksUploaded,
    });

    factory File.fromJson(Map<String, dynamic> json) => File(
        id: json["\u0024id"],
        bucketId: json["bucketId"],
        createdAt: DateTime.parse(json["\u0024createdAt"]),
        updatedAt: DateTime.parse(json["\u0024updatedAt"]),
        permissions: List<String>.from(json["\u0024permissions"].map((x) => x)),
        name: json["name"],
        signature: json["signature"],
        mimeType: json["mimeType"],
        sizeOriginal: json["sizeOriginal"],
        chunksTotal: json["chunksTotal"],
        chunksUploaded: json["chunksUploaded"],
    );

    Map<String, dynamic> toJson() => {
        "\u0024id": id,
        "bucketId": bucketId,
        "\u0024createdAt": createdAt.toIso8601String(),
        "\u0024updatedAt": updatedAt.toIso8601String(),
        "\u0024permissions": List<dynamic>.from(permissions.map((x) => x)),
        "name": name,
        "signature": signature,
        "mimeType": mimeType,
        "sizeOriginal": sizeOriginal,
        "chunksTotal": chunksTotal,
        "chunksUploaded": chunksUploaded,
    };
}
