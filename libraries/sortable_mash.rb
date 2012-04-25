module SortableMash
  def sorted_hash(hash=nil)
    hash ||= self
    if(hash.is_a?(Hash))
      new_hash = defined?(OrderedHash) ? OrderedHash.new : Hash.new
      hash.keys.sort.each do |key|
        new_hash[key] = case hash[key]
        when Mash
          sort_hash(hash[key].to_hash)
        when Hash
          sort_hash(hash[key])
        else
          hash[key]
        end
      end
      new_hash
    else
      hash
    end
  end
end

Mash.send(:include, SortableMash)
