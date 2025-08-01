
import json

def handler(event, context):
    amount = event["amount"]
    
    if amount > 500:
        event["riskLevel"] = "High Risk"
    
    return event
