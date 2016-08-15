


# landmarks_list = {
#     "Madison Square Guarden" => {
#       :year_completed => 1901
#     },
#     "The big bull outside" => {
#       :year_completed => 1995
#     },
#     "Flatiron School" => {
#       :year_completed => 2014
#     },
#     "Museum Mile" => {
#       :year_completed => 1058
#     },
#     "Subway Station" => {
#       :year_completed => 2015
#     },
#     "Cast Iron" => {
#       :year_completed => 1951
#     },
#     "Shea Stadium" => {
#       :year_completed => 1964
#     },
#     "Flatiron Building" => {
#       :year_completed => 1902
#     },
#     "Brooklyn Bridge" => {
#       :year_completed => 1883
#     }
#   }

# landmarks_list.each do |name, landmark_hash|
#   p = Landmark.new
#   p.name = name
#   landmark_hash.each do |attribute, value|
#       p[attribute] = value
#   end
#   p.save
# end

# figure_list = {
#     "Billy The Kid" => {
#     },
#     "Mark Zuckerberg" => {
#     },
#     "Ada Lovelace" => {
#     },
#     "Linus Torvalds" => { 
#     }
#   }

# figure_list.each do |name, figure_hash|
#   p = Figure.new
#   p.name = name
#   p.save
# end


# title_list = {
#     "The Mayor" => {
#     },
#     "The Don" => {
#     },
#     "Mr. President" => {
#     }
#   }

# title_list.each do |name, figure_hash|
#   p = Title.new
#   p.name = name
#   p.save
# end

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
  "Road Trip",
  "Sky Diving",
  "Parasailing",
  "Surfing"
  "Jet Skiing"
]

sports.each do |name|
  Sport.create(name: name)
end
