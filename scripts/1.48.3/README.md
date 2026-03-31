# auto-build 1.48.3-b2
Autobuild 1.48.3 brings a few bugfixes and a startup feature to log it to a build file whilst keeping the output, using tee.

## In-depth changelog
A new file called Start_Build.sh is the main build wrapper for the fetch.sh script.<br>

## The future
This wrapper will soon become independent and will fetch scripts dynamically and loads them dynamically as it goes.<br>
This feature will be Bash-exclusive, and if it detects a shell other than Bash, it will fall back to static loading.