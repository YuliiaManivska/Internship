function load(){
$(".show").click(function(){
  $.ajax({
    url: `/diagnosis_items.json?patient_id=${$(this).attr('id')}`,
    dataType: "json",

    success: function (data, textStatus) {
      let res = data.map((item) => item.content)
      $(".load").text(res);
      console.log(data)
    }
  })
});
}
$(document).on('turbolinks:load', function() {
  load();
})
