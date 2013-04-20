class Place
  include Neo4j::NodeMixin
  property :name, :index => :exact
  has_n(:neighbours).relationship(Distance)

  def self.all
    Neo4j.all_nodes.to_a.keep_if {|node| node.kind_of? Place}
  end

  def distance_to(neighbour)
    distances = self.neighbours_rels.select {|rel| rel.start_node == self && rel.end_node == neighbour}
    distances.nil? ? -1 : distances.first.kilometers
  end

  def add_neighbour(neighbour, km)
    Distance.create(:neighbours, self, neighbour, :kilometers => km)
  end

  def shortest_path_to(destination)
    Place.dijkstra_paths(self, destination).each do |path|
      puts "total distance = " + path.relationships.reduce(0.0) {|total_km, leg| total_km + leg[:kilometers]}.to_s + " km"

      path.relationships.each do |leg|
        puts "    " + leg.start_node[:name] + " -> (" + leg[:kilometers].to_s + ") -> " + leg.end_node[:name]
      end
    end
  end

  private

  def self.dijkstra_paths(from, to)
    Neo4j::Algo.dijkstra_paths(from, to)
    .cost_evaluator {|rel, *| rel[:kilometers].to_f}
    .outgoing(:neighbours)
    .rels
  end
end