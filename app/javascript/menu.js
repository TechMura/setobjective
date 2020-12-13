function Menu(){
  addMenuNum = 0
  const addMenuBtn = document.getElementById("add-btn");
  addMenuBtn.addEventListener('click',function(){
    const todoContents = document.getElementById("todo");
    const timeContents = document.getElementById("time");
    const weekDay = document.getElementById("week_id");
    const weekTableData = document.getElementsByClassName("menu-list");
    
    if (todoContents.value != "" && weekDay.value != ""){
      let addMenuContents = document.createElement('li') ;
      let addMenuDelete = document.createElement('button');

      addMenuContents.textContent = todoContents.value;
      addMenuContents.id = `menu${addMenuNum}`;
      addMenuDelete.textContent = "削除";
      addMenuDelete.id = `delete-btn${addMenuNum}`;
      weekTableData[weekDay.value].appendChild(addMenuContents);
      addMenuContents.appendChild(addMenuDelete);

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