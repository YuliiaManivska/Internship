function setupDiagnosisItems(){
  $(".show").click(function(){
    let patientId = $(this).attr('id');

    $.ajax({
      url: `/diagnosis_items.json?patient_id=${patientId}`,
      dataType: "json",

      success: function (data, textStatus) {
        const res = data.map((item) => item.content);
        $(`#show-items${patientId}`).html('<div>' + res + '</div>');
      }
    })
  });
}
$(document).on('turbolinks:load', function() {
  setupDiagnosisItems();
})
