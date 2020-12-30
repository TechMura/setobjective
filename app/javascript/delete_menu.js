
function deleteMenu(){
  let deleteBtns = Array.from(document.getElementsByClassName("delete-btn"));
  deleteBtns.forEach(function(deleteBtn){
    deleteBtn.removeAttribute("class");
    deleteBtn.addEventListener('click',function(){
      // this.parentElement.parentElement.remove();
    });
  });
  // let menuCount=0;
  // menuLists.forEach(function(menuList){
  //   let menus = Array.from(menuList.children);
  //   menus.forEach(function(menu){
  //     let deleteMenuBtn = document.createElement('input');
  //     deleteMenuBtn.textContent = "削除";
  //     deleteMenuBtn.type = 'submit'
      // deleteMenuBtn.id = `delete-btn${menuCount}`;
      // deleteMenuBtn.value = 'bottun'
      // menu.appendChild(deleteMenuBtn);

      // deleteMenuBtn.addEventListener('click',function(e){
      //   console.log(`@menu.id`);
        // const XHR = new XMLHttpRequest();
        // XHR.open("delete", "/menus",true)
        // XHR.responseType = "json";
        // XHR.send();
  //     });
  //     menuCount += 1;
  //   });
  // });
};

window.addEventListener('load',function(){
  if (document.URL.match(/multi_delete/)){
    deleteMenu();
  };
});