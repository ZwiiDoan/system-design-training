
import json
import random
import uuid
import boto3

def handler(event, context):
    client = boto3.client("events")

    transaction_id = str(uuid.uuid4())
    amount = round(random.uniform(0, 1000), 2)
    account_age = random.randint(0, 100)
    location_is_foreign = random.choice([True, False])

    transaction_detail = {
        "transactionId": transaction_id,
        "amount": amount,
        "accountAge": account_age,
        "locationIsForeign": location_is_foreign,
    }

    response = client.put_events(
        Entries=[
            {
                "Source": "com.my-app.transactions",
                "DetailType": "transaction.submitted",
                "Detail": json.dumps(transaction_detail),
                "EventBusName": "transaction-bus",
            },
        ]
    )

    return {
        "statusCode": 200,
        "body": json.dumps(
            f"Event for transaction {transaction_id} published to EventBridge!"
        ),
    }
