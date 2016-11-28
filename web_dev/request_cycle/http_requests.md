# HTTP Requests 
## Questions and Answers

1. **What are some common HTTP status codes?**

  200: OK (request succeeded)

  300: Multiple Choices (requested resource has different choices that cannot be resolved)
  
  301: Moved Permanently (request resource has a new URI that should be used) 
  
  302: Found (requested resource exists temporarily in a different URI)
  
  304: Not Modified (if the document has not been modified with conditional request by client)
  
  307: Temporary Redirect (requested resource is temporarily in a different URI)
  
  400: Bad Request (request could not be understood by the server)
 
  401: Unauthorized (request requires authorization)
  
  403: Forbidden (request is understood but the server refuses to fulfill it)
  
  404: Not Found (nothing found to match request; no indication of why)
  
  410: Gone (requested resource is no longer available)
  
  500: Internal Server Error (unexpected condition prevented request)
  
  501: Not Implemented (server does not support the functionality required)
  
  503: Service Unavailable (unable to handle from server crash, maintenance, overload, etc.)
  
  550: Permission Denied (account does not have permission to perform the action attempted)


2. **What is the difference between a GET request and a POST request? When might each be used?**

  GET: A GET method requests data from a source
  
  >>> Used only to retrieve data 

  >>> This method retrieves the HTML documents, CSS styling, photos, videos, etc.

  POST: A POST method submits data to a source to be processed 
  
  >>> A query string (name/value pair) is provided to the server 

  >>> A POST may be used to create a new resource

3. **What is a cookie (the technical kind, not the delicious kind)? How does it relate to HTTP requests?**

  A Cookie is a small text file that is stored on your computer when requesting and browsing web pages.  The cookie, and what it stores, is determined by the server-side.  As the client browses the website, the server can update the cookie's  name-value pairs in order to store information about that client to the browser.
  
  When an HTTP request is made, the cookie is passed as a header for the server to see relevant history of the client.  then the server will respond to set or update name-value pairs in the cookie field of the response header.