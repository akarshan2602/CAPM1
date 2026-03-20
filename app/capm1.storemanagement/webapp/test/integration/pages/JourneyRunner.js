sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"capm1/storemanagement/test/integration/pages/StoreList",
	"capm1/storemanagement/test/integration/pages/StoreObjectPage"
], function (JourneyRunner, StoreList, StoreObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('capm1/storemanagement') + '/test/flpSandbox.html#capm1storemanagement-tile',
        pages: {
			onTheStoreList: StoreList,
			onTheStoreObjectPage: StoreObjectPage
        },
        async: true
    });

    return runner;
});

