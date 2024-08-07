wrfe() {
    query=`MY_url_encode "$@"`
    xdg-open "https://www.wordreference.com/fren/$query";
}

wref() {
    query=`MY_url_encode "$@"`
    xdg-open "https://www.wordreference.com/enfr/$query";
}
