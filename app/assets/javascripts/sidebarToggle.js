
function sidebarToggle() {
  var sidebar = document.getElementById("sidebar");
  if (!sidebar.classList.contains("active")) {
    sidebar.classList.add("active");
  } else {
    sidebar.classList.remove("active");
  }
}
