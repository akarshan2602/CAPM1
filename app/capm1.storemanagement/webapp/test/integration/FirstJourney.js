sap.ui.define([
    "sap/ui/test/opaQunit",
    "./pages/JourneyRunner"
], function (opaTest, runner) {
    "use strict";

    function journey() {
        QUnit.module("First journey");

        opaTest("Start application", function (Given, When, Then) {
            Given.iStartMyApp();

            Then.onTheStoreList.iSeeThisPage();
            Then.onTheStoreList.onTable().iCheckColumns(3, {"name":{"header":"name"},"city":{"header":"city"},"emailId":{"header":"emailId"}});

        });


        opaTest("Navigate to ObjectPage", function (Given, When, Then) {
            // Note: this test will fail if the ListReport page doesn't show any data
            
            When.onTheStoreList.onFilterBar().iExecuteSearch();
            
            Then.onTheStoreList.onTable().iCheckRows();

            When.onTheStoreList.onTable().iPressRow(0);
            Then.onTheStoreObjectPage.iSeeThisPage();

        });

        opaTest("Teardown", function (Given, When, Then) { 
            // Cleanup
            Given.iTearDownMyApp();
        });
    }

    runner.run([journey]);
});