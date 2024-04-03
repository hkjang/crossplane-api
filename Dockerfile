# 기본 이미지로 Python 3.9 사용
FROM python:3.9-slim

# 작업 디렉토리 설정
WORKDIR /app

# 현재 디렉토리의 파일을 컨테이너의 작업 디렉토리로 복사
COPY . /app

# requirements.txt를 사용하여 필요한 패키지 설치
RUN pip install --no-cache-dir -r requirements.txt

# Flask 애플리케이션 실행을 위한 환경 변수 설정
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# .env 파일을 컨테이너 내부로 복사 (선택적)
#COPY .env /app/.env

# Flask 서버 포트 노출
EXPOSE 8000

# Flask 애플리케이션 실행
CMD ["flask", "run", "--port=8000"]

