document.addEventListener('DOMContentLoaded', function () {
    const slides = document.querySelector('.slides');
    const slide = document.querySelectorAll('.slide');
    const prevBtn = document.querySelector('.prev');
    const nextBtn = document.querySelector('.next');

    let currentIndex = 0;
    const totalSlides = slide.length;

    function showSlide(index) {
        if (index >= totalSlides) {
            currentIndex = 0;
        } else if (index < 0) {
            currentIndex = totalSlides - 1;
        } else {
            currentIndex = index;
        }
        slides.style.transform = 'translateX(' + (-currentIndex * 100) + '%)';
    }

    nextBtn.addEventListener('click', function () {
        showSlide(currentIndex + 1);
    });

    prevBtn.addEventListener('click', function () {
        showSlide(currentIndex - 1);
    });
});