
function deleteMenu(){
  const deleteBtns = Array.from(document.getElementsByClassName("delete-btn"));
  deleteBtns.forEach(function(deleteBtn){
    // 削除ボタンはhiddenで隠しているからそれを取り除く
    deleteBtn.removeAttribute("class");
  });
};

window.addEventListener('load',function(){
  if (document.URL.match(/multi_delete/)){
    deleteMenu();
  };
});