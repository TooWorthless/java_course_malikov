document.addEventListener('DOMContentLoaded', function() {
    const showRegisterLink = document.getElementById('show-register');
    const showLoginLink = document.getElementById('show-login');
    const loginForm = document.getElementById('login-form');
    const registerForm = document.getElementById('register-form');

    showRegisterLink.addEventListener('click', function(event) {
        event.preventDefault();
        loginForm.style.display = 'none';
        registerForm.style.display = 'block';
    });

    showLoginLink.addEventListener('click', function(event) {
        event.preventDefault();
        registerForm.style.display = 'none';
        loginForm.style.display = 'block';
    });
});
