require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pet.rb')
require_relative('../vet.rb')
class TestPet < MiniTest::Test


  def setup

    @doctor1 = Vet.new({
      'name' => 'Dr David Jones',
      'url' => ''
      })


    @charlie = Pet.new({
      'pet_name' => 'Charlie',
      'age' => 'Five',
      'animal_type' => 'Dog',
      'owner_first_name' => 'Mary',
      'owner_last_name' => 'Grant',
      'owner_contact_number' => '07798579843',
      'treatment_notes' => 'Broken left femur',
      'vet_id' => 1
      })

    end

    #DOCTOR1 TEST RUN
    def test_name()
      result = @doctor1.name
      assert_equal('Dr David Jones', result)
    end

    #PET TEST NAME
    def test_pet_name()
      result = @charlie.pet_name
      assert_equal('Charlie', result)
    end

    #PET TEST AGE
    def test_age()
      result = @charlie.age
      assert_equal('Five', result)
    end

    #PET TEST ANIMAL TYPE
    def test_animal_type()
      result = @charlie.animal_type
      assert_equal('Dog', result)
    end

    #PET TEST OWNER FIRST NAME
    def test_owner_first_name()
      result = @charlie.owner_first_name
      assert_equal('Mary', result)
    end

    #PET TEST OWNER LAST NAME
    def test_owner_last_name()
      result = @charlie.owner_last_name
      assert_equal('Grant', result)
    end

    #PET TEST OWNER CONTACT NUMBER
    def test_owner_contact_number()
      result = @charlie.owner_contact_number
      assert_equal('07798579843', result)
    end

    #PET TEST TREATMENT NOTES
    def test_treatment_notes()
      result = @charlie.treatment_notes
      assert_equal('Broken left femur', result)
    end

    #PET TEST VET ID ASSIGNED
    def test_vet_id()
      result = @charlie.vet_id
      assert_equal(1, result)
    end



  end
