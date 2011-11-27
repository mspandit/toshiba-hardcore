class Item < ActiveRecord::Base
  attr_accessor :final_score
  
  OPTICAL_RANGE = [
    "DVD-SuperMulti drive (+/-R double layer)",
    "Blu-ray Disc&#153; ROM and DVD SuperMulti drive (+/-R double layer) with Labelflash&reg;",
    "Blu-ray Disc&#153; Rewriteable (RE) and DVD SuperMulti drive with Labelflash&reg;"
  ]
  
  PROC_NUMBER_RANGE = [
    "T3500",
    "N455",
    "N550",
    "B940",
    "B950",
    "i3-2310M",
    "i3-370M",
    "i3-380M",
    "i5-2410M",
    "i5-2520M",
    "i7-2620M", # 2.7GHz
    "i7-2630QM" # 2.9GHz
  ]
  
  GRAPHICS_MEMORY_RANGE = [
    "-250MB",
    "-1274MB",
    "-1299MB",
    "-1459MB",
    "-1696MB",
    "1GB",
    "1.5GB"
  ]
  
  MAP = {
    name: 1,
    description: 2,
    product_url: 3,
    image_url: 26,
    import_price: 9,
    import_sale_price: 10,
    import_proc_type: 13,
    import_proc_speed: 14,
    import_proc_number: 15,
    import_memory: 16,
    import_graphics: 20,
    import_hard: 17,
    import_optical: 19,
    import_screen: 28,
    import_hdd_speed: 29
    # ,image_url_alt: 26
  }
  
  def rank_speed
    index = PROC_NUMBER_RANGE.index(Item.maximum_in_string(import_proc_number))
    if index
      (index + 1).to_f / PROC_NUMBER_RANGE.count
    else
      0.5
    end
  end
  
  def rank_price(prices)
    (prices.index(import_price) + 1).to_f / prices.count
  end
  
  def rank_memory(memories)
    (memories.index(Item.maximum_in_string(import_memory)) + 1).to_f / memories.count
  end
  
  def rank_hard(hards)
    (hards.index(Item.maximum_in_string(import_hard)) + 1).to_f / hards.count
  end
  
  def rank_optical
    # TODO pick maximum, not last
    index = OPTICAL_RANGE.index(import_optical.split("|").last)
    if index
      # TODO pick maximum, not last
      (OPTICAL_RANGE.index(import_optical.split("|").last) + 1).to_f / OPTICAL_RANGE.count
    else
      0.5
    end
  end
  
  def rank_graphics
    index = 0
    GRAPHICS_MEMORY_RANGE.each do |fragment|
      index += 1
      return (index.to_f / GRAPHICS_MEMORY_RANGE.count) if import_graphics.index(fragment)
    end
    0.5
  end
  
  def rank_hdd_speed(speeds)
    return 0.5 if import_hdd_speed.nil?
    index = speeds.index(Item.maximum_in_string(import_hdd_speed))
    if index
      (index + 1).to_f / speeds.count
    else
      0.5
    end
  end
  
  def rank_screen(screens)
    if screens.index(import_screen).nil?
      0.0
    else
      (screens.index(import_screen) + 1).to_f / screens.count
    end
  end
  
  def self.rank_all(response)
    weights = { 
      :speed => response.watch.to_f         +
                response.edit_movies.to_f   + 
                response.edit_photos.to_f   + 
                response.stream.to_f        +
                response.rpg.to_f           +
                response.shooters.to_f       + 
                response.desk_work.to_f     +
                response.blogging.to_f      +
                response.architecture.to_f,
                                
      :memory =>response.online.to_f        +
                response.edit_movies.to_f   + 
                response.edit_photos.to_f   +
                response.digital.to_f       +
                response.record.to_f        + 
                response.rpg.to_f           +
                response.shooters.to_f       +
                response.desk_work.to_f     +
                response.blogging.to_f      +
                response.architecture.to_f,
                
      :graphics =>  response.watch.to_f     +
                response.edit_movies.to_f   +
                response.edit_photos.to_f   +
                response.rpg.to_f           +
                response.shooters.to_f       +
                response.blogging.to_f,
                                
      :hard =>  response.watch.to_f         +
                response.edit_movies.to_f   +
                response.download.to_f      +
                response.print.to_f         +
                response.edit_photos.to_f   +
                response.digital.to_f       +
                response.record.to_f        +
                response.rpg.to_f           +
                response.desk_work.to_f     +
                response.planes_trains.to_f +
                response.docs.to_f          +
                response.blogging.to_f      +
                response.architecture.to_f,

      :hdd_speed => response.watch.to_f         +
                response.edit_movies.to_f   +
                response.edit_photos.to_f   +
                response.digital.to_f       +
                response.rpg.to_f           +
                response.shooters.to_f       +
                response.blogging.to_f      +
                response.architecture.to_f,
                
      :optical=>response.watch.to_f         +
                response.edit_movies.to_f   +
                response.shooters.to_f       +
                response.planes_trains.to_f +
                response.docs.to_f          +
                response.blogging.to_f,
                
      :price => -(response.online.to_f        +
                response.download.to_f      +
                response.print.to_f         +
                response.stream.to_f        +
                response.scrabble.to_f      +
                response.planes_trains.to_f +
                response.coffee_shops.to_f  +
                response.docs.to_f),
      
      :screen => response.watch.to_f        +
                response.edit_movies.to_f   +
                response.edit_photos.to_f   +
                response.rpg.to_f           +
                response.shooters.to_f       +
                response.docs.to_f          -
                response.planes_trains.to_f -
                response.coffee_shops.to_f  +
                response.blogging.to_f
    }

    all.map do |item|
      item.final_score =  weights[:speed]   * item.speed    +
                          weights[:memory]  * item.memory   + 
                          weights[:graphics] * item.graphics +
                          weights[:hard]    * item.hard     + 
                          weights[:hdd_speed] * item.hdd_speed +
                          weights[:optical] * item.optical  + 
                          weights[:price]   * item.price +
                          weights[:screen] * item.screen
      item
    end.sort { |i1, i2| i2.final_score <=> i1.final_score }
  end
  
  def self.maximum_in_string(string)
    string.split("|").sort.last if string
  end
  
  def self.high_price_range
    order("import_price ASC").map(&:import_price).uniq
  end
  
  def self.large_memory_range
    all.map do |item|
      maximum_in_string(item.import_memory)
    end.uniq.sort
  end
  
  def self.large_hdd_range
    all.map do |item|
      maximum_in_string(item.import_hard)
    end.uniq.sort
  end
  
  def self.large_screen_range
    order("screen ASC").map(&:import_screen).uniq.sort
  end
  
  def self.small_screen_range
    order("screen DESC").map(&:import_screen).uniq.sort.reverse
  end
  
  def self.fast_hdd_range
    all.map do |item| 
      maximum_in_string(item.import_hdd_speed)
    end.compact.uniq.sort
  end
  
  # Each characteristic of the item has a range. For each characteristic, this method
  # ranks the item on that range
  def self.rank
    prices = high_price_range
    memories = large_memory_range
    hards = large_hdd_range
    hdd_speeds = fast_hdd_range
    screens = large_screen_range
    all.each do |item|
      item.update_attributes({
        :speed => item.rank_speed,
        :price => item.rank_price(prices),
        :memory => item.rank_memory(memories),
        :hard => item.rank_hard(hards),
        :optical => item.rank_optical,
        :graphics => item.rank_graphics,
        :hdd_speed => item.rank_hdd_speed(hdd_speeds),
        :screen => item.rank_screen(screens)
        # :large_screen => item.rank_screen(large_screen_range)
        # :small_screen => item.rank_screen(small_screen_range)
      })
    end
  end
  
  def self.process_line(line)
    columns = line.split("\t")
    if ("Toshiba" == columns[5] && "Notebook PCs" == columns[6] && "New" == columns[11] && columns[13].index("AMD").nil?)
      hash = {}
      MAP.each_pair do |key, value| 
        if 26 == value
          # grab the original image url if alt is blank
          hash[key] = columns[value].blank? ? columns[4] : "http://www.toshibadirect.com/#{columns[value].split(',').first}"
        else
          hash[key] = columns[value]
        end
      end
      # puts "hash:", hash.inspect
      Item.create(hash)
      return true
    else
      return false
    end
  end
  
  def self.import(server, user, password, file)
    require 'net/ftp'
    
    num_lines = 0
    Net::FTP.open(server) do |ftp|
      ftp.passive = true
      ftp.login(user, password)
      ftp.gettextfile(file) do |line|
        num_lines = num_lines + 1 if process_line(line)
      end
    end
    self.rank
    num_lines
  end
  
  def self.upload(file)
    num_lines = 0
    file.read.split("\n").each do |line|
      num_lines = num_lines + 1 if process_line(line)
    end
    self.rank
    num_lines
  end
end
