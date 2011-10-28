class Item < ActiveRecord::Base
  attr_accessor :final_score
  
  OPTICAL_RANKING = [
    "DVD-SuperMulti drive (+/-R double layer)",
    "Blu-ray Disc&#153; ROM and DVD SuperMulti drive (+/-R double layer) with Labelflash&reg;",
    "Blu-ray Disc&#153; Rewriteable (RE) and DVD SuperMulti drive with Labelflash&reg;"
  ]
  
  PROC_NUMBER_RANKING = [
    "T3500",
    "N455",
    "N550",
    "i3-2310M",
    "i3-370M",
    "i3-380M",
    "B940",
    "i5-2410M",
    "i5-2520M",
    "i7-2620M", # 2.7GHz
    "i7-2630QM" # 2.9GHz
  ]
  
  GRAPHICS_MEMORY_RANKING = [
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
    import_price: 10,
    import_proc_type: 13,
    import_proc_speed: 14,
    import_proc_number: 15,
    import_memory: 16,
    import_graphics: 20,
    import_hard: 17,
    import_optical: 19,
    import_screen: 28
    # ,image_url_alt: 26
  }
  
  def rank_speed
    index = PROC_NUMBER_RANKING.index(import_proc_number.split("|").last)
    if index
      (PROC_NUMBER_RANKING.index(import_proc_number.split("|").last) + 1).to_f / PROC_NUMBER_RANKING.count
    else
      0.0
    end
  end
  
  def rank_price(prices)
    (prices.index(import_price) + 1).to_f / prices.count
  end
  
  def rank_memory(memories)
    (memories.index(import_memory.split("|").last) + 1).to_f / memories.count
  end
  
  def rank_hard(hards)
    (hards.index(import_hard.split("|").last) + 1).to_f / hards.count
  end
  
  def rank_optical
    index = OPTICAL_RANKING.index(import_optical.split("|").last)
    if index
      (OPTICAL_RANKING.index(import_optical.split("|").last) + 1).to_f / OPTICAL_RANKING.count
    else
      0.0
    end
  end
  
  def rank_graphics
    index = 0
    GRAPHICS_MEMORY_RANKING.each do |fragment|
      index += 1
      return (index.to_f / GRAPHICS_MEMORY_RANKING.count) if import_graphics.index(fragment)
    end
    0.0
  end
  
  def rank_hdd_speed
    0.0 # TODO Update when HDD speed is in the feed
  end
  
  def rank_screen(screens)
    if screens.index(import_screen).nil?
      0.0
    else
      (screens.index(import_screen) + 1).to_f / screens.count
    end
  end
  
  def self.rank_all(params)
    weights = { 
      :speed => params[:watch].to_f         +
                params[:watch2].to_f        +
                params[:edit_movies].to_f   + 
                params[:edit_movies2].to_f  + 
                params[:edit_photos].to_f   + 
                params[:edit_photos2].to_f  + 
                params[:stream].to_f        +
                params[:stream2].to_f       +
                params[:rpg].to_f           +
                params[:rpg2].to_f          + 
                params[:shooter].to_f       + 
                params[:shooter2].to_f      +
                params[:desk_work].to_f     +
                params[:desk_work2].to_f    +
                params[:blogging].to_f      +
                params[:blogging2].to_f     +
                params[:architecture].to_f  +
                params[:architecture2].to_f,
                
      :memory =>params[:online].to_f        +
                params[:online2].to_f       +
                params[:edit_movies].to_f   + 
                params[:edit_movies2].to_f  + 
                params[:edit_photos].to_f   +
                params[:edit_photos2].to_f  +
                params[:digital].to_f       +
                params[:digital2].to_f      +
                params[:record].to_f        + 
                params[:record2].to_f       + 
                params[:rpg].to_f           +
                params[:rpg2].to_f          + 
                params[:shooter].to_f       +
                params[:shooter2].to_f      +
                params[:desk_work].to_f     +
                params[:desk_work2].to_f    +
                params[:blogging].to_f      +
                params[:blogging2].to_f     +
                params[:architecture].to_f  +
                params[:architecture2].to_f,
                
      :graphics =>  params[:watch].to_f     +
                params[:watch2].to_f        +
                params[:edit_movies].to_f   +
                params[:edit_movies2].to_f  +
                params[:edit_photos].to_f   +
                params[:edit_photos2].to_f  +
                params[:rpg].to_f           +
                params[:rpg2].to_f          + 
                params[:shooter].to_f       +
                params[:shooter2].to_f      +
                params[:blogging].to_f      +
                params[:blogging2].to_f,
                                
      :hard =>  params[:watch].to_f         +
                params[:watch2].to_f        +
                params[:edit_movies].to_f   +
                params[:edit_movies2].to_f  +
                params[:download].to_f      +
                params[:download2].to_f     +
                params[:print].to_f         +
                params[:print2].to_f        +
                params[:edit_photos].to_f   +
                params[:edit_photos2].to_f  +
                params[:digital].to_f       +
                params[:digital2].to_f      +
                params[:record].to_f        +
                params[:record2].to_f       +
                params[:rpg].to_f           +
                params[:rpg2].to_f          +
                params[:desk_work].to_f     +
                params[:desk_work2].to_f    +
                params[:planes_trains].to_f +
                params[:planes_trains2].to_f +
                params[:docs].to_f          +
                params[:docs2].to_f         +
                params[:blogging].to_f      +
                params[:blogging2].to_f     +
                params[:architecture].to_f  +
                params[:architecture2].to_f,
                
      :hdd_speed => params[:watch].to_f         +
                params[:watch2].to_f        +
                params[:edit_movies].to_f   +
                params[:edit_movies2].to_f  +
                params[:edit_photos].to_f   +
                params[:edit_photos2].to_f  +
                params[:digital].to_f       +
                params[:digital2].to_f      +
                params[:rpg].to_f           +
                params[:rpg2].to_f          +
                params[:shooter].to_f       +
                params[:shooter2].to_f      +
                params[:blogging].to_f      +
                params[:blogging2].to_f     +
                params[:architecture].to_f  +
                params[:architecture2].to_f,
                
      :optical=>params[:watch].to_f         +
                params[:watch2].to_f        +
                params[:edit_movies].to_f   +
                params[:edit_movies2].to_f  +
                params[:shooter].to_f       +
                params[:shooter2].to_f      +
                params[:planes_trains].to_f +
                params[:planes_trains2].to_f +
                params[:docs].to_f          +
                params[:docs2].to_f         +
                params[:blogging].to_f      +
                params[:blogging2].to_f,
                
      :price => params[:online].to_f        +
                params[:online2].to_f       +
                params[:download].to_f      +
                params[:download2].to_f     +
                params[:print].to_f         +
                params[:print2].to_f        +
                params[:stream].to_f        +
                params[:stream2].to_f       +
                params[:scrabble].to_f      +
                params[:scrabble2].to_f     +
                params[:planes_trains].to_f +
                params[:planes_trains2].to_f +
                params[:coffee_shops].to_f  +
                params[:coffee_shops2].to_f +
                params[:docs].to_f          +
                params[:docs2].to_f,
      
      :screen => params[:watch].to_f        +
                params[:watch2].to_f        +
                params[:edit_movies].to_f   +
                params[:edit_movies2].to_f  +
                params[:edit_photos].to_f   +
                params[:edit_photos2].to_f  +
                params[:rpg].to_f           +
                params[:rpg2].to_f          +
                params[:shooter].to_f       +
                params[:shooter2].to_f      +
                params[:docs].to_f          +
                params[:docs2].to_f         - 
                params[:planes_trains].to_f -
                params[:planes_trains2].to_f -
                params[:coffee_shops].to_f  -
                params[:coffee_shops2].to_f +
                params[:blogging].to_f      +
                params[:blogging2].to_f
    }
    
    
    puts "weights:", weights.inspect
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
  
  def self.rank
    prices    = Item.order("import_price DESC").map(&:import_price).uniq
    memories  = Item.order("import_memory ASC").map { |i| i.import_memory.split("|").last }.uniq
    hards     = Item.order("import_hard ASC").map { |i| i.import_hard.split("|").last }.uniq
    screens   = Item.order("screen ASC").map(&:import_screen).uniq
    all.each do |item|
      item.update_attributes({
        :speed => item.rank_speed,
        :price => item.rank_price(prices),
        :memory => item.rank_memory(memories),
        :hard => item.rank_hard(hards),
        :optical => item.rank_optical,
        :graphics => item.rank_graphics,
        :hdd_speed => item.rank_hdd_speed,
        :screen => item.rank_screen(screens)
      })
    end
  end
  
  def self.import(file)
    num_lines = 0
    file.read.split("\n").each do |line|
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
        num_lines += 1
      end
    end
    self.rank
    num_lines
  end
end
