
function addCreateMenu(){
  const addBtn = document.getElementById('add-btn')
  addBtn.addEventListener('click',function(e){

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
      return null;
    }
    else if (weekDayContents.value == ""){
      alertWeekDayComment.classList.contains("hidden") ? alertWeekDayComment.classList.remove("hidden") : "";
      !alertTodoComment.classList.contains("hidden") ? alertTodoComment.classList.add("hidden") : "";
      return null;
    }
    else if (todoContents.value == ""){
      !alertWeekDayComment.classList.contains("hidden") ? alertWeekDayComment.classList.add("hidden"): "";
      alertTodoComment.classList.contains("hidden") ? alertTodoComment.classList.remove("hidden"):"";
      return null;
    }

    else if (weekDayContents.value != "" && todoContents.value != ""){
      !alertWeekDayComment.classList.contains("hidden") ? alertWeekDayComment.classList.add("hidden"): "";
      !alertTodoComment.classList.contains("hidden") ? alertTodoComment.classList.add("hidden"):"";

      // const formData = new FormData(document.getElementById("menu-form"));
      // const XHR = new XMLHttpRequest();
      // XHR.open("POST", "/menus/add_create", true);

      // XHR.responseType = "json";

      XHR.onload = function(){
        if (XHR.status != 200) {
          alert(`Error ${XHR.status}: ${XHR.statusText}`);
          return null;
        }
        
        const item = XHR.response.menu
        // // スケジュール表に追加する
        let addMenuContents = document.createElement('li');
        let deleteMenuBtn = document.createElement('button');

        addMenuContents.textContent = item.todo;
        addMenuContents.id = item.id ;
        deleteMenuBtn.textContent = "削除";
        deleteMenuBtn.id = item.id;
        deleteMenuBtn.style.display = 'block';
        weekTableData[weekDayContents.value].appendChild(addMenuContents);
        addMenuContents.appendChild(deleteMenuBtn);
      };
    }
  });
}

window.addEventListener('load',function(){
  if (document.URL.match(/multi_edit/) || document.URL.match(/add_create/)){
    addCreateMenu();
  }
});