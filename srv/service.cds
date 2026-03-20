using { CAPM1 as my } from '../db/schema.cds';

@path: '/service/cAPM1'
@requires: 'authenticated-user'
service cAPM1Srv {
  @odata.draft.enabled
  entity Store as projection on my.Store;
  entity OpeningHours as projection on my.OpeningHours{
    *,
    virtual null as calendarDate: Date,
    virtual null as statusText: String,
    virtual null as criticality: Integer
  };
  entity Products as projection on my.Products;
  entity PriceDetails as projection on my.PriceDetails;
  entity Festivals as projection on my.Festivals;
}