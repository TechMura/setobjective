function show_menu(){
  const menuElements = document.querySelectorAll(".menu-list-todo")

  menuElements.forEach(function(menuElement){
    menuElement.addEventListener("click",function(){
      let todoData = menuElement.getAttribute("data-todo");
      let timeData = menuElement.getAttribute("data-time");
      let effectData = menuElement.getAttribute("data-effect");
      let showMenuContent = document.getElementById("show-menu");
      let showTimeContent = document.getElementById("show-time");
      let showEffectContent = document.getElementById("show-effect");
      // let menuId = menuElement.getAttribute("data-id")


      showMenuContent.innerHTML = todoData;
      showTimeContent.innerHTML = timeData;
      showEffectContent.innerHTML = effectData;

    });
  });
}

window.addEventListener('load',function(){
  show_menu();
})