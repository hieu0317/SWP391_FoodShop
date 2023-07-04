const sidebarButton = document.querySelector('.sidebar-button');
const sidebar = document.querySelector('.sidebar');

sidebarButton.addEventListener('click', () => {
  sidebar.classList.toggle('open');
});

const closeButton = document.querySelector('.close-button');

sidebarButton.addEventListener('click', () => {
  sidebar.classList.add('open');
});

closeButton.addEventListener('click', () => {
  sidebar.classList.remove('open');
});

const myForms = document.querySelectorAll('#myForm');
const myButtons = document.querySelectorAll('.buyNow');

myButtons.forEach((button, index) => {
  button.addEventListener('click', (e) => {
    e.preventDefault(); 

    const result = confirm('You sure to add this product to cart?');
  
    if (result) {
      alert('Add success!');
      myForms[index].submit(); 
    } else {
      alert('Add cancelled!');
    }
  });
});

