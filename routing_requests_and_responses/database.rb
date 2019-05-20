class Database
  USERS = {
    1 => { name: 'Jason',    bike: 'Cannondale' },
    2 => { name: 'Coraline', bike: 'Trek' }
  }

  RIDES = {
    1 => { user_id: 1, title: 'Morning Commute', date: '2016-09-28' },
    2 => { user_id: 1, title: 'Evening Commute', date: '2016-09-28' }
  }

  def self.users
    USERS
  end

  def self.rides
    RIDES
  end

  def self.add_ride(ride)
    id = RIDES.keys.max + 1
    RIDES[id] = ride
  end
end
