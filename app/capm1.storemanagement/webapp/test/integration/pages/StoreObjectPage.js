sap.ui.define(['sap/fe/test/ObjectPage'], function(ObjectPage) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ObjectPage(
        {
            appId: 'capm1.storemanagement',
            componentId: 'StoreObjectPage',
            contextPath: '/Store'
        },
        CustomPageDefinitions
    );
});