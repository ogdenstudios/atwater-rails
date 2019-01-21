function sidebarToggle() {
  var sidebar = document.getElementById("sidebar");
  var body = document.getElementById("body")
  if (!sidebar.classList.contains("active")) {
    sidebar.classList.add("active");
    body.classList.add("active");
  } else {
    sidebar.classList.remove("active");
    body.classList.remove("active");
  }
}
