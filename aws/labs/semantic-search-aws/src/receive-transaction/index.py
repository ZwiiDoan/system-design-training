
import json

def handler(event, context):
    print("Received event:")
    print(json.dumps(event, indent=2))

    # Extract the detail from the EventBridge event
    transaction_detail = event["detail"]

    # Transform the event
    transformed_event = {
        "transactionId": transaction_detail["transactionId"],
        "amount": transaction_detail["amount"],
        "accountAge": transaction_detail["accountAge"],
        "locationIsForeign": transaction_detail["locationIsForeign"],
        "status": "processed"
    }

    print("Transformed event:")
    print(json.dumps(transformed_event, indent=2))

    return transformed_event
