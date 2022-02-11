


document.addEventListener("turbo:load", () => {
  document.querySelector('#delete-alert-notice')?.addEventListener('click', () =>{
    document.querySelector('#notice-alert-div').remove();
  });
});

document.addEventListener("turbo:load", () => {
  document.querySelector('#delete-alert-alert')?.addEventListener('click', () =>{
    document.querySelector('#alert-alert-div').remove();
  });
});