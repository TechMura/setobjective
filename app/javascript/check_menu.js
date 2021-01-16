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
    const achieve_pop = document.getElementById("achieve-pop");
    achieve_pop.classList.remove("hidden");
    achieve_pop.style.opacity = 0;
    // if (achieve_pop.style.opacity==""){
    //   achieve_pop.style.opacity = 1;
    // }
    let opacityInt = achieve_pop.style.opacity * 100;
    intervalId = setInterval(function(){
      opacityInt = opacityInt + 10;
      achieve_pop.style.opacity = opacityInt / 100;
      if(achieve_pop.style.opacity >= 1){
        clearInterval(intervalId);
      }
    },100);
  }
}

window.addEventListener("load",function(){
  if (document.getElementsByClassName("achieve-check")!= null){
    achieveMenu();
  }
})
