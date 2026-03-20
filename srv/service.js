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
    srv.after('READ', 'OpeningHours', (data) =>{
    const entries = Array.isArray(data)? data: [data];
    const today= new Date();

    entries.forEach(each => {
        const nextDate =  getNextDayOfWeek(today, each.day);
        each.calendarDate= nextDate.toISOString().split('T')[0];
        if(each.isClosed){
        each.statusText= 'CLOSED';
        each.statusCriticality=1; //RED
    }
    else{
        each.statusText= 'OPEN';
        each.statusCriticality=3 //GREEN
    }
    data.sort((a,b) => new Date(a.calendarDate) - new Date(b.calendarDate)); //sorting week with respect to the current dates
})
});
};
function getNextDayOfWeek(date, dayName) {
    const days= ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    const resultDate= new Date(date);
    resultDate.setDate(date.getDate() + (days.indexOf(dayName) - date.getDay() + 7) % 7);
    return resultDate;
}