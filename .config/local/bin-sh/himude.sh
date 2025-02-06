#!/usr/bin/env bash

function main() {
    MODE=`gum choose "Encrypt" "Decrypt" "Peek"`
    if [ -z "$MODE" ]; then
        exit 1
    fi

    case $MODE in
        Encrypt) encrypt ;;
        Decrypt) decrypt ;;
        Peek) peek ;;
        *)
            echo "himude: error: unknown option '$MODE'" >&2
            exit 1 ;;
    esac
}

function encrypt() {
    DIRS=`find . -maxdepth 1 -type d ! -name . -printf '%P/\n'`
    if [ -z "$DIRS" ]; then
        echo "himude: no suitable directory for encryption here" >&2
        exit 1
    fi

    IN_DIR=`echo "$DIRS" | gum choose` || exit 1
    PASSWD=`gum input --password --prompt="Passphrase> "` || exit 1
    CONFIRM_PASSWD=`gum input --password --prompt="Confirm passphrase> "` || exit 1

    if [ "$PASSWD" != "$CONFIRM_PASSWD" ]; then
        echo "himude: error: passphrases do not match!" >&2
        exit 1
    fi

    OUT_FILE=`gum input --prompt="Encrypted filename> " --value "secret.gpg"`
    if [ -z "$OUT_FILE" ]; then
        exit 1
    fi

    if [ -f "$OUT_FILE" ]; then
        echo "himude: error: file already exists: $OUT_FILE" >&2
        exit 1
    fi

    gum spin --title="Encrypting $IN_DIR..." -- gpgtar --encrypt --symmetric --output $OUT_FILE --gpg-args "--cipher-algo AES-256 --passphrase=\"$PASSWD\" --batch" $IN_DIR
    if [ $? -ne 0 ]; then
        echo "himude: error: failed to encrypt" >&2
        exit 1
    fi

    rm -rf $IN_DIR
    echo "himude: successfully encrypted $IN_DIR into $OUT_FILE"
}

function decrypt() {
    CANDIDATES=`find . -maxdepth 1 -type f -name "*.gpg"`
    if [ -z "$CANDIDATES" ]; then
        echo "himude: no suitable file to decrypt here" >&2
        exit 1
    fi

    IN_FILE=`echo "$CANDIDATES" | gum choose` || exit 1
    PASSWD=`gum input --password --prompt="Passphrase> "`
    if [ -z "$PASSWD" ]; then
        exit 1
    fi

    gum spin --title "Decrypting $IN_FILE..." -- gpgtar --decrypt --directory ./ --gpg-args "--cipher-algo AES-256 --passphrase=\"$PASSWD\" --batch" $IN_FILE
    if [ $? -ne 0 ]; then
        echo "himude: error: failed to decrypt" >&2
        exit 1
    fi

    rm $IN_FILE
    echo "himude: successfully decrypted $IN_FILE into current dir"
}

function peek() {
    FILES=`find . -maxdepth 1 -type f`
    if [ -z "$FILES" ]; then
        echo "himude: no suitable file to peek at, here" >&2
        exit 1
    fi

    IN_FILE=`echo "$FILES" | gum choose` || exit 1
    PASSWD=`gum input --password --prompt="Passphrase> "` || exit 1

    gum spin --show-output -- gpgtar --list-archive --gpg-args "--passphrase=\"$PASSWD\" --batch" $IN_FILE
}

main "$@"; exit
