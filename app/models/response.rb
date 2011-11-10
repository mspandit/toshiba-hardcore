class Response < ActiveRecord::Base
  def empty?
    [
      :online, 
      :watch, 
      :edit_movies, 
      :download, 
      :print, 
      :edit_photos, 
      :stream, 
      :digital, 
      :record, 
      :scrabble, 
      :rpg, 
      :shooters, 
      :desk_work, 
      :planes_trains, 
      :coffee_shops, 
      :docs, 
      :blogging, 
      :architecture
    ].inject(true) { |current, field| current && (send(field) == 0) }
  end
  
  def online2=(value)
    self.online += value.to_i
  end
  
  def online2 
    0 
  end
  
  def watch2=(value)
    self.watch += value.to_i
  end
  
  def watch2 
    0 
  end
  
  def edit_movies2=(value)
    self.edit_movies += value.to_i
  end
  
  def edit_movies2 
    0 
  end
  
  def download2=(value)
    self.download += value.to_i
  end
  
  def download2 
    0 
  end
  
  def print2=(value)
    self.print += value.to_i
  end
  
  def print2 
    0 
  end
  
  def edit_photos2=(value)
    self.edit_photos += value.to_i
  end
  
  def edit_photos2 
    0 
  end
  
  def stream2=(value)
    self.stream += value.to_i
  end
  
  def stream2 
    0 
  end
    
  def digital2=(value)
    self.digital += value.to_i
  end
  
  def digital2 
    0 
  end
    
  def record2=(value)
    self.record += value.to_i
  end
  
  def record2 
    0 
  end
    
  def scrabble2=(value)
    self.scrabble += value.to_i
  end
  
  def scrabble2 
    0 
  end
    
  def rpg2=(value)
    self.rpg += value.to_i
  end
  
  def rpg2 
    0 
  end
    
  def shooters2=(value)
    self.shooters += value.to_i
  end
  
  def shooters2 
    0 
  end
    
  def desk_work2=(value)
    self.desk_work += value.to_i
  end
  
  def desk_work2 
    0 
  end
    
  def planes_trains2=(value)
    self.planes_trains += value.to_i
  end
  
  def planes_trains2 
    0 
  end
    
  def coffee_shops2=(value)
    self.coffee_shops += value.to_i
  end
  
  def coffee_shops2 
    0 
  end
    
  def docs2=(value)
    self.docs += value.to_i
  end
  
  def docs2 
    0 
  end
    
  def blogging2=(value)
    self.blogging += value.to_i
  end
  
  def blogging2 
    0 
  end
    
  def architecture2=(value)
    self.architecture += value.to_i
  end
  
  def architecture2 
    0 
  end
end
