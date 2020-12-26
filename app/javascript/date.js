function date(){
  let time = new Date();

  month = time.getMonth();
  day = time.getDate();
  dayOfWeek = time.getDay();
  var dayOfWeekStr = [ "日", "月", "火", "水", "木", "金", "土" ][dayOfWeek] ;	

  let dateContents = document.getElementById("date");
  dateContents.innerHTML = `${month}月${day}日(${dayOfWeekStr})`;
}

window.addEventListener('load',function(){
  if (document.getElementById("date") != null){
    date();
  }
});