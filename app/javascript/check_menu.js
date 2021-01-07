// const { $ } = require("@rails/ujs");

function achieveMenu(){
  const menu_checks = document.querySelectorAll(".achieve-check");
  menu_checks.forEach(function(menu_check){
    check = menu_check.getAttribute("data-check");
    if (check === "true"){
      menu_check.setAttribute("checked", "checked");
    } else if (check === "false"){
      menu_check.removeAttribute("checked")
    }

    menu_check.addEventListener("click",function(){
      const menuId = menu_check.getAttribute("data-id")
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/menus/${menuId}/achieved`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload=function(){
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;          
        }
        const item = XHR.response.menu;
        if (item.achieve_flag == true){
          menu_check.setAttribute("data-check","true");
        } else if(item.achieve_flag == false){
          menu_check.setAttribute("data-check", "false");
        }
        Achieve(menu_checks);
      }
    });
  });
};

function Achieve(menu_checks){
  let flag = true
  menu_checks.forEach(function(menu_check){
    if (menu_check.getAttribute("data-check") == "false"){
      flag = false;
    }
  });
  if (flag == true){
    window.alert("今日の目標は達成しました。");
  }
}

window.addEventListener("load",function(){
  if (document.getElementsByClassName("achieve-check")!= null){
    achieveMenu();
  }
})
