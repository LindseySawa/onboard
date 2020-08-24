$(function () {
  $('form').on('change', 'input[type="file"]', function (e) {
    var file = e.target.files[0],
      reader = new FileReader(),
      $preview = $(".field-icon");
    $usericon = $(".field-icon i");

    if (file.type.indexOf("image") < 0) {
      return false; //一致するものがなければfalse
    }

    reader.onload = (function (file) {
      return function (e) {
        $usericon.remove(); //iconを消す
        $preview.append($('<img>').attr({ //属性をpreviewのimgに追加
          src: e.target.result, //取得した結果
          width: "150px",
          height: "150px",
          class: "field-icon",
          title: file.name
        }));
      };
    })(file);

    reader.readAsDataURL(file); //ファイル読み込み
  });
});
