
function toggleFilter(event){
  event.preventDefault();
  $('.filterForm').toggleClass('hidden');
}

$('.callToAction').ready(function(){
  $('.filterButton').click(toggleFilter);

})
