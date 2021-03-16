
function multiEditMenu(){
  // const deleteBtns = Array.from(document.getElementsByClassName("delete-btn"));
  // deleteBtns.forEach(function(deleteBtn){

  const submit = document.getElementById('submit')
  submit.addEventListener('click',function(e){
    const formData = new FormData(document.getElementById("menu-form"));
    formData.append('objective_id', )
    const XHR = new XMLHttpRequest();
    XHR.open("POST", "/menus/add_update", true);
    XHR.responseType = "json";
    XHR.send(formData);
  });

  // });
};

function deleteMenu(){

}


window.addEventListener('load',function(){
  if (document.URL.match(/multi_edit/)){
    multiEditMenu();
  };
});