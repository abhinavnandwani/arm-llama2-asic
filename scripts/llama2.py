import os
from transformers import LlamaForCausalLM, LlamaTokenizer

# Define the model name and path
MODEL_NAME = "meta-llama/Llama-2-7b"  # Change this to the 42M param model if it's available.
SAVE_DIR = "llama2_model"

def download_model():
    # Create the save directory if it doesn't exist
    if not os.path.exists(SAVE_DIR):
        os.makedirs(SAVE_DIR)

    # Load the tokenizer and model
    print(f"Downloading model {MODEL_NAME}...")
    tokenizer = LlamaTokenizer.from_pretrained(MODEL_NAME)
    model = LlamaForCausalLM.from_pretrained(MODEL_NAME)

    # Save the model and tokenizer
    print(f"Saving model to {SAVE_DIR}...")
    tokenizer.save_pretrained(SAVE_DIR)
    model.save_pretrained(SAVE_DIR)
    print("Download complete!")

if __name__ == "__main__":
    download_model()
