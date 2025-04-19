FROM hrishi2861/terabox:latest

WORKDIR /app

# Install necessary system packages
RUN apt update && apt install -y git build-essential

# Upgrade pip (optional but recommended)
RUN pip install --upgrade pip

# Copy and install Python requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Clone and install pyrofork (peer fix fork of Pyrogram)
RUN git clone https://github.com/Hrishi2861/pyrofork-2.2.11-peer-fix.git /tmp/pyrofork
RUN pip install /tmp/pyrofork

# Copy project files
COPY . .

# Start the bot
CMD ["bash", "start.sh"]
