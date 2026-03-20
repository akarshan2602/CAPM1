using { cAPM1Srv } from '../srv/service.cds';



// annotate cAPM1Srv.Store with @UI.HeaderInfo: { TypeName: 'Store', TypeNamePlural: 'Stores', Title: { Value: name } };
// annotate cAPM1Srv.Store with {
//   ID @UI.Hidden @Common.Text: { $value: name, ![@UI.TextArrangement]: #TextOnly }
// };
// annotate cAPM1Srv.Store with @UI.Identification: [{ Value: name }];
// annotate cAPM1Srv.Store with {
//   name @title: 'Name';
//   city @title: 'City';
//   state @title: 'State';
//   country @title: 'Country';
//   phone @title: 'Phone';
//   emailId @title: 'Email ID';
//   openingDate @title: 'Opening Date';
//   closingDate @title: 'Closing Date';
//   // createdAt @title: 'Created At';
//   // createdBy @title: 'Created By';
//   // modifiedAt @title: 'Modified At';
//   // modifiedBy @title: 'Modified By'
// };

// annotate cAPM1Srv.Store with @UI.LineItem: [
//  { $Type: 'UI.DataField', Value: name },
//  { $Type: 'UI.DataField', Value: city },
//  { $Type: 'UI.DataField', Value: state },
//  { $Type: 'UI.DataField', Value: country },
//  { $Type: 'UI.DataField', Value: phone },
//  { $Type: 'UI.DataField', Value: emailId },
//  { $Type: 'UI.DataField', Value: openingDate },
//  { $Type: 'UI.DataField', Value: closingDate }
// ];

// annotate cAPM1Srv.Store with @UI.FieldGroup #Main: {
//   $Type: 'UI.FieldGroupType', Data: [
//  { $Type: 'UI.DataField', Value: name },
//  { $Type: 'UI.DataField', Value: city },
//  { $Type: 'UI.DataField', Value: state },
//  { $Type: 'UI.DataField', Value: country },
//  { $Type: 'UI.DataField', Value: phone },
//  { $Type: 'UI.DataField', Value: emailId },
//  { $Type: 'UI.DataField', Value: openingDate },
//  { $Type: 'UI.DataField', Value: closingDate },
//  { $Type: 'UI.DataField', Value: createdAt },
//  { $Type: 'UI.DataField', Value: createdBy },
//  { $Type: 'UI.DataField', Value: modifiedAt },
//  { $Type: 'UI.DataField', Value: modifiedBy }
//   ]
// };

// annotate cAPM1Srv.Store with {
//   openingHours @Common.Label: 'Opening Hours';
//   products @Common.Label: 'Products'
// };

// annotate cAPM1Srv.Store with @UI.Facets: [
//   { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
//   { $Type : 'UI.ReferenceFacet', ID : 'OpeningHours', Target : 'openingHours/@UI.LineItem' },
//   { $Type : 'UI.ReferenceFacet', ID : 'Products', Target : 'products/@UI.LineItem' }
// ];

// annotate cAPM1Srv.Store with @UI.SelectionFields: [
//   name
// ];

// annotate cAPM1Srv.OpeningHours with @UI.HeaderInfo: { TypeName: 'Opening Hour', TypeNamePlural: 'Opening Hours', Title: { Value: day } };
// annotate cAPM1Srv.OpeningHours with {
//   ID @UI.Hidden @Common.Text: { $value: day, ![@UI.TextArrangement]: #TextOnly }
// };
// annotate cAPM1Srv.OpeningHours with @UI.Identification: [{ Value: day }];
// annotate cAPM1Srv.OpeningHours with {
//   store @Common.ValueList: {
//     CollectionPath: 'Store',
//     Parameters    : [
//       {
//         $Type            : 'Common.ValueListParameterInOut',
//         LocalDataProperty: store_ID, 
//         ValueListProperty: 'ID'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'name'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'city'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'state'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'country'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'phone'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'emailId'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'openingDate'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'closingDate'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'createdAt'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'createdBy'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'modifiedAt'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'modifiedBy'
//       },
//     ],
//   }
// };
// annotate cAPM1Srv.OpeningHours with {
//   day @title: 'Day';
//   isClosed @title: 'Is Closed';
//   openingTime @title: 'Opening Time';
//   closingTime @title: 'Closing Time';
//   // createdAt @title: 'Created At';
//   // createdBy @title: 'Created By';
//   // modifiedAt @title: 'Modified At';
//   // modifiedBy @title: 'Modified By'
// };

// annotate cAPM1Srv.OpeningHours with @UI.LineItem: [
//  { $Type: 'UI.DataField', Value: day },
//  { $Type: 'UI.DataField', Value: isClosed },
//  { $Type: 'UI.DataField', Value: openingTime },
//  { $Type: 'UI.DataField', Value: closingTime }
// ];

