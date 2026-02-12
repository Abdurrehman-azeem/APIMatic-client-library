# APIMatic-client-library
public repo for the assignment

```markdown
# Pet Store Client

A Ruby client for interacting with a Pet Store API, allowing you to manage pets and orders.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pet_store_client'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install pet_store_client
```

## Usage

Initialize the client:

```ruby
require_relative 'lib/pet_store_client'

client = PetStoreClient::Client.new('', ::Logger.new(STDOUT))
```

### Pets

**Create a pet:**

```ruby
created_pet = client.pet.create({
  id: 1,
  name: 'hello_world',
  photoUrls: ['http://image.com/image1.jpg'],
  status: 'available'
})
# => {id: 1, name: "hello_world", photoUrls: ["http://image.com/image1.jpg"], tags: [], status: "available"}
```

**Update a pet:**

```ruby
updated_pet = client.pet.update({
  id: created_pet[:id],
  name: 'helloworld123',
  photoUrls: ['http://google.com/google.jpg']
})
# => {id: 1, name: "helloworld123", photoUrls: ["http://google.com/google.jpg"], tags: []}
```

**Remove a pet:**

```ruby
removed_pet = client.pet.remove(id: created_pet[:id])
# => true
```

**Find a pet:**

```ruby
get_pet = client.pet.find(id: 1)
# => nil (since it was deleted)

get_pet = client.pet.find(id: 31)
# => {id: 31, category: {id: 2, name: "perro"}, name: "Firulais", photoUrls: ["string"], tags: [{id: 1, name: "alegre"}], status: "available"}
```

### Orders

**Create an order:**

```ruby
new_pet_order = client.order.create({
  petId: 1,
  quantity: 12
})
# => {id: 8260070753011294469, petId: 1, quantity: 12, complete: false}
```

**Find an order:**

```ruby
find_pet_order = client.order.find(id: 3)
# => {id: 3, petId: 0, quantity: 0, shipDate: "2023-03-27T02:14:59.643+0000", status: "placed", complete: true}
```

**Remove an order:**

```ruby
removed_order = client.order.remove(id: new_pet_order[:id])
# => true

pet_order = client.order.find(id: new_pet_order[:id])
# => nil
```

## Logging

The client accepts a logger instance. In the example above, logs are output to `STDOUT`.

## For examples 

From the root directory run ```ruby lib/examples/main.rb```

## Issues

Unforunately, I couldn't complete the tests.
