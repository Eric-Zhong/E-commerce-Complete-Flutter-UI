class UserInfo {
  String? id;
  String? username;
  String? realname;
  String? avatar;
  String? birthday;
  int? sex;
  String? email;
  String? phone;
  String? orgCode;
  int? loginTenantId;
  String? orgCodeTxt;
  int? status;
  int? delFlag;
  String? workNo;
  String? post;
  String? telephone;
  String? createBy;
  String? createTime;
  String? updateBy;
  String? updateTime;
  int? activitiSync;
  int? userIdentity;
  String? departIds;
  String? relTenantIds;
  String? clientId;
  String? homePath;
  String? postText;
  String? bpmStatus;
  bool? izBindThird;

  UserInfo({
    this.id,
    this.username,
    this.realname,
    this.avatar,
    this.birthday,
    this.sex,
    this.email,
    this.phone,
    this.orgCode,
    this.loginTenantId,
    this.orgCodeTxt,
    this.status,
    this.delFlag,
    this.workNo,
    this.post,
    this.telephone,
    this.createBy,
    this.createTime,
    this.updateBy,
    this.updateTime,
    this.activitiSync,
    this.userIdentity,
    this.departIds,
    this.relTenantIds,
    this.clientId,
    this.homePath,
    this.postText,
    this.bpmStatus,
    this.izBindThird,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      id: json['id'],
      username: json['username'],
      realname: json['realname'],
      avatar: json['avatar'],
      birthday: json['birthday'],
      sex: json['sex'],
      email: json['email'],
      phone: json['phone'],
      orgCode: json['orgCode'],
      loginTenantId: json['loginTenantId'],
      orgCodeTxt: json['orgCodeTxt'],
      status: json['status'],
      delFlag: json['delFlag'],
      workNo: json['workNo'],
      post: json['post'],
      telephone: json['telephone'],
      createBy: json['createBy'],
      createTime: json['createTime'],
      updateBy: json['updateBy'],
      updateTime: json['updateTime'],
      activitiSync: json['activitiSync'],
      userIdentity: json['userIdentity'],
      departIds: json['departIds'],
      relTenantIds: json['relTenantIds'],
      clientId: json['clientId'],
      homePath: json['homePath'],
      postText: json['postText'],
      bpmStatus: json['bpmStatus'],
      izBindThird: json['izBindThird'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'realname': realname,
      'avatar': avatar,
      'birthday': birthday,
      'sex': sex,
      'email': email,
      'phone': phone,
      'orgCode': orgCode,
      'loginTenantId': loginTenantId,
      'orgCodeTxt': orgCodeTxt,
      'status': status,
      'delFlag': delFlag,
      'workNo': workNo,
      'post': post,
      'telephone': telephone,
      'createBy': createBy,
      'createTime': createTime,
      'updateBy': updateBy,
      'updateTime': updateTime,
      'activitiSync': activitiSync,
      'userIdentity': userIdentity,
      'departIds': departIds,
      'relTenantIds': relTenantIds,
      'clientId': clientId,
      'homePath': homePath,
      'postText': postText,
      'bpmStatus': bpmStatus,
      'izBindThird': izBindThird,
    };
  }
}
