result=$(curl -s $1 | grep "MyShuttle Login")
echo $result
if [ -n "$result" ]
then
  echo "found it"
  exit 0
else
  echo "did not find it"
  exit 1
fi
