class ConsentAcess {
  final List<String> permissions;
  final String consentId;
  final String creationDateTime;
  final String status;
  final String statusUpdateDateTime;

  ConsentAcess(
      {this.permissions,
      this.consentId,
      this.creationDateTime,
      this.status,
      this.statusUpdateDateTime});

  factory ConsentAcess.fromJson(Map<String, dynamic> json) {
    return ConsentAcess(
      permissions: json['Permissions'],
      consentId: json['ConsentId'],
      creationDateTime: json['CreationDateTime'],
      status: json['Status'],
      statusUpdateDateTime: json['StatusUpdateDateTime'],
    );
  }
}
