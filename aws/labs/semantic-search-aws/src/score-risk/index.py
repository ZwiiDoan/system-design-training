
import json

def handler(event, context):
    amount = event["amount"]
    account_age = event["accountAge"]
    location_is_foreign = event["locationIsForeign"]

    score = 0
    if amount > 500:
        score += 50
    if account_age < 10:
        score += 30
    if location_is_foreign:
        score += 20

    risk_level = "Low Risk"
    if score >= 80:
        risk_level = "High Risk"
    elif score >= 50:
        risk_level = "Medium Risk"

    event["riskScore"] = score
    event["riskLevel"] = risk_level

    return event
