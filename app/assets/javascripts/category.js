// $(function(){
//   function appendOption(category){ // optionの作成
//     var html = `<option value="${category.id}">${category.name}</option>`;
//     return html;
//   }
//   function appendChidrenBox(insertHTML){ // 子セレクトボックスのhtml作成
//     var childSelectHtml = '';
//       childSelectHtml = `<div class='product-select-wrapper' id= 'children_wrapper'>
//                         <div class='product_category-select'>
//                         <select class="category_select-box" id="child_category" name="item[category_id]">
//                         <option value="---">---</option>
//                         ${insertHTML}
//                         </select>
//                         <i class='fa fa-chevron-down'></i>
//                         </div>
//                         <div class= 'product_select-grandchildren'>
//                         </div>
//                         </div>`;
//     $('.product_select-children').append(childSelectHtml);
//   }
//   function appendgrandChidrenBox(insertHTML){ // 孫セレクトボックスのhtml作成
//     var grandchildrenSelectHtml = '';
//     grandchildrenSelectHtml = `<div class='product-select-wrapper' id= 'grandchildren_wrapper'>
//                               <div class='product_category-select'>
//                               <select class="category_select-box" id="grandchild_category" name="item[category_id]">
//                               <option value="---">---</option>
//                               ${insertHTML} 
//                               </select>
//                               <i class='fa fa-chevron-down'></i>
//                               </div>
//                               <div class= 'product_select-grandchildren'>
//                               </div>
//                               </div>`;
//     $('.product_select-grandchildren').append(grandchildrenSelectHtml);
//   }



//   $(document).on('change', '#category_select', function(){  // 親セレクトボックスの選択肢を変えたらイベント発火
//     var category = document.getElementById('category_select').value; 
//   // ↑ productcategoryに選択した親のvalueを代入
//     if (category != '---'){
//  // ↑ productcategoryが空ではない場合のみAjax通信を行う｡選択肢を初期選択肢'---'に変えると､通信失敗となってしまうため｡
//         $.ajax({
//         url: 'get_category_children_posts',
//         type: 'GET',
//         data: { category: category },
//         dataType: 'json'
        
//       })

//       .done(function(children){  // 送られてきたデータをchildrenに代入
//         var insertHTML = '';
//         children.forEach(function(child){  
//   // forEachでchildに一つずつデータを代入｡子のoptionが一つずつ作成される｡
//           insertHTML += appendOption(child); 
//         });
//         appendChidrenBox(insertHTML); 
//         $(document).on('change', '#category_select', function(){
//   // 通信成功時に親の選択肢を変えたらイベント発火｡子と孫を削除｡selectのidにかけるのではなく､親要素にかけないと残ってしまう
//           $('#children_wrapper').remove(); 
//           $('#grandchildren_wrapper').remove();
//         })
//       })
//       .fail(function(){
//         alert('カテゴリー取得に失敗しました');

//       })
//     }
//   });


//   // document､もしくは親を指定しないと発火しない
//   $(document).on('change', '#child_category', function(){
//     var category = document.getElementById('child_category').value;
//     if (category != ''){
//     $.ajax ({
//       url: 'category_grandchildren',
//       type: 'GET',
//       data: { category: category },
//       dataType: 'json'
//     })
//     .done(function(grandchildren){
//       var insertHTML = '';
//       grandchildren.forEach(function(grandchild){
//         insertHTML += appendOption(grandchild);
//         });
//         appendgrandChidrenBox(insertHTML);  
//         $(document).on('change', '#child_category',function(){
//           $('#grandchildren_wrapper').remove();
//           })
//         })  
//         .fail(function(){
//           alert('カテゴリー取得に失敗しました');
//         })
//     }
//   });
// });