# client/client.py
import urllib.request, json, os
import sys

address = str(os.environ.get("SERVER_ADDRESS"))
port = str(os.environ.get("SERVER_PORT"))

url = f"http://{address}:{port}"

try:
    with urllib.request.urlopen(url) as response:
        data = json.loads(response.read().decode())
except Exception as e:
    print(f"Could not connect to server at {url}")
    print(f"Reason: {e}")
    sys.exit(1)

file_text = data["file"]
checksum_server = data["checksum"]

os.makedirs("/clientdata", exist_ok=True)
with open("/clientdata/random.txt", "w") as f:
    f.write(file_text)

checksum_client = sum(ord(c) for c in file_text)

print("Server checksum:", checksum_server)
print("Client checksum:", checksum_client)
if checksum_client == checksum_server:
    print("✅ File transfer correct!")
else:
    print("❌ File missmatch!")
