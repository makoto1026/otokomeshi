$(function(){
  // リストを非表示
  $('.main__left--groups--lists').hide();
  // 繰り返し処理
  $('.main__left--groups--lists').each(function(i) {
  // 遅延させてフェードイン
  $(this).delay(100 * i).fadeIn(800);
  });
  });

$(function(){
  // リストを非表示
  $('.mypage__main--right--groups--list').hide();
  // 繰り返し処理
  $('.mypage__main--right--groups--list').each(function(i) {
  // 遅延させてフェードイン
  $(this).delay(100 * i).fadeIn(800);
  });
  });
  
