# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "begin seeding"
processor = Role.create(name: "Processor")
rep = Role.create(name: "Rep")
jason = User.create(name: "Jason", email: "Jason@mailmarketingfla.com", password: "tampa123", role: processor)
dan = User.create(name: "Dan", email: "example@mailmarketingfla.com", password: "tampa123",  role: rep)
mm = Client.create(name: "Mail Marketing",  clientnumber: "000")
ipd = Client.create(name: "IPD", clientnumber: "880")
menorah_manor = Client.create(name: "Menorah Manor", clientnumber: "977", rep: dan)
bgs = Client.create(name: "BGS", clientnumber: "022")
gentry = Client.create(name: "Gentry", clientnumber: "781")
mm100 = Permit.create(permitHolder: mm.name, client: mm, permit_number:"100")
address = Address.create(address1: "134 street street", address2: "apt #211",city: "St.petersburg", state: "FL", zip: "12345" )
contact = Contact.create(name: "John Smith", client: mm, address: address)
error = ErrorRecordHandling.create(name: "Standard Errors", instruction: "remove standard error group")
dedupe = DedupingInstructions.create(name: "Name and Address", instruction: "First and last name, and full address")
permit = Permit.create(permitHolder: "Mail Marketing", client: mm, crid: "1234567", postOffice: "Tampa", permit_number: "100", contact: contact)
printing_project = ProjectType.create(name: "Print Job", mailing: false, printing: true)
mailing_project = ProjectType.create(name: "Mailing", mailing: true,  printing: false)
other_project = ProjectType.create(name: "Other", mailing: false, printing: false)
printing_project = ProjectType.create(name: "Variable Data Mailing", mailing: true, printing: true)
active_status = Status.create(description: "Active")
firstClass = MailClass.create(name: "First Class")
standardClass = MailClass.create(name: "Standard")
nonProfit = MailClass.create(name: "Non-Profit")
letter = PieceType.create(name: "Letter")
flat = PieceType.create(name: "Flat")
postcard = PieceType.create(name: "Postcard")
indeciaOnPiece = PostageType.create(name: "Indicia already on Piece")
wePrintindicia = PostageType.create(name: "Indicia printed by MMS")
stamp10cent = PostageType.create(name: "10 cent stamp")
stamp25cent = PostageType.create(name: "25 cent stamp")
automation = Sortation.create(name: "Automation")
nonAuto = Sortation.create(name: "Non-Automation")
crrt = Sortation.create(name: "Carrier Route")
eddm = Sortation.create(name: "EDDM")
Labels.create(name: "Ink Jet")
Labels.create(name: "PS Label")
Labels.create(name: "Laser Letter")
Status.create(description: "Delete")
Status.create(description: "Completed")
Status.create(description: "On Hold")
Status.create(description: "Mailed")
WorkOrder.create(client: menorah_manor, dueDate: 7.day.from_now, status: active_status, project_type: other_project, title: "Monthly Newsletter", quantity: 5000, processor: jason)
WorkOrder.create(client: ipd, dueDate: 9.day.from_now, status: active_status, project_type: other_project, title: "Black Book Mailing", quantity:10000)
WorkOrder.create(client: bgs, dueDate: 30.day.from_now, status: active_status, project_type: other_project, title: "Amora Coffee", quantity: 375)
puts "Seeding complete"
