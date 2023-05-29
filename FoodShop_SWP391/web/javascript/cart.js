const decreaseBtn = document.getElementById('decrease-btn');
const increaseBtn = document.getElementById('increase-btn');
const numberInput = document.getElementById('number-input');

decreaseBtn.addEventListener('click', () => {
  decreaseNumber();
});

increaseBtn.addEventListener('click', () => {
  increaseNumber();
});

function decreaseNumber() {
  let value = parseInt(numberInput.value);
  value = isNaN(value) ? 0 : value;
  value = value > 0 ? value - 1 : 0;
  numberInput.value = value;
}

function increaseNumber() {
  let value = parseInt(numberInput.value);
  value = isNaN(value) ? 0 : value;
  value = value + 1;
  numberInput.value = value;
}
