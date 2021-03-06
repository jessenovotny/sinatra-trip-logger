users = {
  "Agent Smith" => {bio: "Hiking and surfing is my dig!", hometown: "California"},
  "Mary Poppins" => {bio: "Give me a rope and some too-tight-to-possibly-be-comfortable climbing shoes and I'm happy", hometown: "Arizona"},
  "The Dude" => {bio: "You're Mr. Lebowski, I'm the dude. This aggression will not stand, man.", hometown: "California"},
  "John Adams" => {bio: "I can't get me enough of that white powdery stuff", hometown: "Arizona"},
  "Judge Judy" => {bio: "Finding Nemo really struck home for me. I'm really just a fish out of water here on land.", hometown: "California"},
  "Billy Bob" => {bio: "Rain or shine you'll find me on the rocks with my best buds.", hometown: "New York"},
  "Kesha" => {bio: "I may not be very talented but I can still have fun", hometown: "Washington"},
  "Craig Milton" => {bio: "I've completed 13 marathons and I'm just getting started.", hometown: "Nevada"}
}

users.each do |name, details_hash|
  u = User.create(username: name, password: "password")
  u.bio = details_hash[:bio]
  u.hometown = details_hash[:hometown]
  u.save
end

sports = [
  "Mountain Biking",
  "Hiking",
  "Backpacking",
  "Snowboarding",
  "Skiing",
  "Rock Climbing",
  "Road Biking",
  "Bike Touring",
  "Running",
  "Road Tripping",
  "Sky Diving",
  "Parasailing",
  "Surfing",
  "Jet Skiing",
  "Scuba Diving",
  "Wakeboarding"
]

sports.each do |name|
  Sport.create(name: name)
end

states = {
    'AL'=>'Alabama',
    'AK'=>'Alaska',
    'AZ'=>'Arizona',
    'AR'=>'Arkansas',
    'CA'=>'California',
    'CO'=>'Colorado',
    'CT'=>'Connecticut',
    'DE'=>'Delaware',
    'FL'=>'Florida',
    'GA'=>'Georgia',
    'HI'=>'Hawaii',
    'ID'=>'Idaho',
    'IL'=>'Illinois',
    'IN'=>'Indiana',
    'IA'=>'Iowa',
    'KS'=>'Kansas',
    'KY'=>'Kentucky',
    'LA'=>'Louisiana',
    'ME'=>'Maine',
    'MD'=>'Maryland',
    'MA'=>'Massachusetts',
    'MI'=>'Michigan',
    'MN'=>'Minnesota',
    'MS'=>'Mississippi',
    'MO'=>'Missouri',
    'MT'=>'Montana',
    'NE'=>'Nebraska',
    'NV'=>'Nevada',
    'NH'=>'New Hampshire',
    'NJ'=>'New Jersey',
    'NM'=>'New Mexico',
    'NY'=>'New York',
    'NC'=>'North Carolina',
    'ND'=>'North Dakota',
    'OH'=>'Ohio',
    'OK'=>'Oklahoma',
    'OR'=>'Oregon',
    'PA'=>'Pennsylvania',
    'RI'=>'Rhode Island',
    'SC'=>'South Carolina',
    'SD'=>'South Dakota',
    'TN'=>'Tennessee',
    'TX'=>'Texas',
    'UT'=>'Utah',
    'VT'=>'Vermont',
    'VA'=>'Virginia',
    'WA'=>'Washington',
    'WV'=>'West Virginia',
    'WI'=>'Wisconsin',
    'WY'=>'Wyoming',
}

states.each do |abbr, name|
  State.create(name: name)
end

trips = {
  "10 mile hike in the Sierras. Gorgous landscapes abound!" => {
    user: "Agent Smith", sport: "Hiking", state: "California"},
  "Sent 10 sport routes at Isolation Canyon" => {
    user: "Mary Poppins", sport: "Rock Climbing", state: "Arizona"},
  "Tried wakeboarding for the first time! It was freaking radical!" => {
    user: "The Dude", sport: "Wakeboarding", state: "California"},
  "Shredding gnar at Snowbowl. Who knew there would be so much snow in Arizona! I though it was all desert" => {
    user: "John Adams", sport: "Snowboarding", state: "Arizona"},
  "I don't know which was cooler, swimming next to a whale shark or exploring the reef!" => {
    user: "Judge Judy", sport: "Scuba Diving", state: "California"},
  "We met thee Alex Honnold at the Gunks. That guy is my idol." => {
    user: "Billy Bob", sport: "Rock Climbing", state: "New York"},
  "Caught some gnarly swells at Steamers Lane this morning" => {
    user: "Agent Smith", sport: "Surfing", state: "California"},
  "Tore up my knee on the slopes." => {
    user: "Kesha", sport: "Skiing", state: "Washington"},
  "I logged 8 miles after work! I'd say this beer is well earned." => {
    user: "Craig Milton", sport: "Running", state: "Nevada"},
  "My friend Josh showed me how to climb trad in Sedona" => {
    user: "Mary Poppins", sport: "Rock Climbing", state: "Arizona"},
  "Took a 30 foot whipper climbing in Yosemite yesterday." => {
    user: "The Dude", sport: "Rock Climbing", state: "California"},
  "Absolutely the best granite slabs I've ever touched!" => {
    user: "Agent Smith", sport: "Rock Climbing", state: "California"},
  "I can't believe how much good rock there is out here!" => {
    user: "Mary Poppins", sport: "Rock Climbing", state: "Arizona"},
  "Tried parasailing for the first time today. What a rush." => {
    user: "Mary Poppins", sport: "Parasailing", state: "California"},
  "Went running this morning and stepped in dog shit" => {
    user: "Agent Smith", sport: "Running", state: "Arizona"},
  "Grabbed a bunch of buddies and we're headed to Las Vegas!" => {
    user: "The Dude", sport: "Road Tripping", state: "Nevada"},
  "After a weekend in Las Vegas, we made a loop around New Mexico so explore some local crags." => {
    user: "The Dude", sport: "Rock Climbing", state: "New Mexico"},
  "I broke my bike. It's okay, I'll buy another one." => {
    user: "Kesha", sport: "Mountain Biking", state: "California"},
  "Damn it feels good to be a gangster" => {
    user: "Mary Poppins", sport: "Rock Climbing", state: "California"},
  "The single track out here is phenomenal. Caught so crazy air coming down the mountain." => {
    user: "Craig Milton", sport: "Mountain Biking", state: "New Mexico"}
}

trips.each do |about, details_hash|
  trip = Trip.create(about: about)
  trip.user_id = User.find_by(username: details_hash[:user]).id
  trip.sport_id = Sport.find_by(name: details_hash[:sport]).id
  trip.state_id = State.find_by(name: details_hash[:state]).id
  trip.save
end 
