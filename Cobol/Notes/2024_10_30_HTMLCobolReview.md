30 October 2024
## COBOL HTML Review

- COBOL generates an HTTP response
- We use .cgi files (Common Gateway Interface)
- Stylesheets dictate where and how elements display across the page
- Course-standard CSS is in ``/home/bis4523/resources/code/cobol.css``
- Key concern is the write permission, not a big issue with cobol.css
- CGI are meant to receive input from web browsers, so we need to keep it secure with permission level 700

### HTTP RESPONSE REQUIRES
- HTTP Header   (such as ``"Content-type: text/html"``
- Blank Line
- HTTP Body

### HTML Table 
- ``<table></table>`` surrounding
- A row is denoted by ``<tr></tr>``
- A data is denoted by ``<td></td>`` 
