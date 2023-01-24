# REST-API-Automation--Robot-Framework

The Robot Framework is a generic test automation framework for acceptance testing and acceptance test-driven development (ATDD). It has a built-in support for creating and running tests for RESTful APIs using the robotframework-requests library, which is a Robot Framework library for making HTTP requests.

To use the robotframework-requests library, you first need to install it by running pip install robotframework-requests. Once it is installed, you can import the library in your test case file and use its keywords to make HTTP requests, such as Get Request, Post Request, Put Request and Delete Request.

You can also use the ${response} variable, which contains the response of the last request made, to assert the status code, headers, and body of the response.

This respository contains all the general REST API test cases including all API requests(GET,PUT,POST,DELETE), Validating Responses(JSON/XML), Validating Headers/Cookies, Authentication methods etc.
