
import json
import boto3


SEND_TO_EMAIL = "zwii.doan@gmail.com"

def handler(event, context):
    print("Notifying risk assessment:")
    print(json.dumps(event, indent=2))

    ses_client = boto3.client("sesv2")

    try:
        ses_client.send_email(
            FromEmailAddress=SEND_TO_EMAIL,
            Destination={"ToAddresses": [SEND_TO_EMAIL]},
            Content={
                "Simple": {
                    "Subject": {"Data": f"Risk Assessment for Transaction {event['transactionId']}"},
                    "Body": {
                        "Text": {
                            "Data": f"Transaction {event['transactionId']} has been assessed as {event['riskLevel']}."
                        }
                    },
                }
            },
        )
    except Exception as e:
        print(f"Error sending email: {e}")
        # Depending on the use case, you might want to raise an exception
        # to fail the Step Functions execution
        raise e

    return event

