class Tenant {
  final int? id;
  final String? name;
  final String? createBy;
  final String? createTime;
  final String? beginDate;
  final String? endDate;
  final String? status;
  final String? trade;
  final String? companySize;
  final String? companyAddress;
  final String? companyLogo;
  final String? houseNumber;
  final String? workPlace;
  final String? secondaryDomain;
  final String? loginBkgdImg;
  final String? position;
  final String? department;
  final String? delFlag;
  final String? updateBy;
  final String? updateTime;
  final String? applyStatus;

  Tenant({
    this.id,
    this.name,
    this.createBy,
    this.createTime,
    this.beginDate,
    this.endDate,
    this.status,
    this.trade,
    this.companySize,
    this.companyAddress,
    this.companyLogo,
    this.houseNumber,
    this.workPlace,
    this.secondaryDomain,
    this.loginBkgdImg,
    this.position,
    this.department,
    this.delFlag,
    this.updateBy,
    this.updateTime,
    this.applyStatus,
  });

  factory Tenant.fromJson(Map<String, dynamic> json) => Tenant(
        id: json["id"],
        name: json["name"],
        createBy: json["createBy"],
        createTime: json["createTime"],
        beginDate: json["beginDate"],
        endDate: json["endDate"],
        status: json["status"],
        trade: json["trade"],
        companySize: json["companySize"],
        companyAddress: json["companyAddress"],
        companyLogo: json["companyLogo"],
        houseNumber: json["houseNumber"],
        workPlace: json["workPlace"],
        secondaryDomain: json["secondaryDomain"],
        loginBkgdImg: json["loginBkgdImg"],
        position: json["position"],
        department: json["department"],
        delFlag: json["delFlag"],
        updateBy: json["updateBy"],
        updateTime: json["updateTime"],
        applyStatus: json["applyStatus"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "createBy": createBy,
        "createTime": createTime,
        "beginDate": beginDate,
        "endDate": endDate,
        "status": status,
        "trade": trade,
        "companySize": companySize,
        "companyAddress": companyAddress,
        "companyLogo": companyLogo,
        "houseNumber": houseNumber,
        "workPlace": workPlace,
        "secondaryDomain": secondaryDomain,
        "loginBkgdImg": loginBkgdImg,
        "position": position,
        "department": department,
        "delFlag": delFlag,
        "updateBy": updateBy,
        "updateTime": updateTime,
        "applyStatus": applyStatus,
      };
}
