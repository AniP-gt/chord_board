// コード表示
window.addEventListener('DOMContentLoaded', () => {

  // クラス要素を取得し、各要素にidを動的に付与
  let chord_id = document.getElementsByClassName("chord_id");
  let id = "chord_work_id";
  for(let w = 0;w<=chord_id.length-1; w++ ){
    chord_id[w].setAttribute("id",id+w);

    // 各要素のworkデータを取得
    let data_work = chord_id[w].dataset.work;
    console.log(data_work);
    // 配列を分割
    let regexp = new RegExp(/(.*?)\,/g);
    let view = data_work.match(regexp);
    let chord_list="";

     // コード名取得
    for (let i = 0; i < view.length; i++) {
      let str= view[i].replace(/\,/,"");
      chord_list+="<div id="+str+" class='chords'><img src='/assets/"+str+".png' class='chord_img' alt="+str+"></div>";
      chord_id[w].innerHTML = chord_list;
    };
  };
});


// 再生表示
window.addEventListener('DOMContentLoaded', () => {

  // クラス要素を取得し、各要素にidを動的に付与
  let play_id = document.getElementsByClassName("play_id");
  let id = "chord_play_id";
  let play_list = "";
  for(let w = 0;w<=play_id.length-1; w++ ){
    play_id[w].setAttribute("id",id+w);
     //各要素に再生を表示
      play_list="<div id='chord_play' class='play' onclick='play("+w+")'><p id='chord_play_p' class='play-btn'>再生</p>";
      play_id[w].innerHTML = play_list;
  };
});

// 再生ボタン
const audio_start = document.getElementById("audio_start");

window.play=function (P){

  // クラス要素を取得し、各要素にidを動的に付与
  let chord_id = document.getElementsByClassName("chord_id");
  let id = "chord_audio_id";
  for(let w = 0;w<=chord_id.length-1; w++ ){
    chord_id[w].setAttribute("id",id+w);

    // 各要素のworkデータを取得
    let data_work = chord_id[w].dataset.work;

    // 配列を分割
    let regexp = new RegExp(/(.*?)\,/g);
    let view = data_work.match(regexp);

    // mp3拡張子とファイル先指定
    view = view.map(function(a){
      return "/assets/"+a+".mp3";
    });

    // オーディオの表示
    let audio = document.createElement('audio');
    audio_start.appendChild(audio);
    // audio.controls = true; 再生ボタンを表示させる
    audio.src = view[0];
    if(P==w){
      audio.play();
    }
    // 配列に入っている順に再生
    let index = 0;
    audio.addEventListener('ended',function(){
      index++;
      if (index < view.length){
          audio.src = view[index];
          audio.play();
      };
    });
  };
};
