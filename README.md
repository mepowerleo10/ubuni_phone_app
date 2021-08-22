# ubuni_phone_app

A Simple Phone Shopping application.

## Work Done

- The application displays a list of all phones retrieved from the [https://www.paa.ubuni.co.tz/phones] REST endpoint.
- Has an introductory screen to preview the sample features of the app
- REST calls to [https://www.paa.ubuni.co.tz/phones/{id}] are not made since they are redundant and might be expensive for the phone. They are replaced by a single object from [https://www.paa.ubuni.co.tz/phones/] endpoint as the list contains an object similar to that returned by a similar `id`

by @mepowerleo10
