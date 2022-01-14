function load(){
$(".show").click(function(){
  $.ajax({
    url: `/diagnosis_items.json?patient_id=${$(this).attr('id')}`,
    dataType: "json",

    success: function (data, textStatus) {
      let res = JSON.stringify(data)
      $(".load").text(res);
      console.log(data)
    }
  })
});
}
$(document).ready(function() {
  load()
});
