import requests

host = "0.0.0.0"
program_name = "checkers.aleo"
endpoint = f"http://{host}:3030/testnet3/program/{program_name}"

response = requests.get(endpoint)

content = response.content.decode('utf-8').strip('"').split("\\n")

print(endpoint)

for line in content:
    print(line)