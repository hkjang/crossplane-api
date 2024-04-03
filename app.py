from flask import Flask, jsonify
import crossplane
from dotenv import load_dotenv
import os

# 환경 변수 로드
load_dotenv()

# 환경 변수에서 Nginx 구성 파일 경로와 포트 번호 가져오기
nginx_conf_path = os.getenv('NGINX_CONFIG_PATH')
flask_port = os.getenv('FLASK_PORT', 5000)  # 기본값은 5000

app = Flask(__name__)

@app.route('/nginx-config', methods=['GET'])
def get_nginx_config():
    try:
        # Crossplane을 사용하여 Nginx 구성 파일 파싱
        parsed_config = crossplane.parse(nginx_conf_path)
        return jsonify(parsed_config), 200
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True, port=int(flask_port))

