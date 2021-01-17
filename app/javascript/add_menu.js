function addMenu(){
  addMenuNum = 0
  const addMenuBtn = document.getElementById("add-btn");
  addMenuBtn.addEventListener('click',function(){
    const weekDayContents = document.getElementById("menu_week_id");
    const todoContents = document.getElementById("menu_todo");
    const timeContents = document.getElementById("menu_time");
    const weekTableData = document.getElementsByClassName("menu-list");
    const alertWeekDayComment = document.getElementById("alert-week-comment");
    const alertTodoComment = document.getElementById("alert-todo-comment");
    
    if (weekDayContents.value == "" && todoContents.value == ""){
      alertWeekDayComment.classList.contains("hidden") ? alertWeekDayComment.classList.remove("hidden"): "" ;
      alertTodoComment.classList.contains("hidden") ? alertTodoComment.classList.remove("hidden"): "" ;
    }
    else if (weekDayContents.value == ""){
      alertWeekDayComment.classList.contains("hidden") ? alertWeekDayComment.classList.remove("hidden") : "";
      !alertTodoComment.classList.contains("hidden") ? alertTodoComment.classList.add("hidden") : "";
    }
    else if (todoContents.value == ""){
      !alertWeekDayComment.classList.contains("hidden") ? alertWeekDayComment.classList.add("hidden"): "";
      alertTodoComment.classList.contains("hidden") ? alertTodoComment.classList.remove("hidden"):"";
    }

    else if (weekDayContents.value != "" && todoContents.value != ""){
      !alertWeekDayComment.classList.contains("hidden") ? alertWeekDayComment.classList.add("hidden"): "";
      !alertTodoComment.classList.contains("hidden") ? alertTodoComment.classList.add("hidden"):"";
      // formに入力した内容を追加
      const weekList = document.getElementById('week-list');
      let weekInputHtml = document.createElement('input');
      weekInputHtml.setAttribute('id', `week_text_${addMenuNum}`);
      weekInputHtml.setAttribute('name', `menus[menu${addMenuNum}][week_id]`);
      weekInputHtml.setAttribute('type','text');
      weekInputHtml.value = weekDayContents.value;
      weekList.appendChild(weekInputHtml);

      const todoList = document.getElementById('todo-list');
      let todoInputHtml = document.createElement('input');
      todoInputHtml.setAttribute('id', `todo_text_${addMenuNum}`);
      todoInputHtml.setAttribute('name', `menus[menu${addMenuNum}][todo]`);
      todoInputHtml.setAttribute('type','text');
      todoInputHtml.value = todoContents.value;
      todoList.appendChild(todoInputHtml);

      const timeList = document.getElementById('time-list');
      let timeInputHtml = document.createElement('input');
      timeInputHtml.setAttribute('id', `time_text_${addMenuNum}`);
      timeInputHtml.setAttribute('name', `menus[menu${addMenuNum}][time]`);
      timeInputHtml.setAttribute('type','text');
      timeInputHtml.value = timeContents.value;
      timeList.appendChild(timeInputHtml);

      const effectContents = document.getElementById("menu_effect")
      const effectList = document.getElementById("effect-list")
      let effectInputHtml = document.createElement('textarea');
      effectInputHtml.setAttribute('id', `time_text_${addMenuNum}`);
      effectInputHtml.setAttribute('name', `menus[menu${addMenuNum}][effect]`);
      effectInputHtml.value = effectContents.value;
      effectList.appendChild(effectInputHtml);

      // スケジュール表に追加する
      let addMenuContents = document.createElement('li') ;
      let deleteMenuBtn = document.createElement('button');

      addMenuContents.textContent = todoContents.value;
      addMenuContents.id = `menu${addMenuNum}`;
      deleteMenuBtn.textContent = "削除";
      deleteMenuBtn.id = `delete-btn${addMenuNum}`;
      deleteMenuBtn.style.display = 'block';
      weekTableData[weekDayContents.value].appendChild(addMenuContents);
      addMenuContents.appendChild(deleteMenuBtn);

      // 削除ボタンを押したらスケジュールから削除する
      deleteMenuBtn.addEventListener('click',function(){
        this.parentElement.remove();
        weekInputHtml.remove();
        todoInputHtml.remove();
        timeInputHtml.remove();
        effectInputHtml.remove();
      })
      addMenuNum += 1
    }
  })
}

window.addEventListener('load',function(){
  if (document.getElementById("add-btn") != null){
    addMenu();
  };
});