# encoding: utf-8

User.create({"email"=>"dr@mymail.com", "first_name"=>"Dominic", "last_name"=>"Ramms", "password"=>"123456", :avatar => File.new(Rails.root + 'Pictures/profile 3.png')})
User.create({"email"=>"sn@mymail.com", "first_name"=>"Sascha", "last_name"=>"Nonte", "password"=>"123456", :avatar => File.new(Rails.root + 'Pictures/profile 1.png')})
User.create({"email"=>"mc@mymail.com", "first_name"=>"Marvin", "last_name"=>"Caspar", "password"=>"123456", :avatar => File.new(Rails.root + 'Pictures/profile 2.jpg')})
User.create({"email"=>"tp@mymail.com", "first_name"=>"Tobias", "last_name"=>"Prein", "password"=>"123456", :avatar => File.new(Rails.root + 'Pictures/profile 4.png')})
User.create({"email"=>"tk@mymail.com", "first_name"=>"Till", "last_name"=>"Krueger", "password"=>"123456"})
User.create({"email"=>"sm@mymail.com", "first_name"=>"Simon", "last_name"=>"Miketta", "password"=>"123456"})
User.create({"email"=>"md@mymail.com", "first_name"=>"Malte", "last_name"=>"Dauskart", "password"=>"123456"})
User.create({"email"=>"js@mymail.com", "first_name"=>"Jannik", "last_name"=>"Scheik", "password"=>"123456", :avatar => File.new(Rails.root + 'Pictures/profile 5.jpg')})
User.create({"email"=>"ak@mymail.com", "first_name"=>"Andre", "last_name"=>"Konetzka", "password"=>"123456"})
User.create({"email"=>"ja@mymail.com", "first_name"=>"Jonas", "last_name"=>"Assies", "password"=>"123456"})
User.create({"email"=>"ga@mymail.com", "first_name"=>"Gamze", "last_name"=>"Atar", "password"=>"123456"})
User.create({"email"=>"jb@mymail.com", "first_name"=>"Julian", "last_name"=>"Beisenkoetter", "password"=>"123456"})
User.create({"email"=>"sb@mymail.com", "first_name"=>"Simon", "last_name"=>"Bern", "password"=>"123456"})
User.create({"email"=>"bb@mymail.com", "first_name"=>"Bastian", "last_name"=>"Bleker", "password"=>"123456"})
User.create({"email"=>"cb@mymail.com", "first_name"=>"Christian", "last_name"=>"Bootsmann", "password"=>"123456", :avatar => File.new(Rails.root + 'Pictures/profile 6.png')})
User.create({"email"=>"sb@mymail.com", "first_name"=>"Sven", "last_name"=>"Buecker", "password"=>"123456"})
User.create({"email"=>"rc@mymail.com", "first_name"=>"Raphael", "last_name"=>"Chmiel", "password"=>"123456"})
User.create({"email"=>"fc@mymail.com", "first_name"=>"Felix", "last_name"=>"Claus", "password"=>"123456"})
User.create({"email"=>"sd@mymail.com", "first_name"=>"Stephan", "last_name"=>"Depenwisch", "password"=>"123456"})
User.create({"email"=>"sd@mymail.com", "first_name"=>"Stephan", "last_name"=>"Depenwisch", "password"=>"123456"})
User.create({"email"=>"cd@mymail.com", "first_name"=>"Christopher", "last_name"=>"Dicke", "password"=>"123456"})
User.create({"email"=>"be@mymail.com", "first_name"=>"Benedikt", "last_name"=>"Erdmann", "password"=>"123456"})
User.create({"email"=>"ji@mymail.com", "first_name"=>"Joyce", "last_name"=>"Iben", "password"=>"123456"})


Friend.create(:user_id => 1, :friend_id => 2)
Friend.create(:user_id => 2, :friend_id => 1)
Friend.create(:user_id => 1, :friend_id => 3)
Friend.create(:user_id => 3, :friend_id => 1)
Friend.create(:user_id => 1, :friend_id => 4)
Friend.create(:user_id => 4, :friend_id => 1)
Friend.create(:user_id => 1, :friend_id => 5)
Friend.create(:user_id => 5, :friend_id => 1)
Friend.create(:user_id => 1, :friend_id => 6)
Friend.create(:user_id => 6, :friend_id => 1)
Friend.create(:user_id => 1, :friend_id => 7)
Friend.create(:user_id => 7, :friend_id => 1)
Friend.create(:user_id => 1, :friend_id => 8)
Friend.create(:user_id => 8, :friend_id => 1)

Friend.create(:user_id => 2, :friend_id => 3)
Friend.create(:user_id => 3, :friend_id => 2)
Friend.create(:user_id => 2, :friend_id => 4)
Friend.create(:user_id => 4, :friend_id => 2)
Friend.create(:user_id => 2, :friend_id => 5)
Friend.create(:user_id => 5, :friend_id => 2)
Friend.create(:user_id => 2, :friend_id => 6)
Friend.create(:user_id => 6, :friend_id => 2)
Friend.create(:user_id => 2, :friend_id => 7)
Friend.create(:user_id => 7, :friend_id => 2)
Friend.create(:user_id => 2, :friend_id => 8)
Friend.create(:user_id => 8, :friend_id => 2)

