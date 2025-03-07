import os
from openai import OpenAI

from utils import load_api_key  

toml_file_path = "../secrets.toml"
load_api_key(toml_file_path)

api_key = os.getenv("OPENAI_API_KEY")
base_url = os.getenv("OPENAI_BASE_URL")

client = OpenAI(api_key=api_key, base_url=base_url)

response = client.chat.completions.create(
    model="gpt-4o",
    messages=[{"role": "user", "content": "Hello, what can you do?"}]
)

print(response)
print(response.choices[0].message.content)

# Streaming responses
stream = client.chat.completions.create(
    messages=[
        {
            "role": "user",
            "content": "Hello, what can you do?",
        }
    ],
    model="gpt-4o",
    stream=True,
)
for chunk in stream:
    print(chunk.choices[0].delta.content or "", end="")
