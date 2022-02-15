// ハンバーガーメニュー
const js_btn = document.getElementById("js_btn");
const menu = document.getElementById("menu");
const btn_line = document.getElementById("btn_line");

js_btn.addEventListener('click',()=>{
   menu.classList.toggle('open');
   btn_line.classList.toggle('open');
});


