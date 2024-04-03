
#!/bin/bash

# 종료하려는 Gunicorn 프로세스의 포트 번호
PORT=3020

# 해당 포트를 사용하는 프로세스의 PID 찾기
PID=$(lsof -t -i:$PORT -sTCP:LISTEN)

# PID가 존재하면 해당 프로세스 종료
if [ ! -z "$PID" ]; then
  echo "Gunicorn process running on port $PORT with PID $PID will be stopped."
  kill -9 $PID
  echo "Process stopped."
else
  echo "No Gunicorn process found running on port $PORT."
fi

