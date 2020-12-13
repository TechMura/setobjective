function pullDown(){

  const pullDownButton = document.getElementById("user-name")
  const pullDownParents= document.getElementById("show-list")

  pullDownButton.addEventListener('mouseover',function(){
    this.setAttribute("style","color: #a9a9a9;")
  })
  pullDownButton.addEventListener('mouseout',function(){
    this.removeAttribute("style","color: #a9a9a9;")
  })
  pullDownButton.addEventListener('click',function(){
    if (pullDownParents.getAttribute("style") == "visibility:visible;"){
      pullDownParents.removeAttribute("style","visibility:visible;")
    } else{
      pullDownParents.setAttribute("style","visibility:visible;")
    }
  })
  document.addEventListener('click',function(event) {
    if (!(event.target).closest(".user-name")){
      if (pullDownParents.getAttribute("style")=="visibility:visible;"){
        pullDownParents.removeAttribute("style","visibility:visible;")
      }
    }
  })
}

window.addEventListener('load',function(){
  if (document.getElementById("user-name") != null){
    pullDown()
  }
})
