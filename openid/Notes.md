# Difference Between Access Tokens and ID Tokens

## ID Tokens

**Purpose**: ID Tokens are used to authenticate the user. They confirm the identity of the user who has just logged in.

**Issuer**: Issued by the Authorization Server (such as an Identity Provider) after the user successfully logs in.

**Claims**: Contains information (claims) about the user, such as:

- `iss` (issuer): The issuer of the token, e.g., "https://example.com".
- `sub` (subject): The unique identifier for the user, e.g., "user123".
- `aud` (audience): The audience for the token, typically the client ID of the application, e.g., "app456".
- `exp` (expiration time): The token's expiry time.
- `iat` (issued at): The time the token was issued.
- **User details**: Such as `name`, `email`, etc.

**Example**:

```json
{
  "iss": "https://example.com",
  "sub": "user123",
  "aud": "app456",
  "exp": 1618203940,
  "iat": 1618200340,
  "name": "Jane Doe",
  "email": "jane.doe@example.com"
}
```

**Usage:** The ID Token is used by the client application to verify the identity of the user and obtain basic profile
information. It is not used to access protected resources.

## Access Tokens

**Purpose**: Access Tokens are used to authorize access to protected resources (APIs) on behalf of the user.

**Issuer**: Issued by the Authorization Server after the user has authenticated and authorized the client application.

**Claims**: Contains information needed to access the resource, such as:

* **iss (issuer)**: The issuer of the token, e.g., "https://example.com".
* **sub (subject)**: The unique identifier for the user, e.g., "user123".
* **aud (audience)**: The audience for the token, typically the API or resource server, e.g., "api789".
* **exp (expiration time)**: The token's expiry time.
* **iat (issued at)**: The time the token was issued.
* **Scopes/Permissions**: Such as scope, indicating what the token is allowed to do, e.g., "read", "write".

**Example**:

```json
{
  "iss": "https://example.com",
  "sub": "user123",
  "aud": "api789",
  "exp": 1618203940,
  "iat": 1618200340,
  "scope": "read write"
}
```

**Usage**: The Access Token is used by the client application to access protected resources. It is included in API
requests to prove that the user has the necessary permissions.

## Comparison

| **Aspect**   | **ID Token**                                      | **Access Token**                                    |
|--------------|---------------------------------------------------|-----------------------------------------------------|
| **Purpose**  | Authentication                                    | Authorization                                       |
| **Audience** | Client Application                                | Resource Server (API)                               |
| **Claims**   | User identity information (e.g., `name`, `email`) | Permissions and scopes (e.g., `scope`)              |
| **Format**   | Typically JWT                                     | Can be JWT or opaque                                |
| **Usage**    | Proving user's identity to the client application | Accessing protected resources on behalf of the user |
| **Lifetime** | Usually short-lived                               | Depends on the implementation, can vary             |

## Example Scenario

1. **User Authentication**: A user logs in to an application using OpenID Connect. The Authorization Server issues an ID
   Token to the client application, which the application uses to confirm the user's identity.

2. **Accessing Resources**: The same Authorization Server issues an Access Token to the client application. The
   application uses this Access Token to make API requests to a resource server (like a backend service or API) on
   behalf of the user.

# Opaque Tokens

An **opaque token** is a type of access token that does not reveal any information about itself in its encoded form.
Unlike **JSON Web Tokens (JWTs)**, which contain claims (encoded data) that can be decoded and read by the client,
opaque tokens are simply random strings of characters that have no inherent meaning or structure.

## Key Characteristics of Opaque Tokens

1. **Structure**: Opaque tokens are typically just a series of characters without any embedded information. They might
   look something like this: `98a742d8-154b-43b6-b564-123456abcdef`.

2. **Decoding**: Opaque tokens cannot be decoded to reveal any information about the token itself. Instead, the token's
   validity and associated data must be verified by making a request to the Authorization Server.

3. **Verification**: To verify an opaque token, the client or Resource Server sends the token to the Authorization
   Server's introspection endpoint. The Authorization Server responds with the token's status and any associated
   metadata (such as the token's expiration time, scope, and the user identity it represents).

4. **Security**: Since opaque tokens do not expose any information about their structure, they can be considered more
   secure in some contexts, as they do not reveal sensitive information if intercepted.

## Example Usage

- **Introspection Endpoint**: The Resource Server can call the introspection endpoint to validate the token:
    ```http
    POST /introspect HTTP/1.1
    Host: authorization-server.com
    Authorization: Bearer {client-token}
    Content-Type: application/x-www-form-urlencoded

    token=98a742d8-154b-43b6-b564-123456abcdef
    ```

- **Response from Introspection Endpoint**:
    ```json
    {
      "active": true,
      "scope": "read write",
      "client_id": "client-app",
      "username": "user123",
      "exp": 1618203940,
      "sub": "user123"
    }
    ```

In this scenario, the Resource Server uses the introspection endpoint to check if the token is active and retrieve
details about the user and permissions.

## Comparison with JWTs

| **Aspect**               | **Opaque Token**                                              | **JWT**                                                |
|--------------------------|---------------------------------------------------------------|--------------------------------------------------------|
| **Readable**             | No, requires introspection endpoint                           | Yes, can be decoded and read by the client             |
| **Embedded Information** | No, data is not embedded                                      | Yes, contains claims with information                  |
| **Verification**         | Requires introspection endpoint                               | Can be verified locally using a public key             |
| **Usage**                | Common in situations where external verification is preferred | Common in scenarios requiring local token verification |

Opaque tokens are useful when you want to keep the token structure hidden and rely on the Authorization Server for
validation. This can provide an additional layer of security and control over token handling.
