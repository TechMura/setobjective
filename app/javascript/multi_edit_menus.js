
function multiEditMenu(){
  const deleteBtns = Array.from(document.getElementsByClassName("delete-btn"));
  deleteBtns.forEach(function(deleteBtn){
    // 削除ボタンはhiddenで隠しているからそれを取り除く
    // deleteBtn.removeAttribute("class");
    //クリックしたら削除ボタンを押したらDBから削除される
    deleteBtn.addEventListener('click',function(){
      console.log("読み込み完了")
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