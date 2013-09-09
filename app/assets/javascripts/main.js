// function onSuccess(success){
//   var newDiv = ""
 
// }
function toggleFilter(event){
  event.preventDefault();
  $('.filterForm').toggleClass('hidden');
}
// function submitFilter(event){
//   // event.preventDefault();
//   arr = $(this).serializeArray();
// $.post('/filter', arr, onSuccess)
//   // console.log($(this).serializeArray());
// }

$(document).ready(function(){
  $('.filterButton').click(toggleFilter);
  // $('.filterForm').on('submit',submitFilter);
})
