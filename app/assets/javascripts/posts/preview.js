// $(document).on('turbolinks:load', function () {
//   $fileField = $('#upload-image')

//   $($fileField).on('change', $fileField, function (e) {

//     file = e.target.files[0]
//     reader = new FileReader(),
//       $preview = $(".main__left");

//     reader.onload = (function (file) {
//       return function (e) {
//         $preview.empty();
//         $preview.append($('<img>').attr({
//           src: e.target.result,
//           width: "90%",
//           height: "250px",
//           class: "preview-image",
//           // autoplay: "autoplay",
//           // loop: "loop",
//           // playsinline: "true",
//           title: file.name
//         }));
//       };
//     })(file);
//     reader.readAsDataURL(file);
//   });
// });
// $(function () {
//   function readURL(input) {
//     if (input.files && input.files[0]) {
//       var reader = new FileReader();
//       reader.onload = function (e) {
//         $('#upload_image').attr('src', e.target.result);
//       }
//       reader.readAsDataURL(input.files[0]);
//     }
//   }
//   $(".main__left").change(function () {
//     readURL(this);
//   });
// });