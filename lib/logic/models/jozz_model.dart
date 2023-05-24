class JozzModel {
  final int jozzNum;
  final String? assignedUser;

  JozzModel({required this.jozzNum, this.assignedUser});

  factory JozzModel.fromJson(Map<String, dynamic> json) {
    return JozzModel(
      jozzNum: json['number'] as int,
      assignedUser: json['assigned_user'] as String?,
    );
  }
}
