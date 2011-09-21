class Item < ActiveRecord::Base
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
  def self.import(file)
    num_lines = 0
    file.read.split("\n").each do |line|
      columns = line.split("\t")
      if ("Toshiba" == columns[5] && "Notebook PCs" == columns[6] && "New" == columns[11])
        hash = {}
        MAP.each_pair do |key, value|
          hash[key] = columns[value]
        end
        Item.create(hash)
        num_lines += 1
      end
    end
    num_lines
  end
end
