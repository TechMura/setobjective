function Menu(){
  addMenuNum = 0
  const addMenuBtn = document.getElementById("add-btn");
  addMenuBtn.addEventListener('click',function(){
    const weekDayContents = document.getElementById("week_id");
    const todoContents = document.getElementById("todo");
    const timeContents = document.getElementById("time");
    const weekTableData = document.getElementsByClassName("menu-list");
    
    if (weekDayContents.value != "" && todoContents.value != ""){
      // formに入力した内容を追加
      const weekList = document.getElementById('week-list');
      let weekInputHtml = document.createElement('input');
      weekInputHtml.setAttribute('id', `week_select_${addMenuNum}`);
      weekInputHtml.setAttribute('name', 'menu[weeks][]');
      weekInputHtml.setAttribute('type','text');
      weekInputHtml.value = weekDayContents.value;
      weekList.appendChild(weekInputHtml)

      const todoList = document.getElementById('todo-list');
      let todoInputHtml = document.createElement('input');
      todoInputHtml.setAttribute('id', `todo_text_${addMenuNum}`);
      todoInputHtml.setAttribute('name', 'menu[todos][]');
      todoInputHtml.setAttribute('type','text');
      todoInputHtml.value = todoContents.value;
      todoList.appendChild(todoInputHtml)

      const timeList = document.getElementById('time-list');
      let timeInputHtml = document.createElement('input');
      timeInputHtml.setAttribute('id', `time_text_${addMenuNum}`);
      timeInputHtml.setAttribute('name', 'menu[times][]');
      timeInputHtml.setAttribute('type','text');
      timeInputHtml.value = timeContents.value;
      timeList.appendChild(timeInputHtml)

      const effectContents = document.getElementById("effect")
      const effectList = document.getElementById("effect-list")
      let effectInputHtml = document.createElement('textarea');
      effectInputHtml.setAttribute('id', `effect_text_${addMenuNum}`);
      effectInputHtml.setAttribute('name', 'menu[effects][]');
      effectInputHtml.value = effectContents.value;
      effectList.appendChild(effectInputHtml)

      // スケジュール表に追加する
      let addMenuContents = document.createElement('li') ;
      let addMenuDelete = document.createElement('button');

      addMenuContents.textContent = todoContents.value;
      addMenuContents.id = `menu${addMenuNum}`;
      addMenuDelete.textContent = "削除";
      addMenuDelete.id = `delete-btn${addMenuNum}`;
      weekTableData[weekDayContents.value].appendChild(addMenuContents);
      addMenuContents.appendChild(addMenuDelete);

      // スケジュールの削除ボタンを押したら要素が消える
      addMenuDelete.addEventListener('click',function(){
        this.parentElement.remove();
      })
      addMenuNum += 1
    }
  })
}

window.addEventListener('load',function(){
  Menu();
})