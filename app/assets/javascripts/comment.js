jQuery(function($){
  function buildHTML(comment){
    var html = `<div class="comments-box__message">
                  <div class="comments-box__message__items">
                    <div class="comments-box__message__items__user">
                      <div class="comments-box__message__items__user__name">${comment.user_name}</div>
                    </div>
                    <div class="comments-box__message__items__body">
                      ${comment.text}
                      <div class="comments-box__message__items__body__icons">
                        <div class="comments-box__message__items__body__icons__left">
                          <i class="fa fa-history"></i>
                          <span>${comment.created_at}</span>
                        </div>
                        <div class="comments-box__message__items__body__icons__right">
                          <div class="message-delete">
                            <a id="delete_btn" rel="nofollow" data-method="delete" href="/items/${comment.item_id}/comments/${comment.id}">
                              <i class="fa fa-trash"></i>
                            </a>
                          </div>
                        </div>
                      </div>
                    </divZ>
                  </div>
                </div>`
    return html;
  }
  // ↓送信ボタンクリック時にイベント発火
  jQuery('#new_comment').on('submit', function(e){
    //↓e.preventDefaultで送信ボタンクリック時の通信を止める 
    e.preventDefault();
    var formData = new FormData(this);
    // ↓非同期通信でコメントが保存されるようにする
    var url = $(this).attr('action')
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      var html = buildHTML(data);
      $('.message-box').append(html);
      $('.comment-area').val('');
      $('.comment-btn__submit').prop('disabled', false);
    })
  })
})