This repository provides the basic infrastructure to practice with [Consumer Driven Contract testing](https://martinfowler.com/articles/consumerDrivenContracts.html), especially with the [realestate-com-au/pact](https://github.com/realestate-com-au/pact)'s ecosystem. There are three different components available in this repository:

* a simple Ruby consumer
* a simple Ruby provider
* a Dockerized version of the Pact Broker service (_[v. 1.16](https://github.com/bethesque/pact_broker/releases/tag/v1.16.0)_)

Through these components it is possible to practice with Pact's concepts, starting with the examples described in the [realestate-com-au/pact](https://github.com/realestate-com-au/pact)'s repo.

# Setup
To setup the components simply run:
```
./bin/simon_says setup
```
from the project's root. The script will:
* install the dependencies for the consumer,
* install the dependencies for the provider, and
* create the Docker image with the Pact Broker

## Start the Pact Broker
After the setup, execute:
```
./bin/simon_says start_broker
```
The broker should be now available at [http://localhost:8080/](http://localhost:8080/).

## Create the Consumer's Pact
To create the consumer's pact, run:
```
./bin/simon_says verify_consumer
```
which produces an output similar to:
```
./bin/simon_says:35: warning: Insecure world writable dir /usr/local in PATH, mode 040777
.

Finished in 0.0275 seconds (files took 0.52251 seconds to load)
1 example, 0 failures


>> Publishing spec/pacts/library_app-books_service.json to pact broker at http://localhost:8080
The latest version of this pact can be accessed at the following URL (use this to configure the provider verification):
http://localhost:8080/pacts/provider/Books%20Service/consumer/Library%20App/latest
```
The pact is now available in the Pact Broker at [http://localhost:8080/pacts/provider/Books%20Service/consumer/Library%20App/latest](http://localhost:8080/pacts/provider/Books%20Service/consumer/Library%20App/latest).

## Verify the Pact
To verify the pact on the provider's side, run:
```
./bin/simon_says verify_provider
```
which will produce an output similar to:
```
Reading pact at http://localhost:8080/pacts/provider/Books%2520Service/consumer/Library%2520App/latest

Verifying a pact between Library App and Books Service
  Given a book exists
    a request for a book
      with GET /books/1
        returns a response which
          has status code 200
          has a matching body
          includes headers
            "Content-Type" with value "application/json"

1 interaction, 0 failures
```
## Stop the Pact Broker
To stop the running Docker instance, simply run:
```
./bin/simon_says stop_broker
```
