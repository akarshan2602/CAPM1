using { CAPM1 as my } from '../db/schema.cds';

@path: '/service/cAPM1'
// @requires: 'authenticated-user'
service cAPM1Srv {
  @odata.draft.enabled
  entity Store as projection on my.Store;
  // Requirement Main Entity to Procus with Store name and price
  annotate cAPM1Srv.Store with @(
    Common.SemanticObject: 'Store'

  );
  
  entity OpeningHours as projection on my.OpeningHours{
    *,
    virtual null as calendarDate: Date,
    virtual null as statusText: String,
    virtual null as criticality: Integer
  };
  @cds.redirection.target entity Products as projection on my.Products;
  entity PriceDetails as projection on my.PriceDetails;
  entity Festivals as projection on my.Festivals;
    @readonly
    // @cds.redirection.target
    // @odata.draft.enabled
  entity ProductCatalog as projection on my.ProductCatalogView{
    *,
    store: redirected to Store,
    priceDetails: redirected to PriceDetails
  };
}
