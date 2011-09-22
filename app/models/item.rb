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
  
  MAP = {
    name: 1,
    description: 2,
    product_url: 3,
    image_url: 4,
    import_price: 10,
    import_proc_type: 13,
    import_proc_speed: 14,
    import_proc_number: 15,
    import_memory: 16,
    import_graphics: 20,
    import_hard: 17,
    import_optical: 19
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
  
  def self.rank_all(params)
    weights = { 
      :speed => params[:edit_movies].to_f + params[:edit_movies2].to_f + params[:stream].to_f + params[:stream2].to_f + params[:rpg].to_f + params[:rpg2].to_f + params[:shooter].to_f + params[:shooter2].to_f, 
      :memory => params[:online].to_f + params[:online2].to_f + params[:edit_photos].to_f + params[:edit_photos2].to_f + params[:digital].to_f + params[:digital2].to_f + params[:record].to_f + params[:record2].to_f + params[:shooter].to_f + params[:shooter2].to_f, 
      :hard => params[:watch].to_f + params[:watch2].to_f + params[:edit_movies].to_f + params[:edit_movies2].to_f + params[:download].to_f + params[:download2].to_f + params[:print].to_f + params[:print2].to_f + params[:edit_photos].to_f + params[:edit_photos2].to_f + params[:digital].to_f + params[:digital2].to_f + params[:record].to_f + params[:record2].to_f + params[:rpg].to_f + params[:rpg2].to_f, 
      :optical => params[:watch].to_f + params[:watch2].to_f, 
      :price => params[:online].to_f + params[:online2].to_f + params[:download].to_f + params[:download2].to_f + params[:print].to_f + params[:print2].to_f + params[:stream].to_f + params[:stream2].to_f + params[:scrabble].to_f + params[:scrabble2].to_f 
    }
    
    all.map do |item|
      item.final_score = weights[:speed] * item.speed + weights[:memory] * item.memory + weights[:hard] * item.hard + weights[:optical] * item.optical + weights[:price] * item.price
      item
    end.sort { |i1, i2| i2.final_score <=> i1.final_score }
  end
  
  def self.rank
    prices = Item.order("import_price DESC").map(&:import_price).uniq
    memories = Item.order("import_memory ASC").map { |i| i.import_memory.split("|").last }.uniq
    hards = Item.order("import_hard ASC").map { |i| i.import_hard.split("|").last }.uniq
    all.each do |item|
      item.update_attributes({
        :speed => item.rank_speed,
        :price => item.rank_price(prices),
        :memory => item.rank_memory(memories),
        :hard => item.rank_hard(hards),
        :optical => item.rank_optical
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
          hash[key] = columns[value]
        end
        Item.create(hash)
        num_lines += 1
      end
    end
    self.rank
    num_lines
  end
end