Friend.create(:user_id => 3, :friend_id => 4)
Friend.create(:user_id => 4, :friend_id => 3)
Friend.create(:user_id => 3, :friend_id => 5)
Friend.create(:user_id => 5, :friend_id => 3)
Friend.create(:user_id => 3, :friend_id => 6)
Friend.create(:user_id => 6, :friend_id => 3)
Friend.create(:user_id => 3, :friend_id => 7)
Friend.create(:user_id => 7, :friend_id => 3)
Friend.create(:user_id => 3, :friend_id => 8)
Friend.create(:user_id => 8, :friend_id => 3)

Friend.create(:user_id => 15, :friend_id => 16)
Friend.create(:user_id => 16, :friend_id => 15)
Friend.create(:user_id => 15, :friend_id => 17)
Friend.create(:user_id => 17, :friend_id => 15)
Friend.create(:user_id => 15, :friend_id => 18)
Friend.create(:user_id => 18, :friend_id => 15)


FriendRequests.create(:user_id => 1, :friend_id => 15)
FriendRequests.create(:user_id => 2, :friend_id => 15)
FriendRequests.create(:user_id => 3, :friend_id => 15)
FriendRequests.create(:user_id => 9, :friend_id => 1)
FriendRequests.create(:user_id => 10, :friend_id => 1)
FriendRequests.create(:user_id => 11, :friend_id => 1)
FriendRequests.create(:user_id => 9, :friend_id => 2)
FriendRequests.create(:user_id => 10, :friend_id => 2)
FriendRequests.create(:user_id => 11, :friend_id => 2)
FriendRequests.create(:user_id => 9, :friend_id => 3)
FriendRequests.create(:user_id => 10, :friend_id => 3)
FriendRequests.create(:user_id => 11, :friend_id => 3)


Conversation.create(:topic => "Spass")
ConvUser.create(:user_id => 1, :conversation_id => 1)
ConvUser.create(:user_id => 2, :conversation_id => 1)
ConvUser.create(:user_id => 3, :conversation_id => 1)
Message.create(:conversation_id => 1, :user_id => 1, :content => "Hallo zusammen")
Message.create(:conversation_id => 1, :user_id => 2, :content => "Hallo, wie gehts?")
Message.create(:conversation_id => 1, :user_id => 3, :content => "Hallo, gut und euch?")

Conversation.create(:topic => "Project")
ConvUser.create(:user_id => 1, :conversation_id => 2)
ConvUser.create(:user_id => 2, :conversation_id => 2)
Message.create(:conversation_id => 2, :user_id => 1, :content => "Was müssen wir noch machen?")
Message.create(:conversation_id => 2, :user_id => 2, :content => "Alles, setzte mich gleich mal an das Design")
Message.create(:conversation_id => 2, :user_id => 1, :content => "Hört sich gut an")
Message.create(:conversation_id => 2, :user_id => 1, :content => "Hab noch einen Bug im Nachrichtenmodul gefunden")
Message.create(:conversation_id => 2, :user_id => 2, :content => "Dann beheb ihn mal ;-)")
Message.create(:conversation_id => 2, :user_id => 1, :content => "Bin schon dabei")
Message.create(:conversation_id => 2, :user_id => 2, :content => "Und wie siehts aus?")
Message.create(:conversation_id => 2, :user_id => 1, :content => "Läuft")
Message.create(:conversation_id => 2, :user_id => 2, :content => "Hab da noch etwas am Design in Freunde geändert")
Message.create(:conversation_id => 2, :user_id => 1, :content => "sieht echt gut aus")
Message.create(:conversation_id => 2, :user_id => 2, :content => "Was jetzt noch?")
Message.create(:conversation_id => 2, :user_id => 1, :content => "Seeds erstellen...")

Conversation.create(:topic => "Heute abend")
ConvUser.create(:user_id => 2, :conversation_id => 3)
ConvUser.create(:user_id => 3, :conversation_id => 3)
ConvUser.create(:user_id => 4, :conversation_id => 3)
Message.create(:conversation_id => 3, :user_id => 2, :content => "Was machen wir heute abend?")
Message.create(:conversation_id => 3, :user_id => 3, :content => "Fussball gucken?")
Message.create(:conversation_id => 3, :user_id => 4, :content => "Hoffen wir mal das Dortmund gewinnt")
Message.create(:conversation_id => 3, :user_id => 2, :content => "warum sollten die das nicht tun?")
Message.create(:conversation_id => 3, :user_id => 3, :content => "5:0 - mindestens :D")
Message.create(:conversation_id => 3, :user_id => 4, :content => ":-D")

