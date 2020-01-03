# $1 => project name

# Check if arguments provided
if [ -z "$1" ]; then
  echo 'Please specify which project to open'
  exit 1
fi

# Check if project specified has launch-script
scriptPath=`dirname $(realpath $0)`
launchScript="${scriptPath}/launch-scripts/${1}-launch-script.sh"
if [ ! -f $launchScript ]; then
  echo 'Project specified has no launch script'
  exit 1
else
  echo "$1 launch script found"
fi

# Run project launch-script
cd $(dirname $launchScript)
./"$1-launch-script.sh"
