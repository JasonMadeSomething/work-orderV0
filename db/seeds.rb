# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "beginning seeding"
client = Client.create(name: "IPD", clientnumber: "880")
address = Address.create(address1: "134 street street", address2: "apt #211",city: "St.petersburg", state: "FL", zip: "12345" )
contact = Contact.create(name: "John Smith", client: client, address: address)
error = ErrorRecordHandling.create(name: "Standard Errors", instruction: "remove standard error group")
dedupe = DedupingInstructions.create(name: "Name and Address", instruction: "First and last name, and full address")
permit = Permit.create(permitHolder: "Mail Marketing", client: client, crid: "1234567", postOffice: "Tampa", permit_number: "100", contact: contact)



puts "#{client.inspect}\n#{address.inspect}#{contact.inspect}\n#{error.inspect}#{dedupe.inspect}\n#{permit.inspect}"
