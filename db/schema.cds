namespace CAPM1;
using {  cuid , Currency } from '@sap/cds/common';
@assert.unique: { name: [name] }
entity Store : cuid  {
  name: String(100) @mandatory;
  city: String(50);
  state: String(50);
  country: String(50);
  phone: String(15);
  emailId: String(100);
  openingDate: Date;
  closingDate: Date;
  openingHours: Composition of many OpeningHours on openingHours.store = $self;
  products: Composition of many Products on products.store = $self;
}

entity OpeningHours : cuid  {
  day: String(10) @mandatory;
  isClosed: Boolean;
  openingTime: Time;
  closingTime: Time;
  store: Association to Store;
  // Colored notations for Closed/Open
  virtual statusText: String;
  virtual statusCriticality: Integer;
}

entity Festivals: cuid { 
  keyID : UUID;
  name: String;
  date: Date;
  isClosed: Boolean;
  openingTime: Time;
  closingTime: Time;
  store: Association to Store;
}

@assert.unique: { productsID: [productsID] }
entity Products : cuid  {
  productsID: String(50) @mandatory;
  name: String(100);
  UOM: String(10);
  availableQty: Integer;
  store: Association to Store;
  priceDetails: Composition of many PriceDetails on priceDetails.product = $self;
  price: Association to PriceDetails;
  virtual stockLevel: Integer
}

entity PriceDetails : cuid  {
  validFrom: Date;
  validTo: Date;
  price: Decimal(10,2);
  currency: Currency;
  quantity: Integer;
  UOM: String(10);
  product: Association to Products;
}

 entity ProductCatalogView as select from Products{
    key ID,
    productsID,
  name as productName,
  UOM,
  priceDetails.price as Price,
  store.name as storeName,
  store: Association to Store on store.ID = $self.store.ID,
  priceDetails
}

// entity ProductCatalogView as select Products {
//    key ID,
//   productsID,
//   name as productName,
//   UOM,
//   priceDetails.price as Price,
//   store.name as storeName,
//   store: Association Store,
//   priceDetails
// }