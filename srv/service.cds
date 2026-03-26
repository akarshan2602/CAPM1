using { CAPM1 as my } from '../db/schema.cds';

@path: '/service/cAPM1'
// @requires: 'authenticated-user'
service cAPM1Srv {
  @odata.draft.enabled
  entity Store as projection on my.Store;
  // Requirement Main Entity to Procus with Store name and price

  entity OpeningHours as projection on my.OpeningHours{
    *,
    virtual null as calendarDate: Date,
    virtual null as statusText: String,
    virtual null as criticality: Integer
  };
  @cds.redirection.target entity Products as projection on my.Products;
  entity PriceDetails as projection on my.PriceDetails;
  entity Festivals as projection on my.Festivals;
  entity ProductCatalog as select from my.Products{
    key ID,
    productsID,
    name as productName,
    UOM,
    store.name as storeName,
    priceDetails.price as Price
  };
}
