$(function() {

  $(function(){
    function appendOption(category){
      var html = `<option value="${category.id}" data-category="${category.id}">${category.name}</option>`;
      return html;
    }

    function appendChidrenBox(insertHTML){
      var childSelectHtml = '';
      childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
                          <div class='listing-select-wrapper__box'>
                            <select class="listing-select-wrapper__box--select" id="child_category" name="post[category_id]">
                              <option value="カテゴリ選択" data-category="カテゴリ選択">カテゴリ選択</option>
                              ${insertHTML}
                            <select>
                          </div>
                        </div>`;
      $('.listing-product-detail__category').append(childSelectHtml);
    }

    $('#parent_category').on('change', function(){
      var parentCategory = document.getElementById('parent_category').value; 
      if (parentCategory != "カテゴリ選択"){ 
        $.ajax({
          url: 'get_category_children',
          type: 'GET',
          data: { parent_id : parentCategory },
          dataType: 'json'
        })
        .done(function(children){
          $('#children_wrapper').remove(); 
          var insertHTML = '';
          children.forEach(function(child){
            insertHTML += appendOption(child);
          });
  
          appendChidrenBox(insertHTML);
        })
        .fail(function(){
          alert('カテゴリー取得に失敗しました');
        })
      }else{
        $('#children_wrapper').remove();
      }
    });
  });
  
  }, false);
  