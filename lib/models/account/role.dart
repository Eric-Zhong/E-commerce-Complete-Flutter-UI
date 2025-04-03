class Role {
  final String id;
  final String roleName;
  final String roleCode;

  Role({
    required this.id,
    required this.roleName,
    required this.roleCode,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json['id'] as String,
        roleName: json['roleName'] as String,
        roleCode: json['roleCode'] as String,
      );

  static List<Role> fromListJson(List<Map<String, dynamic>> jsonArray) {
    return jsonArray.map((item) => Role.fromJson(item)).toList();
  }

  static List<Role> fromListResponseJson(
    Object? json,
  ) {
    List<dynamic> jsonArray = json as List<dynamic>;
    var l = jsonArray.map((element) {
      var json = element as Map<String, dynamic>;
      return Role.fromJson(json);
    }).toList();
    return l;
  }
}
