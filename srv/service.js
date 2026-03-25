const cds = require('@sap/cds');
const { SELECT } = require('@sap/cds/lib/ql/cds-ql');



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
    // srv.after('READ', 'OpeningHours', (data) =>{
    // const entries = Array.isArray(data)? data: [data];
    // const today= new Date();
    // entries.forEach(each => {
    //     const nextDate =  getNextDayOfWeek(today, each.day);
    //     each.calendarDate= nextDate.toISOString().split('T')[0];
    //     if(each.isClosed){
    //     each.statusText= 'CLOSED';
    //     each.statusCriticality=1; //RED
    // }
    // else{
    //     each.statusText= 'OPEN';
    //     each.statusCriticality=3 //GREEN
    // }
    // data.sort((a,b) => new Date(a.calendarDate) - new Date(b.calendarDate)); //sorting week with respect to the current dates
    //     })}
    // );
    srv.after('READ', 'OpeningHours', async (data, req) =>{
        const {Festivals} = srv.entities;
        const entries = Array.isArray(data)? data: [data];
    const today= new Date();
    const allFestivals = await SELECT.from(Festivals);
    entries.forEach(each => {
        const nextDate =  getNextDayOfWeek(today, each.day);
        const isoDate= nextDate.toISOString().split('T')[0];
        each.calendarDate= isoDate;
        const urlStoreID= (req.params[0]?.ID || req.data?.store_ID || "").toString();
        console.log(`Checking match for : ${isoDate} against store ${urlStoreID}`);
        const festival = allFestivals.find( f => {
            if (!f.date || !f.store_ID) return false;

            return f.date.toString() === isoDate && f.store_ID.toString() === urlStoreID;
        });
        if (festival){
            // console.log(each.isClosed);
            each.isClosed = festival.isClosed;
            // console.log(each.isClosed);
            each.openingTime= festival.openingTime;
            each.closingTime= festival.closingTime;
            each.statusText = festival.isClosed? `CLOSED(${festival.name})`: `OPEN(${festival.name})`;
            each.statusCriticality = 2; //for special timing use orange
        }
        else{
            if(each.day === 'Sunday'){
                each.isClosed= true;
                each.statusText= 'CLOSED';
                each.statusCriticality=1;
            }
            else{
                each.statusText = each.isClosed ? 'CLOSED': 'OPEN';
                each.statusCriticality= each.isClosed? 1:3;
            }
        }
        data.sort((a,b) => new Date(a.calendarDate) - new Date(b.calendarDate)); 
    });
    });
};
function getNextDayOfWeek(date, dayName) {
    const days= ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    const resultDate= new Date(date);
    resultDate.setDate(date.getDate() + (days.indexOf(dayName) - date.getDay() + 7) % 7);
    return resultDate;
}


//pushed to github