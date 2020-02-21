$(function () {
  function buildHTML(comment) {
    var html = `<div class="comments-box">
                  <div class="comments-box__name">
                    ${comment.user_name}
                  </div>
                  <div class="comments-box__comment">
                    ${comment.content}
                  </div>
                </div>`
    return html;
  }
  $('#new_comment').on('submit', function (e) {
    e.preventDefault();
    // console.log(this)
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
      .done(function (data) {
        var html = buildHTML(data);
        $('.comments').append(html);
        $('#comment_content').val('');
      })
      .fail(function (data) {
        alert('error');
      })
      .always(function (data) {
        $('.comment-submit').prop('disabled', false);
      })
  })
})