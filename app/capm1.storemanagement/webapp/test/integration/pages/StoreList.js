sap.ui.define(['sap/fe/test/ListReport'], function(ListReport) {
    'use strict';

    var CustomPageDefinitions = {
        actions: {},
        assertions: {}
    };

    return new ListReport(
        {
            appId: 'capm1.storemanagement',
            componentId: 'StoreList',
            contextPath: '/Store'
        },
        CustomPageDefinitions
    );
});