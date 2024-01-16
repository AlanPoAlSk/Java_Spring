/**
 * 
 */
 
 var elements = document.querySelectorAll('.name');

    elements.forEach(function(element) {
        if (element.textContent.trim().charAt(0).toUpperCase() === 'G') {
            element.classList.add('highlight');
        } else {
            element.classList.remove('highlight');
        }
    });
 