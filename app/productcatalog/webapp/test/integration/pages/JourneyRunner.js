sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"productcatalog/test/integration/pages/ProductCatalogList",
	"productcatalog/test/integration/pages/ProductCatalogObjectPage"
], function (JourneyRunner, ProductCatalogList, ProductCatalogObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('productcatalog') + '/test/flp.html#app-preview',
        pages: {
			onTheProductCatalogList: ProductCatalogList,
			onTheProductCatalogObjectPage: ProductCatalogObjectPage
        },
        async: true
    });

    return runner;
});

