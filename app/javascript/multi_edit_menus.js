
function multiEditMenu(){
  // const deleteBtns = Array.from(document.getElementsByClassName("delete-btn"));
  // deleteBtns.forEach(function(deleteBtn){

  const submit = document.getElementById('add-btn')
  submit.addEventListener('click',function(e){


    // formとエラーメッセージの要素取得
    const weekDayContents = document.getElementById("menu_week_id");
    const todoContents = document.getElementById("menu_todo");
    const timeContents = document.getElementById("menu_time");
    const weekTableData = document.getElementsByClassName("menu-list");
    const alertWeekDayComment = document.getElementById("alert-week-comment");
    const alertTodoComment = document.getElementById("alert-todo-comment");

    // バリデーション
    if (weekDayContents.value == "" && todoContents.value == ""){
      alertWeekDayComment.classList.contains("hidden") ? alertWeekDayComment.classList.remove("hidden"): "" ;
      alertTodoComment.classList.contains("hidden") ? alertTodoComment.classList.remove("hidden"): "" ;
      return
    }
    else if (weekDayContents.value == ""){
      alertWeekDayComment.classList.contains("hidden") ? alertWeekDayComment.classList.remove("hidden") : "";
      !alertTodoComment.classList.contains("hidden") ? alertTodoComment.classList.add("hidden") : "";
      return
    }
    else if (todoContents.value == ""){
      !alertWeekDayComment.classList.contains("hidden") ? alertWeekDayComment.classList.add("hidden"): "";
      alertTodoComment.classList.contains("hidden") ? alertTodoComment.classList.remove("hidden"):"";
      return
    }

    else if (weekDayContents.value != "" && todoContents.value != ""){
      !alertWeekDayComment.classList.contains("hidden") ? alertWeekDayComment.classList.add("hidden"): "";
      !alertTodoComment.classList.contains("hidden") ? alertTodoComment.classList.add("hidden"):"";
      const formData = new FormData(document.getElementById("menu-form"));
      const XHR = new XMLHttpRequest();
      XHR.open("POST", "/menus/add_update", true);
      XHR.responseType = "json";
      XHR.send(formData);
      XHR.onload = function(){
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;
        }
        const item = this.response.menu
        
      };
    }
  });

}

function deleteMenu(){

}


window.addEventListener('load',function(){
  if (document.URL.match(/multi_edit/)){
    multiEditMenu();
  }
});