// annotate cAPM1Srv.OpeningHours with @UI.FieldGroup #Main: {
//   $Type: 'UI.FieldGroupType', Data: [
//  { $Type: 'UI.DataField', Value: day },
//  { $Type: 'UI.DataField', Value: isClosed },
//  { $Type: 'UI.DataField', Value: openingTime },
//  { $Type: 'UI.DataField', Value: closingTime },
// //  { $Type: 'UI.DataField', Value: createdAt },
// //  { $Type: 'UI.DataField', Value: createdBy },
// //  { $Type: 'UI.DataField', Value: modifiedAt },
// //  { $Type: 'UI.DataField', Value: modifiedBy }
//   ]
// };

// annotate cAPM1Srv.OpeningHours with {
//   store @Common.Text: { $value: store.name, ![@UI.TextArrangement]: #TextOnly }
// };

// annotate cAPM1Srv.OpeningHours with {
//   store @Common.Label: 'Store'
// };

// annotate cAPM1Srv.OpeningHours with @UI.Facets: [
//   { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
// ];

// annotate cAPM1Srv.OpeningHours with @UI.SelectionFields: [
//   store_ID
// ];

// annotate cAPM1Srv.Products with @UI.HeaderInfo: { TypeName: 'Product', TypeNamePlural: 'Products', Title: { Value: productsID } };
// annotate cAPM1Srv.Products with {
//   ID @UI.Hidden @Common.Text: { $value: productsID, ![@UI.TextArrangement]: #TextOnly }
// };
// annotate cAPM1Srv.Products with @UI.Identification: [{ Value: productsID }];
// annotate cAPM1Srv.Products with {
//   store @Common.ValueList: {
//     CollectionPath: 'Store',
//     Parameters    : [
//       {
//         $Type            : 'Common.ValueListParameterInOut',
//         LocalDataProperty: store_ID, 
//         ValueListProperty: 'ID'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'name'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'city'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'state'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'country'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'phone'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'emailId'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'openingDate'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'closingDate'
//       },
//       // {
//       //   $Type            : 'Common.ValueListParameterDisplayOnly',
//       //   ValueListProperty: 'createdAt'
//       // },
//       // {
//       //   $Type            : 'Common.ValueListParameterDisplayOnly',
//       //   ValueListProperty: 'createdBy'
//       // },
//       // {
//       //   $Type            : 'Common.ValueListParameterDisplayOnly',
//       //   ValueListProperty: 'modifiedAt'
//       // },
//       // {
//       //   $Type            : 'Common.ValueListParameterDisplayOnly',
//       //   ValueListProperty: 'modifiedBy'
//       // },
//     ],
//   }
// };
// annotate cAPM1Srv.Products with {
//   productsID @title: 'Product ID';
//   name @title: 'Name';
//   UOM @title: 'Unit of Measure';
//   availableQty @title: 'Available Quantity';
//   // createdAt @title: 'Created At';
//   // createdBy @title: 'Created By';
//   // modifiedAt @title: 'Modified At';
//   // modifiedBy @title: 'Modified By'
// };

// annotate cAPM1Srv.Products with @UI.LineItem: [
//  { $Type: 'UI.DataField', Value: productsID },
//  { $Type: 'UI.DataField', Value: name },
//  { $Type: 'UI.DataField', Value: UOM },
//  { $Type: 'UI.DataField', Value: availableQty }
// ];

// annotate cAPM1Srv.Products with @UI.FieldGroup #Main: {
//   $Type: 'UI.FieldGroupType', Data: [
//  { $Type: 'UI.DataField', Value: productsID },
//  { $Type: 'UI.DataField', Value: name },
//  { $Type: 'UI.DataField', Value: UOM },
//  { $Type: 'UI.DataField', Value: availableQty },
// //  { $Type: 'UI.DataField', Value: createdAt },
// //  { $Type: 'UI.DataField', Value: createdBy },
// //  { $Type: 'UI.DataField', Value: modifiedAt },
// //  { $Type: 'UI.DataField', Value: modifiedBy }
//   ]
// };

// annotate cAPM1Srv.Products with {
//   store @Common.Text: { $value: store.name, ![@UI.TextArrangement]: #TextOnly }
// };

// annotate cAPM1Srv.Products with {
//   store @Common.Label: 'Store';
//   priceDetails @Common.Label: 'Price Details'
// };

// annotate cAPM1Srv.Products with @UI.Facets: [
//   { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' },
//   { $Type : 'UI.ReferenceFacet', ID : 'PriceDetails', Target : 'priceDetails/@UI.LineItem' }
// ];

// annotate cAPM1Srv.Products with @UI.SelectionFields: [
//   store_ID
// ];

