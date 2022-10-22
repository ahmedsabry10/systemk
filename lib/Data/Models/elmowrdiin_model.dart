class SupplierModel {
  String? name;
  String? branch;
  String? region;
  String? phoneNumber;
  String? debtor;
  String? creditor;
  String? majorResource;
  String? status;
  String? condition;
  String? effect;



  SupplierModel({
    this.name,
    this.branch,
    this.region,
    this.phoneNumber,
    this.debtor,
    this.creditor,
    this.majorResource,
    this.condition,
    this.effect,
    this.status,
  });

  SupplierModel.fromJson ( Map <String, dynamic>  json)
  {
    name = json ['name'];
    branch = json ['branch'];
    region = json ['region'];
    phoneNumber = json ['phoneNumber'];
    debtor = json ['debtor'];
    creditor = json ['creditor'];
    majorResource = json ['majorResource'];
    condition = json ['condition'];
    effect = json ['effect'];
    status = json ['status'];



  }

  Map <String, dynamic> toMap()
  {
    return {
      'name':name,
      'branch':branch,
      'region':region,
      'phoneNumber':phoneNumber,
      'debtor':debtor,
      'creditor':creditor,
      'majorResource':majorResource,
      'condition':condition,
      'effect':effect,
      'status':status

    };
  }
}