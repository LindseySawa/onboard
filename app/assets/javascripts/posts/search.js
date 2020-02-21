$(function () {
  const searchResult = $('.search-result');

  function buildHTML(post) {
    let html = `<div class="search-result__each">
                <a href="/posts/${post.id}" data-method="get">
                  <img src="${post.image.url}">
                </a>
              </div>`
    searchResult.append(html);
  }

  function ErrMsgToHTML() {
    let html = `<div class="search-result__each">
                  <p>一致する投稿はありません</p>
                </div>`
    searchResult.append(html);
  }

  $(".search-input").on("keyup", function () {
    var input = $(".search-input").val();
    // console.log(input);
    $.ajax({
      type: 'GET',
      url: '/posts/search',
      data: { keyword: input },
      dataType: 'json'
    })
      .done(function (posts) {
        // console.log(posts);
        // })
        $('.search-result').empty();
        if (posts.length !== 0) {
          posts.forEach(function (post) {
            buildHTML(post);
          });
        }
        else {
          ErrMsgToHTML();
        }
      })
      .fail(function () {
        alert("非同期通信に失敗しました")
      });
  });
});

$(function () {
  $(".search-result__each").hover(function () {
    $(this).css('opacity', '70%');
    $(this).append("<div class='js'><p class='js__title'>" + $(this).children("a").attr("alt") + "</p></div>");
    $(this).children("div").stop().fadeIn(300);
    $(this).children("div").children("p").stop().animate({ "top": 0 }, 300);
  }, function () {
    $(this).css('opacity', '100%');
    $(this).children("div").stop().fadeOut(500);
    $(this).children("div").children("p").stop().animate({ "top": "10px" }, 300, function () {
      $(this).parent("div").remove();
    });
  });
});