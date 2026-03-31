using { cAPM1Srv } from '../srv/service.cds';

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
  UI.FieldGroup#Main:{
    Data: [{Value : name}, {Value: city}, {Value: state}, {Value: country}, {Value: phone}, {Value: emailId}]
  }
) ;
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
    UI.HeaderInfo:{
    TypeName: 'Product',
    TypeNamePlural: 'Global Product Catalog',
    Title: {Value: productName}
  },
     UI.Facets: [
      {
        $Type: 'UI.ReferenceFacet',
        Label: 'Store & Pricing Information',
        Target: '@UI.FieldGroup#CombinedDetails'
      },
    ],
    UI.FieldGroup #CombinedDetails:{
      Data:[
        {Value:productName, Label: 'Product Name'},
        {Value: Price, Label: 'Current Price'},
        {Value: UOM, Label: 'Unit of Measure'},
                // {Value: storeName, Label: 'Available at Store'},
        {
          $Type: 'UI.DataFieldWithIntentBasedNavigation',
          Value: storeName,
          Label: 'View Store Timing and Details',
          SemanticObject: 'store',
          Action: 'display'
        }
      ]
    },
  UI.SelectionFields :[
    productName,
    storeName
  ],
  UI.LineItem: [
    {Value: productName, Label: 'Product'},
    {Value: storeName, Label: 'Store'},
    {Value: Price, Label: 'Price'}
  ]
);
//---------------FESTIVALS UI----------------
annotate cAPM1Srv.Festivals with @(
  UI.LineItem: [
    { Value: name },
    { Value: date },
    { Value: isClosed },
    { Value: openingTime },
    { Value: closingTime }
  ]
);
// ----current UI------

// ---PRICING DETAILS UI-----------

annotate cAPM1Srv.PriceDetails with @(
  UI.LineItem :[
    {Value: validFrom}, {Value: validTo}, {Value: price}, {Value: quantity}, {Value: UOM}
  ]
);
