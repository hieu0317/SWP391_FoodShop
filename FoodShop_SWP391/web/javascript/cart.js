//const decreaseBtn = document.getElementById('decrease-btn');
//const increaseBtn = document.getElementById('increase-btn');
//const numberInput = document.getElementById('number-input');
//
//decreaseBtn.addEventListener('click', () => {
//  decreaseNumber();
//});
//
//increaseBtn.addEventListener('click', () => {
//  increaseNumber();
//});
//
//function decreaseNumber() {
//  let value = parseInt(numberInput.value);
//  value = isNaN(value) ? 0 : value;
//  value = value > 0 ? value - 1 : 0;
//  numberInput.value = value;
//}
//
//function increaseNumber() {
//  let value = parseInt(numberInput.value);
//  value = isNaN(value) ? 0 : value;
//  value = value + 1;
//  numberInput.value = value;
//}
document.addEventListener('DOMContentLoaded', function() {
  const decreaseBtns = document.querySelectorAll('.decrease-btn');
  const increaseBtns = document.querySelectorAll('.increase-btn');
  const numberInputs = document.querySelectorAll('.number-input');

  decreaseBtns.forEach(function(decreaseBtn, index) {
    decreaseBtn.addEventListener('click', function() {
      let currentValue = parseInt(numberInputs[index].value);
      if (currentValue > 0) {
        numberInputs[index].value = currentValue - 1;
      }
    });
  });

  increaseBtns.forEach(function(increaseBtn, index) {
    increaseBtn.addEventListener('click', function() {
      let currentValue = parseInt(numberInputs[index].value);
      numberInputs[index].value = currentValue + 1;
    });
  });
});


