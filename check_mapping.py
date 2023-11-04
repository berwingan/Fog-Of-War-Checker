import requests

host = "0.0.0.0"
program_id = "checkers.aleo"
mapping_name = "hash_to_game"
mapping_key = "155897608596427540736482836348993013212u128"

endpoint = f"http://{host}:3030/testnet3/program/{program_id}/mapping/{mapping_name}/{mapping_key}"


result = requests.get(endpoint)
print(endpoint)
print(result.content)