Conversation.create(:topic => "Noch mehr Spaß")
ConvUser.create(:user_id => 1, :conversation_id => 4)
ConvUser.create(:user_id => 2, :conversation_id => 4)
ConvUser.create(:user_id => 3, :conversation_id => 4)
Message.create(:conversation_id => 4, :user_id => 1, :content => "Hallo zusammen")
Message.create(:conversation_id => 4, :user_id => 2, :content => "Hallo, wie gehts?")
Message.create(:conversation_id => 4, :user_id => 3, :content => "Hallo, gut und euch?")

Conversation.create(:topic => "Spass mit anderen Leuten")
ConvUser.create(:user_id => 1, :conversation_id => 5)
ConvUser.create(:user_id => 4, :conversation_id => 5)
ConvUser.create(:user_id => 5, :conversation_id => 5)
Message.create(:conversation_id => 5, :user_id => 1, :content => "Hallo zusammen")
Message.create(:conversation_id => 5, :user_id => 4, :content => "Hallo, wie gehts?")
Message.create(:conversation_id => 5, :user_id => 5, :content => "Hallo, gut und euch?")


p = Project.new(:title => "Urlaub", :content => "Urlaubsfotos", :user_id => 1)
p.save
i = Image.new(:title => "Strand 1", :content => "Ein Strand am Meer", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/strand1.jpg'))
i.save
ImageComment.create(:image_id => i.id, :user_id => 3, :comment => "Schoenes Foto")
ImageComment.create(:image_id => i.id, :user_id => 2, :comment => "Ist wirklich so!")
i = Image.new(:title => "Strand 2", :content => "Noch ein Strand am Meer", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/strand2.jpg'))
i.save
ImageComment.create(:image_id => i.id, :user_id => 3, :comment => "Schoenes Foto")
ImageComment.create(:image_id => i.id, :user_id => 2, :comment => "Ist wirklich so!")
Image.create(:title => "Strand 3", :content => "Wow! noch ein Strand am Meer", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/strand3.jpg'))
Image.create(:title => "Strand 4", :content => "Mehr Strand!!!!!", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/strand4.jpg'))

p = Project.new(:title => "New York", :content => "New York Fotos", :user_id => 1)
p.save
i = Image.new(:title => "New York 1", :content => "Foto New York 1", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/newyork1.jpg'))
i.save
ImageComment.create(:image_id => i.id, :user_id => 3, :comment => "UH New York")
ImageComment.create(:image_id => i.id, :user_id => 2, :comment => "Yeah")
i = Image.new(:title => "New York 2", :content => "Foto New York 2", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/newyork2.jpg'))
i.save
i = Image.new(:title => "New York 3", :content => "Foto New York 3", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/newyork3.jpg'))
i.save
p = Project.new(:title => "Haus", :content => "Fotos vom Haus", :user_id => 1)
p.save
p = Project.new(:title => "Berge", :content => "Fotos von Bergen", :user_id => 1)
p.save

p = Project.new(:title => "BvB", :content => "Fotos vom BvB", :user_id => 2)
p.save
i = Image.new(:title => "BvB 1", :content => "Foto BvB 1", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/bvb1.jpg'))
i.save
i = Image.new(:title => "BvB 2", :content => "Foto BvB 2", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/bvb2.jpg'))
i.save
i = Image.new(:title => "BvB 3", :content => "Foto BvB 3", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/bvb3.jpg'))
i.save

p = Project.new(:title => "Mac-Bilder", :content => "Fotos von Apple MacBooks", :user_id => 3)
p.save
i = Image.new(:title => "Mac 1", :content => "Foto Mac 1", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/mac1.png'))
i.save
i = Image.new(:title => "Mac 2", :content => "Foto Mac 2", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/mac2.jpg'))
i.save
i = Image.new(:title => "Mac 3", :content => "Foto Mac 3", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/mac3.jpg'))
i.save
p = Project.new(:title => "iPhone-Bilder", :content => "Fotos von Apple iPhones", :user_id => 3)
p.save
i = Image.new(:title => "iPhone 1", :content => "Foto iPhone 1", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/iphone1.jpg'))
i.save
i = Image.new(:title => "iPhone 2", :content => "Foto iPhone 2", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/iphone2.jpg'))
i.save
i = Image.new(:title => "iPhone 3", :content => "Foto iPhone 3", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/iphone3.jpg'))
i.save
p = Project.new(:title => "iPad-Bilder", :content => "Bilder von iPads", :user_id => 3)
p.save
i = Image.new(:title => "iPads 1", :content => "Foto iPads 1", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/ipad1.jpg'))
i.save
i = Image.new(:title => "iPads 2", :content => "Foto iPads 2", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/ipad2.jpeg'))
i.save
i = Image.new(:title => "iPads 3", :content => "Foto iPads 3", :project_id => p.id, :images => File.new(Rails.root + 'Pictures/ipad3.jpg'))
i.save

p = Project.new(:title => "London", :content => "London von Bergen", :user_id => 4)
p.save
p = Project.new(:title => "Lustig", :content => "Lustige Bilder", :user_id => 4)
p.save

p = Project.new(:title => "Paris", :content => "Paris von Bergen", :user_id => 5)
p.save

p = Project.new(:title => "Lala", :content => "Test", :user_id => 17)
p.save