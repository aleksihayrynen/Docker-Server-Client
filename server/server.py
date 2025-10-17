# server/server.py
from http.server import BaseHTTPRequestHandler, HTTPServer
import random, string, json, os

data = ''.join(random.choices(string.ascii_letters + string.digits, k=1024))

with open("/serverdata/random.txt", "w") as f:
    f.write(data)

class MyHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        checksum = sum(ord(c) for c in data)
        response = {"file": data, "checksum": checksum}
        self.send_response(200)
        self.send_header("Content-Type", "application/json")
        self.end_headers()
        self.wfile.write(json.dumps(response).encode())


if __name__ == "__main__":
    port = int(os.environ.get("SERVER_PORT"))
    server = HTTPServer(("0.0.0.0", port), MyHandler)
    server.serve_forever()
