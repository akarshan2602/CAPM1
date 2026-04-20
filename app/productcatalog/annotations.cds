// using cAPM1Srv as service from '../../srv/service';

using { cAPM1Srv } from '../../srv/service';

//---STORE UI----

annotate cAPM1Srv.Store with @(
  UI.LineItem : [
    {Value : name}, {Value : city}, {Value : emailId}
  ],
  UI.HeaderInfo: {TypeName: 'Store', TypeNamePlural: 'Stores', Title : {Value : name}},
  UI.Facets : [
    {
      $Type: 'UI.ReferenceFacet', Label: 'Genera Info', Target: '@UI.FieldGroup#Main'
    },
     {
      $Type: 'UI.ReferenceFacet', Label: 'Products', Target: 'products/@UI.LineItem'
    },
    {
      $Type: 'UI.ReferenceFacet', Label: 'Opening Hours', Target: 'openingHours/@UI.LineItem'
    }
  ],
  UI.FieldGroup#Main :{
    Data: [{Value : name}, {Value: city}, {Value: state}, {Value: country}, {Value: phone}, {Value: emailId}]
  }
) ;
annotate cAPM1Srv.Store with @(
  Consumption.semanticObject: 'Store'
);
//Opening Hours

annotate cAPM1Srv.OpeningHours with @(
  UI.LineItem: [
    {Value: calendarDate, Label: 'Date'},
    {Value: day, Label: 'Day'},
    {Value: openingTime, Label: 'Opening Time'},
    {Value: closingTime, Label: 'Closing Time'},
    {Value: statusText, Label: 'Shop Status', Criticality: statusCriticality}
  ],
);

annotate cAPM1Srv.Products with @(
  UI.LineItem:[
    {Value: productsID},
    {
      $Type: 'UI.DataFieldWithNavigationPath',
      Value: name,
      Target: 'priceDetails',
    },
    {Value: UOM},
    {Value: availableQty, Criticality: stockLevel}
  ],
   UI.HeaderInfo: {
    TypeName: 'Product', TypeNamePlural: 'Products', Title: {Value:productsID}
  },
  UI.Facets: [
    {  $Type: 'UI.ReferenceFacet', Label: 'Genera Info', Target: '@UI.FieldGroup#Main'},
    { $Type: 'UI.ReferenceFacet', Label: 'Price Details', Target: 'priceDetails/@UI.LineItem'}
  ],
   UI.FieldGroup #Main:{
    Data: [{Value : productsID}, {Value: city}, {Value: UOM}, {Value: availableQty}]
  }
);

annotate cAPM1Srv.ProductCatalog with @(
  // ==========================
  // Header Information
  // ==========================
  UI.HeaderInfo: {
    TypeName       : 'Product',
    TypeNamePlural : 'Global Product Catalog',
    Title          : { Value: productName }
  },

  // ==========================
  // Facets (Sections)
  // ==========================
  UI.Facets: [
    {
      $Type  : 'UI.ReferenceFacet',
      Label  : 'Store & Pricing Information',
      Target : '@UI.FieldGroup#CombinedDetails'
    },
    {
      $Type  : 'UI.ReferenceFacet',
      Label  : 'Store Details',
      Target : '@UI.Identification'
    }
  ],

  // ==========================
  // ✅ CLICKABLE STORE LINK
  // ✅ REAL REDIRECT TO /Store(<ID>)
  // ==========================
  UI.Identification: [
    {
      $Type          : 'UI.DataFieldWithIntentBasedNavigation',
      Value          : storeName,
      Label          : 'View Store Timing & Details',
      SemanticObject : 'Store',
      Action         : 'display'
    }
  ],

  // ==========================
  // Main FieldGroup (display ONLY)
  // ==========================
  UI.FieldGroup#CombinedDetails: {
    Data: [
      { Value: productName, Label: 'Product Name' },
      { Value: Price,       Label: 'Current Price' },
      { Value: UOM,         Label: 'Unit of Measure' },
      { Value: storeName,   Label: 'Store' }
    ]
  },

  // ==========================
  // List Report Table
  // ✅ Store column now redirects to Store
  // ==========================
  UI.LineItem: [
    { Value: productName, Label: 'Product' },

    {
      $Type          : 'UI.DataFieldWithIntentBasedNavigation',
      Value          : storeName,
      Label          : 'Store',
      SemanticObject : 'Store',
      Action         : 'display'
    },

    { Value: Price, Label: 'Price' }
  ],

  // ==========================
  // Filters
  // ==========================
  UI.SelectionFields: [
    productName,
    storeName
  ]
);
// ----current UI------

// ---PRICING DETAILS UI-----------

annotate cAPM1Srv.PriceDetails with @(
  UI.LineItem :[
    {Value: validFrom}, {Value: validTo}, {Value: price}, {Value: quantity}, {Value: UOM}
  ]
);
