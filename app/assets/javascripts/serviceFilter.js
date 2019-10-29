document.addEventListener('DOMContentLoaded', function() {
    var bookContainer = document.getElementsByClassName('book__container')[0];
    var serviceFilters = document.getElementsByName('service');

    for (var i=0; i<serviceFilters.length; i++) {
        serviceFilters[i].addEventListener('change', function(event) {
            bookContainer.classList = 'book__container ' + event.target.id;
        });
    }
});