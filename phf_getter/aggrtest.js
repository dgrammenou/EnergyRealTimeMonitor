
const types = ["Biomass", 
"Hydro Run-of-river and poundage", 
"Hydro Water Reservoir",
"Hydro Pumped Storage",
"Solar",
"Wind Onshore",
"Wind Offshore",
"Fossil Brown coal/Lignite"	, 
"Fossil Hard coal", 
"Fossil Oil",
"Fossil Gas",
"Geothermal",
"Nuclear",
"Other",
"Other renewable",
"Waste"]

//perday=24*types.length*60/30
//console.log("perday is ",perday)
//perhour=types.length*60/30
//console.log("perhour is ",perhour)
//permin=types.length/30
//console.log("permin is ",permin)

function calDifferencePerDays(initialdate,newdate){
    //var oldDateArray=initialdate.split(" ");
    var oldDate=initialdate.split("-");
    var old=new Date(oldDate[1]+"/"+oldDate[2]+"/"+oldDate[0])

    //var newArray=newdate.split(" ");
    var newDate=newdate.split("-");
    var newd=new Date(newDate[1]+"/"+newDate[2]+"/"+newDate[0])

    var differenceperdays=Math.abs(newd-old)/(1000 * 3600 * 24)

    return differenceperdays

}

function calindex(initialdate,newdate,rescode){
    perday=24*44*60/rescode

    perhour=44*60/rescode

    permin=44/rescode

    var old_date_split=initialdate.split(" ")
    var new_date_split=newdate.split(" ")
    var interval=calDifferencePerDays(old_date_split[0],new_date_split[0])
    
    var oldtimeArray=old_date_split[1].split(":")
    var newtimeArray=new_date_split[1].split(":")

    var old_hours=oldtimeArray[0]
    var old_mins=oldtimeArray[1]

    var new_hours=newtimeArray[0]
    var new_mins=newtimeArray[1]

    var totalhours=new_hours-old_hours

    var totalmins=new_mins-old_mins

    var index=interval*perday + totalhours*perhour + totalmins*permin
    return index
    

}



module.exports= {
    calindex
}







