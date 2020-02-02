require('pry')
require_relative('../models/pet')
require_relative('../models/vet')


# Create Practising Vets
doctor1 = Vet.new({
  'name' => 'Dr David Jones',
  'url' => ''

  });

  doctor1.save()

doctor2 = Vet.new({
  'name' => 'Dr Karen Smith',
  'url' => ''

  });

  doctor2.save()

doctor3 = Vet.new({
  'name' => 'Dr Alan Wright',
  'url' => ''

  });

  doctor3.save()

doctor4 = Vet.new({
  'name' => 'Dr Susan Lee',
  'url' => ''

  });

  doctor4.save()


  #Create Visting Pets
charlie = Pet.new({
  'pet_name' => 'Charlie',
  'age' => 'Five',
  'animal_type' => 'Dog',
  'owner_first_name' => 'Mary',
  'owner_last_name' => 'Grant',
  'owner_contact_number' => '07798579843',
  'treatment_notes' => 'Broken left femur',
  'vet_id' => doctor1.id

  });

  charlie.save()

  tigger = Pet.new({
    'pet_name' => 'Tigger',
    'age' => 'Three',
    'animal_type' => 'Cat',
    'owner_first_name' => 'Bob',
    'owner_last_name' => 'Williams',
    'owner_contact_number' => '07703429102',
    'treatment_notes' => 'Giant Hairball',
    'vet_id' => doctor2.id

    });

    tigger.save()

    freddy = Pet.new({
      'pet_name' => 'Freddy',
      'age' => 'Twenty',
      'animal_type' => 'Fox',
      'owner_first_name' => 'Jim',
      'owner_last_name' => 'Stevens',
      'owner_contact_number' => '07896429861',
      'treatment_notes' => 'Not so bushy tail',
      'vet_id' => doctor3.id

      });

    freddy.save()

    noodles = Pet.new({
      'pet_name' => 'Noodles',
      'age' => 'Six',
      'animal_type' => 'Snake',
      'owner_first_name' => 'Lucy',
      'owner_last_name' => 'Miller',
      'owner_contact_number' => '07814556897',
      'treatment_notes' => 'Tounge stuck out',
      'vet_id' => doctor4.id

      });

      noodles.save()



      binding.pry
      nil
