class Places
  def self.create
    Neo4j::Transaction.run do
      Place.all.each {|x| x.del}

      clementi = Place.create :name => "Clementi"
      hv = Place.create :name => "Holland Village"
      newton = Place.create :name => "Newton Circus"
      bt = Place.create :name => "Bukit Timah"
      changi = Place.create :name => "Changi"
      nus = Place.create :name => "NUS"

      nus.add_neighbour bt, 3
      nus.add_neighbour hv, 1
      nus.add_neighbour clementi, 1
      nus.add_neighbour changi, 35
      bt.add_neighbour hv, 4
      bt.add_neighbour clementi, 4
      hv.add_neighbour newton, 7
      hv.add_neighbour changi, 25
      newton.add_neighbour changi, 18
      clementi.add_neighbour hv, 5
    end
  end
end