$(function(){
  let buildPrompt = `<option value>選択して下さい</option>`
  let buildHtmlOption = function(parent) {
    let option = `<option value ="${parent.id}">${parent.name}</option>`
    return option
  }
  $('#parent-edit').change(function() {
    let parent_id = $(this).val();
    $.ajax({
      type: 'GET',
      url: '/items/items/new/mid_category',
      data: {big_category_id: parent_id},
      dataType: 'json'
    })
    .done(function(parent) {
      $('.child').css('display', 'block');
      $('#child').empty();
      $('.grand_child').css('display', 'none');
      $('#child').append(buildPrompt);

      parent.forEach(function(child) {
        var html_option = buildHtmlOption(child);
        $('#child').append(html_option);
      });
    })
    .fail(function() {
      alert('カテゴリー取得に失敗しました')
    });
  });

  $(this).on("change", "#child", function() {
    let parent_id = $("#parent").val();
    let child_id = $("#child").val();

    $.ajax({
        type: 'GET',
        url: '/items/items/new/small_category',
        data: {
          big_category_id: parent_id,
          mid_category_id: child_id
        },
        dataType: 'json'
    })
    .done(function(parent) {
      $('.grand_child').css('display', 'block');
      $('#grand_child').empty();
      $('#grand_child').append(buildPrompt);

      parent.forEach(function(child) {
        var html_option = buildHtmlOption(child);
        $('#grand_child').append(html_option);
      });
    })
  });
});