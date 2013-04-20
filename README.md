neo4j-shortest-path
===================

Shortest path implemented using neo4j-wrapper.rb

Example
=======

In irb:

```ruby
require 'sp'
nus = Place.find(:name => "NUS").first
changi = Place.find(:name => "Changi").first
nus.shortest_path_to(changi)
```

Licence
=======

<a rel="license" href="http://creativecommons.org/licenses/by/3.0/deed.en_US"><img alt="Creative Commons License" style="border-width:0" src="http://i.creativecommons.org/l/by/3.0/88x31.png" /></a><br /><span xmlns:dct="http://purl.org/dc/terms/" property="dct:title">neo4j-shortest-path</span> by <span xmlns:cc="http://creativecommons.org/ns#" property="cc:attributionName">Kevin Yeung</span> is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/deed.en_US">Creative Commons Attribution 3.0 Unported License</a>.<br />Based on a work at <a xmlns:dct="http://purl.org/dc/terms/" href="https://github.com/kcpyeung/neo4j-shortest-path" rel="dct:source">https://github.com/kcpyeung/neo4j-shortest-path</a>.