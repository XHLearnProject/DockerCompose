# 从 Python 3.10 映像开始构建映像
FROM python:3.10-alpine

# 将工作目录设置为 。/code
WORKDIR /code

# 设置命令使用的环境变量
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0

# 安装 gcc 和其他依赖
# RUN apk add --no-cache gcc musl-dev linux-headers

# 复制并安装 Python 依赖项。requirements.txt
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# 将元数据添加到映像，以描述容器正在侦听端口 5000
EXPOSE 5000

# 将项目中的当前目录复制到映像中的 workdir
COPY . .

# 将容器的默认命令设置为 。flask run
CMD ["flask", "run"]
