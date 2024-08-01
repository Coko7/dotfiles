wrfe() {
    query=`url_encode "$@"`
    xdg-open "https://www.wordreference.com/fren/$query";
}

wref() {
    query=`url_encode "$@"`
    xdg-open "https://www.wordreference.com/enfr/$query";
}
