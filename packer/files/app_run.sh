#!/bin/bash
set -e

#run app
echo "#!/bin/bash" > /etc/rc.local
echo "cd /home/appuser/reddit" >> /etc/rc.local
echo "puma -d" >> /etc/rc.local
