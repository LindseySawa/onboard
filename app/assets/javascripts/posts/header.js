$(function () {
  $('.header__home a').hover(function () {
    $(this).text('ホーム');
  }, function () {
    $(this).text('OnBoard');
  });

  $('.header__new a').hover(function () {
    $(this).text('最新');
  }, function () {
    $(this).text('New');
  });

  $('.header__post a').hover(function () {
    $(this).text('投稿');
  }, function () {
    $(this).text('Post');
  });

  $('.header__search a').hover(function () {
    $(this).text('検索');
  }, function () {
    $(this).text('Search');
  });

  $('.header__login a').hover(function () {
    $(this).text('ログイン');
  }, function () {
    $(this).text('Log in');
  });

  $('.header__signup a').hover(function () {
    $(this).text('新規登録');
  }, function () {
    $(this).text('Sign in');
  });


  $('.header__mypage a').hover(function () {
    $(this).text('マイページ');
  }, function () {
    $(this).text('My page');
  });


  $('.header__logout a').hover(function () {
    $(this).text('ログアウト');
  }, function () {
    $(this).text('Log out');
  });


});