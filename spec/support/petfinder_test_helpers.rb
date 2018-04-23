module PetfinderTestHelpers
  
  def pf_client
    Petfinder::Client.new(ENV['PETFINDER_API_KEY'], ENV['PETFINDER_API_SECRET'])
  end
  
  def pf_default_limit
    25
  end
  
  def pf_default_shelter_id
    'CA886'
  end

  def pf_default_pet_id
    '29032658'
  end

  def pf_shelter_double
    double('Petfinder::Shelter',
      id: pf_default_shelter_id, 
      name: 'Test Shelter',
      address1: '111 Test Street',
      address2: 'Apt 1',
      city: 'San Diego',
      state: 'CA',
      zip: '92172',
      country: 'USA',
      latitude: '32.7153',
      longitude: '-117.1564',
      phone: '619-111-1111',
      fax: nil,
      email: 'shelter@test.com'
    )
  end

  def pf_pet_double
    double('Petfinder::Pet',
      id: pf_default_pet_id,
      name: 'Test Pet',
      animal: 'Dog',
      mix: 'yes',
      age: '10',
      shelter_id: pf_default_shelter_id,
      shelter_pet_id: nil,
      sex: 'F',
      size: 'M',
      description: 'great pooch...',
      last_update: Time.zone.now - 1.day,
      status: 'A',
      contact: "Test Person\n 111-111-1111\nemail@test.com",
      photos:  [ pf_photo_double ],
      breeds: [ 'Pit Bull Terrier', 'Labrador Retriever' ]
    )
  end

  def pf_photo_double(idx=1)
    double('Petfinder::Pet::Photo',
      id: idx,
      thumbnail: "http://photos.petfinder.com/photos/pets/29032658/3/?bust=1460414098&width=60&-pnt.jpg",
      small: "http://photos.petfinder.com/photos/pets/29032658/3/?bust=1460414098&width=95&-fpm.jpg",
      large: "http://photos.petfinder.com/photos/pets/29032658/3/?bust=1460414098&width=500&-x.jpg",
      tiny: "http://photos.petfinder.com/photos/pets/29032658/3/?bust=1460414098&width=50&-t.jpg",
      medium: "http://photos.petfinder.com/photos/pets/29032658/3/?bust=1460414098&width=300&-pn.jpg"
    )
  end

end
