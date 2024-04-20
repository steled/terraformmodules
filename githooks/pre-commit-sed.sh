#!/usr/bin/env bash
# sed pre-commit hook: duplicate decrypted sensitive file and redact sensitive informations via sed

tmp=$(mktemp)
IFS=$'\n'
for secret_file in $(git -c core.quotePath=false ls-files | git -c core.quotePath=false check-attr --stdin filter | awk 'BEGIN { FS = ":" }; /crypt$/{ print $1 }'); do
    # Skip symlinks, they contain the linked target file path not plaintext
    if [[ -L $secret_file ]]; then
        continue
    fi

    # extract filename
    filename="${secret_file##*/}"
    # get file extension
    file_extension="${filename##*.}"
    # get filename without extension
    file="${filename%.*}"
    # extract directory
    dir="$(dirname ${secret_file})"

    # if test -f "${dir}/${file}.sed"; then
    if test -f "${dir}/${filename}.sed"; then
        if [ $file_extension == $file ]; then
            sed -f "${dir}/${filename}.sed" $secret_file > "${dir}/${file}_dec"
        else
            sed -f "${dir}/${filename}.sed" $secret_file > "${dir}/${file}.${file_extension}.dec"
        fi
    fi

done
rm -f "${tmp}"
unset IFS