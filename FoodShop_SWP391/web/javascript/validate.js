function Validator(options) {
    var formElement = document.querySelector(options.form);
    var validate = function (inputElement, rule) {
        var errorElement = inputElement.parentElement.querySelector('.form-message');

        var errorMessage = rule.test(inputElement.value);
        if (errorMessage) {

            errorElement.innerText = errorMessage;
            inputElement.parentElement.classList.add('invalid');
            console.log(inputElement.parentElement.classList);
        } else {
            errorElement.innerText = '';
            inputElement.parentElement.classList.remove('invalid');
        }
    };
    if (formElement) {
        options.rules.forEach(function (rule) {
            var inputElement = formElement.querySelector(rule.selector);
            if (inputElement) {
                inputElement.onblur = function () {
                    validate(inputElement, rule);
                };
                inputElement.oninput = function () {
                    var errorElement = inputElement.parentElement.querySelector('.form-message');
                    errorElement.innerText = '';
                    inputElement.parentElement.classList.remove('invalid');
                };


            }
        });
    }

}

Validator.isRequired = function (selector, message) {
  return {
    selector: selector,
    test: function (value) {
      return value ? undefined : message || "Please enter this field";
    }
  };
};

Validator.isEmail = function (selector) {
    return{
        selector: selector,
        test: function (value) {
            var regex = /\\w+([\\.]{0,1}\\w*)*@(\\w{2,5}\\.){1,2}\\w{2,5}/;
            return regex.test(value) ? undefined : 'Please enter the correct your email';
        }
    };
};

Validator.isPassword = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            var regex = /^(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()])[A-Za-z\d!@#$%^&*()]{8,}$/;
            if (!regex.test(value)) {
                return 'Password must have at least 8 characters, first letter capitalized and at least 1 special character.';
            }
            return undefined;
        }
    };
};

Validator.isPhone = function (selector) {
    return {
        selector: selector,
        test: function (value) {
            var regex = /^(?:\+84|0)(?:3[2-9]|5[2689]|7[06-9]|8[1-9]|9[0-9])[0-9]{7}$/;
            if (!regex.test(value)) {
                return 'Please enter the correct phone number';
            }
            return undefined;
        }
    };
};

const form1 = document.getElementById('form-1');
const form2 = document.getElementById('form-2');
const form3 = document.getElementById('form-3');
const form4 = document.getElementById('form-4');
const form5 = document.getElementById('form-5');
const form6 = document.getElementById('form-6');