function jdk
    # Set java executable
    sudo update-alternatives --set java "/usr/lib/jvm/temurin-$argv[1]-jdk/bin/java"

    # Set javac executable
    sudo update-alternatives --set javac "/usr/lib/jvm/temurin-$argv[1]-jdk/bin/javac"

    # Set JAVA_HOME environment variable for the current session and future sessions (if sourced from config.fish)
    # The path for JAVA_HOME should be the JDK root directory, not including /bin/java
    set -gx JAVA_HOME "/usr/lib/jvm/temurin-$argv[1]-jdk"

    # Display current versions to confirm the change
    java -version
    javac -version
end
