function ujdk
    for v in 8 11 17 21 25
        set -l dir "$HOME/Applications/jdks/jdk$v"
        set -l data (curl -s "https://api.adoptium.net/v3/assets/latest/$v/hotspot?os=linux&architecture=x64" | jq -r '.[] | select(.binary.image_type == "jdk") | "\(.release_name) \(.binary.package.link)"' | head -n1)
        set -l remote_ver (string split " " $data)[1]
        set -l url (string split " " $data)[2]

        if test -f "$dir/.version"; and test (cat "$dir/.version") = "$remote_ver"
            continue
        end

        rm -rf "$dir"
        mkdir -p "$dir"
        curl -Ls "$url" | tar -xz -C "$dir" --strip-components=1
        echo "$remote_ver" >"$dir/.version"
    end
end
