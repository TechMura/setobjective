function reset_achieve_flag(menu_check){
  const menuId = menu_check.getAttribute("data-id")
  const XHR = new XMLHttpRequest();
  XHR.open("GET", `/menus/${menuId}/reset_achieve_flag`, true);
  XHR.responseType = "json";
  XHR.send();
  XHR.onload=function(){
    if (XHR.status != 200) {
      alert(`Error ${XHR.status}: ${XHR.statusText}`);
      return null;          
    }
    const item = XHR.response.menu;
    menu_check.setAttribute("data-check", "false");
    menu_check.removeAttribute("checked")
  }
}

function confirm_date(updated_at){
  const updated_year = updated_at.getFullYear();
  const updated_month = updated_at.getMonth() + 1;
  const updated_date = updated_at.getDate();
  const today = new Date();
  const today_year = today.getFullYear();
  const today_month = today.getMonth() + 1;
  const today_date = today.getDate();
  if (updated_year == today_year){
    if (updated_month == today_month){
      return updated_date < today_date;
    }else{
      return updated_month < today_month;
    }
  }else{
    return updated_year < today_year;
  }
}

window.addEventListener("load",function(){
  if (document.getElementsByClassName("achieve-check")!= null){
    const menu_checks = document.querySelectorAll(".achieve-check");
    menu_checks.forEach(function(menu_check){
      const updated_at = new Date(menu_check.getAttribute("data-updated"));
      if (confirm_date(updated_at)){
        reset_achieve_flag(menu_check);
      }
    })
  }
})
  