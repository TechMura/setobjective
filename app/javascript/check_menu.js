// const { $ } = require("@rails/ujs");

function achieveMenu(){
  const menus = document.querySelectorAll(".achieve-check")
  menus.forEach(function(menu){
    check = menu.getAttribute("data-check");
    if (check == "true"){
      menu.setAttribute("checked", "checked");
    }


    menu.addEventListener("click",function(){
      const menuId = menu.getAttribute("data-id")
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `/menus/${menuId}/achieved`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload=function(){
        const item = XHR.response.menu;
      }
    });
  });
};


window.addEventListener("load",function(){
  if (document.getElementsByClassName("achieve-check")!= null){
    achieveMenu();
  }
})
