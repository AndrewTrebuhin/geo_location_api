# Testing Task - Ruby API - Geolocation with external integration

Need to write a simple API backed by any kind of database. The application should be able to store geolocation data in the database, based on IP address or URL. You can use `https://ipstack.com/` as a service provider for geolocation data. The API should be able to add, delete or provide geolocation data on the base of ip address or URL.

## Application specification

- It should be a RESTful API
- Keep it mind that the geolocation module should be written in the way that in the future it should be easy to change the service provider.
- It is preferable that the API operates using JSON (for both input and output). Ideally it should follow JSON API standard.
- The solution should also include base specs/tests coverage. If you don’t have enough time, write complete specs for selected endpoint or module.
- As a bonus you can make all endpoints secure, not available to public.

### Notes

Pay special attention to handling errors and edge cases. We will test the behavior of the system under various “unfortunate” conditions.
We will run the application on our local machines for testing purposes. This implies that the solution should provide a quick and easy way to get the system up and running, including test data (hint: you can add Docker support so we can run it easily)

## How to use with Docker

```sh
docker-compose up
```

### Run tests

```sh
docker-compose exec -e RAILS_ENV=test rails bundle exec rspec
```

Don't forget to set your `IPSTACK_API_KEY` in the `.env` file.

## API documentation

Postman collection can be downloaded here.

All collection endpoints are paginated, use `page[size]` and `page[number]` params.

For `POST|PUT|PATCH` requests `Content-Type: application/vnd.api+json` header is required.

## Addresses

- `GET http://localhost:3000/v1/addresses`

  **Query params**

  ```json
  filter[address]
  ```

  **Response example**

  ```json
  {
      "data": [
          {
              "id": "1",
              "type": "addresses",
              "links": {
                  "self": "http://localhost:3000/v1/addresses/1"
              },
              "attributes": {
                  "address": "74.12.42.44",
                  "location": {
                      "latitude": 43.70317077636719,
                      "longitude": -79.51219177246094,
                      "country": "Canada",
                      "country_code": "CA",
                      "state": "Ontario",
                      "state_code": "ON",
                      "city": "Toronto",
                      "postal_code": "M3H 6A7"
                  }
              },
              "relationships": {
                  "location": {
                      "links": {
                          "related": "http://localhost:3000/v1/addresses/1/location"
                      }
                  }
              }
          }
      ],
      "links": {
          "first": "http://localhost:3000/v1/addresses?page%5Bnumber%5D=1&page%5Bsize%5D=10",
          "last": "http://localhost:3000/v1/addresses?page%5Bnumber%5D=1&page%5Bsize%5D=10"
      }
  }
  ```

<br>

- `GET http://localhost:3000/v1/addresses/:id`

  **Response expample:**

  ```json
  {
      "data": {
          "id": "1",
          "type": "addresses",
          "links": {
              "self": "http://localhost:3000/v1/addresses/1"
          },
          "attributes": {
              "location": {
                  "latitude": 43.70317077636719,
                  "longitude": -79.51219177246094,
                  "country": "Canada",
                  "country_code": "CA",
                  "state": "Ontario",
                  "state_code": "ON",
                  "city": "Toronto",
                  "postal_code": "M3H 6A7"
              },
              "address": "74.12.42.44"
          },
          "relationships": {
              "location": {
                  "links": {
                      "related": "http://localhost:3000/v1/addresses/1/location"
                  }
              }
          }
      }
  }
  ```

<br>

- `POST http://localhost:3000/v1/addresses`

  **Requested headers**

  `Content-Type: application/vnd.api+json`

  **Body**

  ```json
    {
      "data": {
          "type": "addresses",
          "attributes": {
              "address": "50.2.40.40",
              "location_id": 1
          }
      }
  }
  ```

  > if `location_id` is not provided the Geolocation module would try to fetch geodata
  > from the connected provider and create a location for the address

  **Error example**

  ```json
    {
      "errors": [
          {
              "title": "has already been taken",
              "detail": "address - has already been taken",
              "code": "VALIDATION_ERROR",
              "source": {
                  "pointer": "/data/attributes/address"
              },
              "status": "422"
          }
      ]
  }
  ```

<br>

- `DELETE http://localhost:3000/v1/addresses/1`

  **Response expample:**

  ```json
    204 No Content
  ```

## Locations

Common CRUD

### What isn't done but would be nice to have

- Add data provider to fetch geodata by URL
- Authentication
- Request tests and api docs
- Resources tests
- Configure rubocop
