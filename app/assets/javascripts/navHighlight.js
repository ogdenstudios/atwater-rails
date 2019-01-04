$( document ).on('turbolinks:load', function() {
    var current = location.pathname;
    // Hack to fix the root path bug for this highlight js. 
    if (current === "/") {
        current = "/home";
    }
    console.log((current === "/"));
    $('#sidebar a').each(function(){
        var $this = $(this);
        // if the current path is like this link, make it active
        if($this.attr('href').indexOf(current) !== -1){
            $this.addClass('active');
        }

    })
});