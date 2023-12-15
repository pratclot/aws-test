import json
import os
import boto3
import logging

logger = logging.getLogger()
logger.setLevel(logging.INFO)


def lambda_handler(event, context):
    # Get the encrypted secret from AWS Secrets Manager
    secret_name = os.getenv("SECRET_NAME")
    client = boto3.client("secretsmanager")
    response = client.get_secret_value(SecretId=secret_name)
    secret = response

    # Extract the element from the JSON list based on the decrypted secret
    encrypted_secret = secret.get("SecretString", "")
    data = event["detail"]
    selected_data = data.get(encrypted_secret, {})
    logger.info(f"{selected_data['name']} is on {selected_data['planet']}")
