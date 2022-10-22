class TypesModel {
  String? name;
  String? id;
  String? type;
  String? smallUnit;
  String? bigUnit;
  String? dateTime;
  String? openingCost;
  String? store;
  String? opiningStoreCost;
  String? limit;
  String? virtualSalesUnit;
  String? virtualPurchaseUnit;
  String? measurementUnit;
  String? itemCondition;
  String? effect;


  TypesModel({
    this.name,
    this.id,
    this.type,
    this.smallUnit,
    this.bigUnit,
    this.dateTime,
    this.openingCost,
    this.store,
    this.opiningStoreCost,
    this.limit,
    this.virtualSalesUnit,
    this.virtualPurchaseUnit,
    this.measurementUnit,
    this.itemCondition,
    this.effect,

  });

  TypesModel.fromJson ( Map <String, dynamic>  json)
  {
    name = json ['name'];
    id = json ['id'];
    type = json ['type'];
    smallUnit = json ['smallUnit'];
    bigUnit = json ['bigUnit'];
    dateTime = json ['dateTime'];
    openingCost = json ['openingCost'];
    store = json ['store'];
    opiningStoreCost = json ['opiningStoreCost'];
    limit = json ['limit'];
    virtualSalesUnit = json ['virtualSalesUnit'];
    virtualPurchaseUnit = json ['virtualPurchaseUnit'];
    measurementUnit = json ['measurementUnit'];
    itemCondition =json ['itemCondition'];
    effect =json ['effect'];




  }

  Map <String, dynamic> toMap()
  {
    return {
      'name':name,
      'id':id,
      'type':type,
      'smallUnit':smallUnit,
      'bigUnit':bigUnit,
      'dateTime':dateTime,
      'openingCost':openingCost,
      'store':store,
      'opiningStoreCost':opiningStoreCost,
      'limit':limit,
      'virtualSalesUnit':virtualSalesUnit,
      'virtualPurchaseUnit':virtualPurchaseUnit,
      'measurementUnit':measurementUnit,
      'itemCondition':itemCondition,
      'effect':effect,


    };
  }
}