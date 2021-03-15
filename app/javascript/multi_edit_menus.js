
function multiEditMenu(){
  const deleteBtns = Array.from(document.getElementsByClassName("delete-btn"));
  deleteBtns.forEach(function(deleteBtn){

  });
};

function deleteMenu(){

}


window.addEventListener('load',function(){
  if (document.URL.match(/multi_edit/)){
    multiEditMenu();
  };
});