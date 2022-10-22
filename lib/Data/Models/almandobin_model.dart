class RepresentativeModel {
  String? name;
  String? branch;
  String? delegateType;
  String? classification;
  String? admin;
  String? region;
  String? phoneNumber;
  String? condition;
  String? effect;


  RepresentativeModel({
    this.name,
    this.branch,
    this.delegateType,
    this.classification,
    this.admin,
    this.region,
    this.phoneNumber,
    this.condition,
    this.effect,

  });

  RepresentativeModel.fromJson ( Map <String, dynamic>  json)
  {
    name = json ['name'];
    branch = json ['branch'];
    delegateType = json ['delegateType'];
    classification = json ['classification'];
    admin = json ['admin'];
    region = json ['region'];
    phoneNumber = json ['phoneNumber'];
    condition = json ['condition'];
    effect = json ['effect'];



  }

  Map <String, dynamic> toMap()
  {
    return {
      'name':name,
      'branch':branch,
      'delegateType':delegateType,
      'classification':classification,
      'admin':admin,
      'region':region,
      'phoneNumber':phoneNumber,
      'condition':condition,
      'effect':effect

    };
  }
}