$(function(){
  function buildHTML(comment){
    if ( comment.user_image ) {
      var html = `<div class="comments-box__message">
                    <div class="comments-box__message__items">
                      <div class="comments-box__message__items__user">
                        <img src=${comment.user_image} width="30" height="30">
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
                              <a id="delete_btn" rel="nofollow" data-method="delete" href="/items/${comment.iemm_id}/comments/${comment.id}">
                                <i class="fa fa-trash"></i>
                              </a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>`
    } else {
      var html = `<div class="comments-box__message">
                    <div class="comments-box__message__items">
                      <div class="comments-box__message__items__user">
                        <img src="/assets/member_photo_noimage_thumb-3f5db95de8bc1582908f994329d16ed91cf4398c2e3e0cc7387e0f2f8f0c88a9.png" width="30" height="30">
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
                      </div>
                    </div>
                  </div>`
    }
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData(this);
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