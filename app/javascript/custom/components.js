document.addEventListener("turbo:load", () => {
  document.querySelector('#delete-alert-notice')?.addEventListener('click', () =>{
    clearAlerts();
  });
});

document.addEventListener("turbo:load", () => {
  document.querySelector('#delete-alert-alert')?.addEventListener('click', () =>{
    clearAlerts();
  });
});

const clearAlerts = () => {
  document.querySelector('#alert-alert-div')?.remove();
  document.querySelector('#notice-alert-div')?.remove();
}

const toggleNavMenu = () => {
  let dropMenu = document.querySelector('#navbarMenuHeroC');
  dropMenu.classList.toggle('is-active');
};

document.addEventListener("turbo:load", () => {
  document.querySelector('#toggleNavbar').addEventListener('click', () =>{
    toggleNavMenu();
  });
});
