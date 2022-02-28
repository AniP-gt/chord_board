'use strict';

// コード名を追加
const chords = document.getElementById("chords");
const ongens = document.getElementById("ongen");

window.addEventListener('DOMContentLoaded', () => {

  // コード名
  const array = ["C","CMaj7","C7","Cm","Cm7","Cm7b5","Cdim7","Csus4","Caug","C6","Cs","CsMaj7","Cs7","Csm","Csm7","Csm7b5","Csdim7","Cssus4","Csaug","Cs6","D","DMaj7","D7","Dm","Dm7","Dm7b5","Ddim7","Dsus4","Daug","D6","Ds","DsMaj7","Ds7","Dsm","Dsm7","Dsm7b5","Dsdim7","Dssus4","Dsaug","Ds6","E","EMaj7","E7","Em","Em7","Em7b5","Edim7","Esus4","Eaug","E6","F","FMaj7","F7","Fm","Fm7","Fm7b5","Fdim7","Fsus4","Faug","F6","Fs","FsMaj7","Fs7","Fsm","Fsm7","Fsm7b5","Fsdim7","Fssus4","Fsaug","Fs6","G","GMaj7","G7","Gm","Gm7","Gm7b5","Gdim7","Gsus4","Gaug","G6","Gs","GsMaj7","Gs7","Gsm","Gsm7","Gsm7b5","Gsdim7","Gssus4","Gsaug","Gs6","A","AMaj7","A7","Am","Am7","Am7b5","Adim7","Asus4","Aaug","A6","As","AsMaj7","As7","Asm","Asm7","Asm7b5","Asdim7","Assus4","Asaug","As6","B","BMaj7","B7","Bm","Bm7","Bm7b5","Bdim7","Bsus4","Baug","B6"];

  // ループ時に要素を追記する用の空欄を代入
  let chord_name = "";
  let ongen = "";

  // 各コード名を代入し、HTMLに表示
  for(let i = 0; i < array.length; i++) {
     // コード一覧
    chord_name+="<div id="+array[i]+" class='chords'><a onclick= add('"+array[i]+"')><img src='/assets/"+array[i]+".png' class='chord_img' alt="+array[i]+"></a></div>";
     // 音源ファイル
    ongen+="<audio id=\"sound-file_"+array[i]+"\" preaudio=\"auto\"><source src=\"/assets/"+array[i]+",.mp3\" type=\"audio/mp3\"></audio>";
     // コードを表示
    chords.innerHTML = chord_name;
    ongens.innerHTML = ongen;
  };
});


// ディグリーネームを追加
const degrees = document.getElementById("degrees");

window.addEventListener('DOMContentLoaded', () => {
  // コード名
  const array = ["I","IMaj7","I7","Im","Im7","Im7b5","Idim7","Isus4","Iaug","I6","Is","IsMaj7","Is7","Ism","Ism7","Ism7b5","Isdim7","Issus4","Isaug","Is6","II","IIMaj7","II7","IIm","IIm7","IIm7b5","IIdim7","IIsus4","IIaug","II6","IIs","IIsMaj7","IIs7","IIsm","IIsm7","IIsm7b5","IIsdim7","IIssus4","IIsaug","IIs6","III","IIIMaj7","III7","IIIm","IIIm7","IIIm7b5","IIIdim7","IIIsus4","IIIaug","III6","IV","IVMaj7","IV7","IVm","IVm7","IVm7b5","IVdim7","IVsus4","IVaug","IV6","IVs","IVsMaj7","IVs7","IVsm","IVsm7","IVsm7b5","IVsdim7","IVssus4","IVsaug","IVs6","V","VMaj7","V7","Vm","Vm7","Vm7b5","Vdim7","Vsus4","Vaug","V6","Vs","VsMaj7","Vs7","Vsm","Vsm7","Vsm7b5","Vsdim7","Vssus4","Vsaug","Vs6","VI","VIMaj7","VI7","VIm","VIm7","VIm7b5","VIdim7","VIsus4","VIaug","VI6","VIs","VIsMaj7","VIs7","VIsm","VIsm7","VIsm7b5","VIsdim7","VIssus4","VIsaug","VIs6","VII","VIIMaj7","VII7","VIIm","VIIm7","VIIm7b5","VIIdim7","VIIsus4","VIIaug","VII6"];

  // ループ時に要素を追記する用の空欄を代入
  let degree_name = "";

  // 各コード名を代入し、HTMLに表示
  for(let i = 0; i < array.length; i++) {
     // ディグリーネーム一覧
    degree_name+="<div id="+array[i]+" class='degree'><a onclick=add('"+array[i]+"')><img src='/assets/"+array[i]+".png' class='degree_img' alt="+array[i]+"></a></div>";
     // ディグリーネームを表示
    degrees.innerHTML = degree_name;
  };
});




