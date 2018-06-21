function showMenu() {
  const menu = document.getElementsByClassName("dropdown_menu")[0];
  if (menu) {
    menu.classList.toggle("visible");
  }
}