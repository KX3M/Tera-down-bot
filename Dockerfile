FROM hrishi2861/terabox:latest

WORKDIR /app

# Optional: Check python & pip versions for debug
RUN python3 --version && pip3 --version

# Install dependencies
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy all source files
COPY . .

# Start the app
CMD ["bash", "start.sh"]
