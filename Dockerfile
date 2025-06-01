FROM python:3.11.12-alpine3.22

# Install system dependencies
RUN apk update && \
    apk add --no-cache \
        g++ \
        libffi-dev \
        openblas-dev \
        lapack-dev \
        freetype-dev \
        libpng-dev \
        jpeg-dev \
        musl-dev \
        python3-dev \
        py3-pip \
        bash \
        build-base 

# Install jupyter notebook server
RUN pip install jupyterlab notebook

# Set working directory
WORKDIR /src

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install -r requirements.txt

# Copy source code
COPY . .

# Expose port (for notebook or other services)
EXPOSE 8888

# Command to start the notebook
# CMD ["sh", "-c", "while true; do sleep 60; done"]
CMD [ "jupyter", "notebook", "--ip=0.0.0.0", "--allow-root", "--IdentityProvider.token=", "--ServerApp.password=" ]


