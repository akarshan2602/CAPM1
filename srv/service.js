const cds = require('@sap/cds')



module.exports = (srv) => {
     srv.after('READ', 'Products', (each) =>{
        if (each.availableQty <=5){
            each.stockLevel =1; //1 = Red(critical)
        }
        else if (each.availableQty <=15){
            each.stockLevel = 2;// 2= Orange(warning)
        }
        else{
            each.stockLevel =3; //3= Green(positive)
        }
    });
    srv.after('READ', 'OpeningHours', (each) =>{
    if(each.isClosed){
        each.statusText= 'CLOSED';
        each.statusCriticality=1; //RED
    }
    else{
        each.statusText= 'OPEN';
        each.statusCriticality=3 //GREEN
    }
});
}