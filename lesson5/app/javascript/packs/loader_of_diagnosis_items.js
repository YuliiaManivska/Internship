function setupDiagnosisItems(){
$(".show").click(function(){
  $.ajax({
    url: `/diagnosis_items.json?patient_id=${$(this).attr('id')}`,
    dataType: "json",

    success: function (data, textStatus) {
      const res = data.map((item) => item.content);
      let patientId = data.map((item) => item.patient_id) ;
      $(`#show-items${patientId}`).text(res);
    }
  })
});
}
$(document).on('turbolinks:load', function() {
  setupDiagnosisItems();
})