// コード一覧とディグリーネームの切り替え
const chord_list = document.getElementById("chord_list");
const degree_list = document.getElementById("degree_list");
const sakuhin = document.getElementById('sakuhin');
const chord_play = document.getElementById("chord_play");

// コード一覧クリックイベント
chord_list.addEventListener('click',()=>{
  chords.style.display = "flex";
  degrees.style.display = "none";
  setCookie("name", "");
  sakuhin.innerHTML = "";
  chord_play.style.display ="block";
});

// ディグリーネームクリックイベント
degree_list.addEventListener('click',()=>{
  degrees.style.display = "flex";
  chords.style.display = "none";
  setCookie("name", "");
  sakuhin.innerHTML = "";
  chord_play.style.display ="none";
});




//クッキーを設定
function setCookie(name, value, days) {
  // 有効期限
  let expires;
  if (days) {
      const date = new Date();
      date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
      expires = "; expires=" + date.toUTCString();
  } else {
     // 引数daysが無かった場合空欄を格納
      expires = "";
  };
  // クッキーを設定する
  document.cookie = name + "=" + value + expires ;
// 使用例:
// setCookie('session', 'test', 12);
};

// クッキーを取得する関数
function getCookie( name ){
  // 取得したクッキーを「;」区切りで分割し、配列を「変数cookies」に格納
  let cookies = document.cookie.split(';');

  // クッキーの数だけループ
  for( let i=0; i < cookies.length; i++ ){
     // 変数cookiesを「=」区切りでさらに分割し、配列を「変数cookie」に格納
    let cookie = cookies[i].trim().split( '=' );
     // 1つ目のクッキーのが「name」と同じであれば次の値を返す
    if( cookie[0] == name ){
        return cookie[1];
    };
  };
  // 処理した値を返す
  return "";
};



// 作品一覧に追加
window.add = function (a){

   // クッキーを取得
  let cookie = getCookie("name");
   // クッキーの設定
  setCookie("name", cookie + a + ",", 1)
   // クッキーを再度取得
  cookie = getCookie("name");
   // 正規表現でクッキーの文字列を取得
  let regexp = new RegExp(/(.*?)\,/g);
   // matchメソッドでクッキーから取得
  let view = cookie.match(regexp);
  console.log(view);
   // 要素追加用変数
  let chord_list="";
  let form_hidden="";

   // コード名取得
  for (let i = 0; i < view.length; i++) {
      let str= view[i].replace(/\,/,"");
      console.log(str);
   // クリック後に表示される要素
    chord_list+="<div id="+str+" class='chords'><p class='sakuhin'><img src='/assets/"+str+".png' class='chord_img' alt="+str+"></p><p class='remove' onClick=\"sakuzyo("+i+")\">×削除</p></div>";
    form_hidden+= str+",";

  sakuhin.innerHTML = chord_list;
  let form='<input type="hidden" value="'+form_hidden+'" name="chord[work]" id="chord_work">';
	document.getElementById('form').innerHTML = form;
  };
};





// 一覧から削除
window.sakuzyo = function (S){
   // クッキーを取得
  let cookie = getCookie("name");
  let regexp = new RegExp(/(.*?)\,/g);
  let view = cookie.match(regexp);

   // 各要素の空欄を生成
  let sakuhin_btn="";
  let resetting="";
  let form_hidden ="";

  // コード名取得
  for (let i = 0; i < view.length; i++) {
      let str= view[i].replace(/\,/,"");
    //クッキーの振りなおし
    if(i!=S){
    sakuhin_btn+="<div id="+str+" class='chords'><p class='sakuhin'><img src='/assets/"+str+".png' class='chord_img' alt="+str+"></p><p class='remove' onClick=\"sakuzyo('"+i+"')\">×削除</p></div>\n";
    resetting+= str + ",";
    form_hidden+= str +",";
    let form='<input type="hidden" value="'+form_hidden+' ," name="chord[work]" id="chord_work">';
    document.getElementById('form').innerHTML = form;
    };
     // クッキーの再設定
    setCookie("name", resetting);
    sakuhin.innerHTML = sakuhin_btn;
  };
};






// 再生ボタン
const audio_start = document.getElementById("audio_start");

window.play=function (){

  let cookie = getCookie("name");
  let regexp = new RegExp(/(.*?)\,/g);
  let view = cookie.match(regexp);

  // mp3拡張子とファイル先指定
  view = view.map(function(a){
    return "/assets/"+a+".mp3";
  });

  // オーディオの表示
  let audio = document.createElement('audio');
  audio_start.appendChild(audio);
  audio.src = view[0];
  audio.play();

  // 配列に入っている順に再生
  let index = 0;
  audio.addEventListener('ended',function(){
    index++;
    if (index < view.length) {
        audio.src = view[index];
        audio.play();
    };
  });
};
