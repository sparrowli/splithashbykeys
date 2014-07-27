class Splithash
  def split_hash_by_keys(hash, *keys)
    [{:a=>1}, {:b=>2, :c=>3}]

    arrayHashes = Array.new
    right = Hash.new
    tempHash = hash

    keys.each { |k|
      raise ArgumentError, 'Key is invalid in Hash' unless hash.has_key?(k)

      left, right = split_hash_by_key(tempHash, k)

      arrayHashes.push(left) unless left.empty?

      tempHash = right
    }

    arrayHashes.push(right)
  end

  def split_hash_by_key(h, key)
    left = Hash.new
    right = Hash.new

    i = 0
    keyIndex = -1

    h.each { |k, v|
      if k != key and keyIndex == -1
        left.store(k,v)
      else
        keyIndex = i
        right.store(k,v)
      end

      i += 1
    }
    return left, right
  end
end