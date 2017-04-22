# Create container from Ruby 2.3
FROM ruby:2.3.1

# Install wget and unzip
RUN apt-get update \
    && apt-get install wget \
    && apt-get install unzip

# Download version 1.16 of the Pact Broker
RUN wget https://github.com/bethesque/pact_broker/archive/v1.16.0.zip \
    && unzip v1.16.0.zip \
    && mv pact_broker-1.16.0/ app/ \
    && rm v1.16.0.zip

# Set the work directory
WORKDIR /app

# Install dependencies
RUN bundle install

# Expose port 80
EXPOSE 80

# Run the app
CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "80"]
