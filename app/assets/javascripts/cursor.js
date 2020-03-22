$(function() {

  let cursorR = 4;  //カーソルの半径
  const cursor = document.getElementById('cursor');  //カーソル用のdivを取得
  
  //上記のdivタグをマウスに追従させる処理
  document.addEventListener('mousemove', function (e) {
      cursor.style.transform = 'translate(' + e.clientX + 'px, ' + e.clientY + 'px)';
  });
  
  //リンクにホバー時はクラスをつける
  const linkElem = document.querySelectorAll('a');
  for (let i = 0; i < linkElem.length; i++) {
      linkElem[i].addEventListener('mouseover', function (e) {
          cursor.classList.add('hov_');
      });
      linkElem[i].addEventListener('mouseout', function (e) {
          cursor.classList.remove('hov_');      
      });
  }
  });