// annotate cAPM1Srv.PriceDetails with @UI.HeaderInfo: { TypeName: 'Price Detail', TypeNamePlural: 'Price Details' };
// annotate cAPM1Srv.PriceDetails with {
//   product @Common.ValueList: {
//     CollectionPath: 'Products',
//     Parameters    : [
//       {
//         $Type            : 'Common.ValueListParameterInOut',
//         LocalDataProperty: product_ID, 
//         ValueListProperty: 'ID'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'productsID'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'name'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'UOM'
//       },
//       {
//         $Type            : 'Common.ValueListParameterDisplayOnly',
//         ValueListProperty: 'availableQty'
//       },
//       // {
//       //   $Type            : 'Common.ValueListParameterDisplayOnly',
//       //   ValueListProperty: 'createdAt'
//       // },
//       // {
//       //   $Type            : 'Common.ValueListParameterDisplayOnly',
//       //   ValueListProperty: 'createdBy'
//       // },
//       // {
//       //   $Type            : 'Common.ValueListParameterDisplayOnly',
//       //   ValueListProperty: 'modifiedAt'
//       // },
//       // {
//       //   $Type            : 'Common.ValueListParameterDisplayOnly',
//       //   ValueListProperty: 'modifiedBy'
//       // },
//     ],
//   }
// };
// annotate cAPM1Srv.PriceDetails with {
//   validFrom @title: 'Valid From';
//   validTo @title: 'Valid To';
//   price @title: 'Price';
//   quantity @title: 'Quantity';
//   UOM @title: 'Unit of Measure';
//   // createdAt @title: 'Created At';
//   // createdBy @title: 'Created By';
//   // modifiedAt @title: 'Modified At';
//   // modifiedBy @title: 'Modified By'
// };

// annotate cAPM1Srv.PriceDetails with {
//   price @Measures.ISOCurrency: Currency_code
// };

// annotate cAPM1Srv.PriceDetails with @UI.LineItem: [
//  { $Type: 'UI.DataField', Value: validFrom },
//  { $Type: 'UI.DataField', Value: validTo },
//  { $Type: 'UI.DataField', Value: price },
//  { $Type: 'UI.DataField', Value: quantity },
//  { $Type: 'UI.DataField', Value: UOM }
// ];

// annotate cAPM1Srv.PriceDetails with @UI.FieldGroup #Main: {
//   $Type: 'UI.FieldGroupType', Data: [
//  { $Type: 'UI.DataField', Value: validFrom },
//  { $Type: 'UI.DataField', Value: validTo },
//  { $Type: 'UI.DataField', Value: price },
//  { $Type: 'UI.DataField', Value: quantity },
//  { $Type: 'UI.DataField', Value: UOM },
// //  { $Type: 'UI.DataField', Value: createdAt },
// //  { $Type: 'UI.DataField', Value: createdBy },
// //  { $Type: 'UI.DataField', Value: modifiedAt },
// //  { $Type: 'UI.DataField', Value: modifiedBy }
//   ]
// };

// annotate cAPM1Srv.PriceDetails with {
//   product @Common.Text: { $value: product.productsID, ![@UI.TextArrangement]: #TextOnly }
// };

// annotate cAPM1Srv.PriceDetails with {
//   product @Common.Label: 'Product'
// };

// annotate cAPM1Srv.PriceDetails with @UI.Facets: [
//   { $Type: 'UI.ReferenceFacet', ID: 'Main', Label: 'General Information', Target: '@UI.FieldGroup#Main' }
// ];

// annotate cAPM1Srv.PriceDetails with @UI.SelectionFields: [
//   product_ID
// ];


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
    {Value: day, Label: 'Day'},
    {Value: openingTime, Label: 'Opening Time'},
    {Value: closingTime, Label: 'Closing Time'},
    {Value: isClosed, Label: 'Shop Closed', Criticality: statusCriticality}
    // {
    //   // $Type: 'UI.DataField',
    //   Value: statusText,
    //   Criticality: statusCriticality,
    //   Label: 'Status'
    // }
  ]
);


// Product UI

// annotate cAPM1Srv.Products with @(
//   UI.LineItem : [
//     {Value: productsID}, {Value: name}, {Value:UOM}, {Value:availableQty, Criticality: stockLevel}
//   ],
//   UI.HeaderInfo: {
//     TypeName: 'Product', TypeNamePlural: 'Products', Title: {Value:productsID}
//   },
//   UI.Facets: [
//     {  $Type: 'UI.ReferenceFacet', Label: 'Genera Info', Target: '@UI.FieldGroup#Main'},
//     { $Type: 'UI.ReferenceFacet', Label: 'Pricing History', Target: 'priceDetails/@UI.LineItem'}
//   ],
//    UI.FieldGroup #Main:{
//     Data: [{Value : productsID}, {Value: city}, {Value: UOM}, {Value: availableQty}]
//   }
// );

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


// ----current UI------

// ---PRICING DETAILS UI-----------

annotate cAPM1Srv.PriceDetails with @(
  UI.LineItem :[
    {Value: validFrom}, {Value: validTo}, {Value: price}, {Value: quantity}, {Value: UOM}
  ]
);