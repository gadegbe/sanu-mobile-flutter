class AzureUser {
  AzureUser({
    this.displayName = '',
    this.givenName = '',
    this.jobTitle = '',
    this.mobilePhone = '',
    this.officeLocation = '',
    this.surname = '',
    this.userPrincipalName = '',
  });

  factory AzureUser.fromJson(Map<String, dynamic> map) {
    return AzureUser(
      displayName: map['displayName'] as String? ?? '',
      givenName: map['givenName'] as String? ?? '',
      jobTitle: map['jobTitle'] as String? ?? '',
      mobilePhone: map['mobilePhone'] as String? ?? '',
      officeLocation: map['officeLocation'] as String? ?? '',
      surname: map['surname'] as String? ?? '',
      userPrincipalName: map['userPrincipalName'] as String? ?? '',
    );
  }

  final String displayName;
  final String givenName;
  final String jobTitle;
  final String mobilePhone;
  final String officeLocation;
  final String surname;
  final String userPrincipalName;

  Map<String, dynamic> toJson() {
    return {
      'displayName': displayName,
      'givenName': givenName,
      'jobTitle': jobTitle,
      'mobilePhone': mobilePhone,
      'officeLocation': officeLocation,
      'surname': surname,
      'userPrincipalName': userPrincipalName,
    };
  }
}
