class ClintModel {
  String? uId;
  String? name;
  String? branch;
  String? status;
  String? region;
  String? phoneNumber;
  String? debtor;
  String? creditor;
  String? condition;
  String? effect;



  ClintModel({
    this.uId,
    this.name,
    this.branch,
    this.region,
    this.phoneNumber,
    this.debtor,
    this.creditor,
    this.condition,
    this.effect,
    this.status,
  });

  ClintModel.fromJson ( Map <String, dynamic>  json)
  {
    uId = json ['uId'];
    name = json ['name'];
    branch = json ['branch'];
    region = json ['region'];
    phoneNumber = json ['phoneNumber'];
    debtor = json ['debtor'];
    creditor = json ['creditor'];
    condition = json ['condition'];
    effect = json ['effect'];
    status = json ['status'];
  }

  Map <String, dynamic> toMap()
  {
    return {
      'uId':uId,
      'name':name,
      'branch':branch,
      'region':region,
      'phoneNumber':phoneNumber,
      'debtor':debtor,
      'creditor':creditor,
      'condition':condition,
      'effect':effect,
      'status':status
    };
  }
}