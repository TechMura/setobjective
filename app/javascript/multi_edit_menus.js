
function multiEditMenu(){
  const deleteBtns = Array.from(document.getElementsByClassName("delete-btn"));
  deleteBtns.forEach(function(deleteBtn){
    // 削除ボタンはhiddenで隠しているからそれを取り除く
    // deleteBtn.removeAttribute("class");
    //クリックしたら削除ボタンを押したらDBから削除される
    deleteBtn.addEventListener('click',function(e){
      // e.preventDefault();
      // const fd = new FormData();
      // const menuId = deleteBtn.getAttribute("data-id")
      // const XHR = new XMLHttpRequest();
      // XHR.open("DELETE",`/menus/${menuId}`,true);
      // XHR.responseType = "json";
      // fd.append('_method', "DELETE")
      // XHR.send(fd);

      // deleteBtn.addEventListener('click',function(){
      //   this.parentElement.parentElement.remove();
      //   console.log("削除実施")
      // });
      
    });
  });
};

function deleteMenu(){

}


window.addEventListener('load',function(){
  if (document.URL.match(/multi_edit/)){
    multiEditMenu();
  };
});