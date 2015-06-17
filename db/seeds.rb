# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "begin seeding"
client = Client.create(name: "IPD", clientnumber: "880")
mm = Client.create(name: "Mail Marketing",  clientnumber: "000")
menorah_manor = Client.create(name: "Menorah Manor", clientnumber: "977")
bgs = Client.create(name: "BGS", clientnumber: "022")
address = Address.create(address1: "134 street street", address2: "apt #211",city: "St.petersburg", state: "FL", zip: "12345" )
contact = Contact.create(name: "John Smith", client: mm, address: address)
error = ErrorRecordHandling.create(name: "Standard Errors", instruction: "remove standard error group")
dedupe = DedupingInstructions.create(name: "Name and Address", instruction: "First and last name, and full address")
permit = Permit.create(permitHolder: "Mail Marketing", client: mm, crid: "1234567", postOffice: "Tampa", permit_number: "100", contact: contact)
mailing_project = ProjectType.create(name: "Mailing", mailing: true,  printing: false)
other_project = ProjectType.create(name: "Other", mailing: false, printing: false)
printing_project = ProjectType.create(name: "Variable Data Mailing", mailing: true, printing: true)
active_status = Status.create(description: "Active")
WorkOrder.create(client: client, dueDate: 5.day.from_now, status: active_status, project_type: other_project, projectDescription: "Black Book Mailing")
WorkOrder.create(client: menorah_manor, dueDate: 7.day.from_now, status: active_status, project_type: other_project, projectDescription: "Mpnthly Newsletter")
WorkOrder.create(client: bgs, dueDate: 30.day.from_now, status: active_status, project_type: other_project, projectDescription: "Amora Coffee")
puts "Seeding complete"
