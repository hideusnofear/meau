class Consent {
  ConsentAcess data;
  Risk risk;
  Link link;
  Meta meta;
  Consent({this.data, this.risk, this.link, this.meta});
  factory Consent.fromJson(Map<String, dynamic> parsedJson) {
    return Consent(
      data: ConsentAcess.fromJson(parsedJson['Data']),
      link: Link.fromJson(parsedJson['Links']),
    );
  }
}

class Risk {}

class Link {
  String self;
  Link({this.self});
  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      self: json['Self'],
    );
  }
}

class Meta {}

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
      permissions: json['Permissions'] != null
          ? List<String>.from(json['Permissions'])
          : null,
      consentId: json['ConsentId'],
      creationDateTime: json['CreationDateTime'],
      status: json['Status'],
      statusUpdateDateTime: json['StatusUpdateDateTime'],
    );
  }
}
