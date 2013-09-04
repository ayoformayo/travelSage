function toggleFilter(event){
  event.preventDefault();
  $('.filterForm').toggleClass('hidden');
}

$(document).ready(function(){
  $('.filterButton').click(toggleFilter);
})
