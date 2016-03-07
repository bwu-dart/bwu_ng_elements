## obsolete

#!/bin/sh
#docker run -v /home/zoechi:/app zoechi/dart-sass sass "$@"
find . -regextype posix-extended -regex '.*\/[^_][^/]*\.scss' -exec sass {} \;
