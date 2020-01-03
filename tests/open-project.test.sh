GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

test="Call to open-project without project argument"
if open-project | grep -q 'Please specify which project to open'; then
  echo -e \"$test\". ${GREEN}Test PASSED${NC}
else
  echo -e \"$test\". ${RED}Test FAILED${NC}
fi

test="Assert launch scripts directory exists"
if [ -e "./../launch-scripts" ]; then
  echo -e \"$test\". ${GREEN}Test PASSED${NC}
else
  echo -e \"$test\". ${RED}Test FAILED${NC}
fi

test="Call with project that lacks launch-script"
if open-project non-existent1w21 | grep -q 'Project specified has no launch script'; then
  echo -e \"$test\". ${GREEN}Test PASSED${NC}
else
  echo -e \"$test\". ${RED}Test FAILED${NC}
fi

test="Call with project that has launch-script"
touch "$SCRIPTPATH/../launch-scripts/dummy159-launch-script.sh"
if open-project dummy159 | grep -q 'dummy159 launch script found'; then
  echo -e \"$test\". ${GREEN}Test PASSED${NC}
else
  echo -e \"$test\". ${RED}Test FAILED${NC}
fi
rm "$SCRIPTPATH/../launch-scripts/dummy159-launch-script.sh"
