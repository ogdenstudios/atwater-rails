function sidebarToggle() {
  var sidebar = document.getElementById("sidebar");
  var body = document.getElementById("body")
  if (!sidebar.classList.contains("active")) {
    sidebar.classList.add("active");
    body.style.display = "none";
  } else {
    sidebar.classList.remove("active");
    body.style.display = "flex";
  }
}
