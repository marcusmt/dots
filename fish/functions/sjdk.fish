function sjdk
    set -Ux JAVA_HOME "$HOME/Applications/jdks/jdk$argv[1]"
    set -Ux fish_user_paths "$JAVA_HOME/bin" (string match -v "$HOME/Applications/jdks/*" $fish_user_paths)
    mkdir -p ~/.bashrc.d
    echo "export JAVA_HOME=\"$JAVA_HOME\"
export PATH=\"\$JAVA_HOME/bin:\$PATH\"" >~/.bashrc.d/java.sh
end
