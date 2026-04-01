sap.ui.define([
    "sap/ui/test/opaQunit",
    "./pages/JourneyRunner"
], function (opaTest, runner) {
    "use strict";

    function journey() {
        QUnit.module("First journey");

        opaTest("Start application", function (Given, When, Then) {
            Given.iStartMyApp();

            Then.onTheProductCatalogList.iSeeThisPage();
            Then.onTheProductCatalogList.onFilterBar().iCheckFilterField("productName");
            Then.onTheProductCatalogList.onFilterBar().iCheckFilterField("storeName");
            Then.onTheProductCatalogList.onTable().iCheckColumns(3, {"productName":{"header":"Product"},"storeName":{"header":"Store"},"Price":{"header":"Price"}});

        });


        opaTest("Navigate to ObjectPage", function (Given, When, Then) {
            // Note: this test will fail if the ListReport page doesn't show any data
            
            When.onTheProductCatalogList.onFilterBar().iExecuteSearch();
            
            Then.onTheProductCatalogList.onTable().iCheckRows();

            When.onTheProductCatalogList.onTable().iPressRow(0);
            Then.onTheProductCatalogObjectPage.iSeeThisPage();

        });

        opaTest("Teardown", function (Given, When, Then) { 
            // Cleanup
            Given.iTearDownMyApp();
        });
    }

    runner.run([journey]);
});