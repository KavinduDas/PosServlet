const quotes = [
    "Life is what happens when you're busy making other plans.",
    "The future belongs to those who believe in the beauty of their dreams.",
    "The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart.",
    // Add more quotes as needed
];

let currentLetterIndex = 0;
let currentQuote = "";
let lastQuoteIndex = -1;

function typeLetterByLetter() {
    const quotesElement = document.getElementById('quotes');
    if (currentLetterIndex < currentQuote.length) {
        quotesElement.innerHTML += currentQuote[currentLetterIndex];
        currentLetterIndex++;
        setTimeout(typeLetterByLetter, 50);
    } else {
        setTimeout(displayRandomQuote, 5000);
    }
}

function displayRandomQuote() {
    let randomIndex;
    do {
        randomIndex = Math.floor(Math.random() * quotes.length);
    } while (quotes.length > 1 && randomIndex === lastQuoteIndex);

    lastQuoteIndex = randomIndex;
    currentQuote = quotes[randomIndex];
    currentLetterIndex = 0;
    document.getElementById('quotes').innerHTML = "";
    typeLetterByLetter();
}

// Start the quote display when page loads
window.onload = displayRandomQuote;