#! /bin/ruby

def find_and_insert(looking_for, block_index, file)
  found_index = file.index{|e| e.start_with?("**#{looking_for}**")}
  return unless found_index
  found = file[found_index]
  file.delete_at(found_index)
  file.delete_at(found_index)
  file.insert(block_index, "#{looking_for.downcase.gsub(' ', '_')}: \"#{found.split('** ')[1].strip}\"")
end

def create_header(name, file)
  index = file.find_index("**#{name}**")
  if index
    file[index] = "### #{name}"
  end
end

def create_alignment_size(block_index, file)
  index =  file.index{|e| e.start_with?('**') && e.end_with?('**')}
  if index
    line = file[index].strip.gsub('*', '')
    file.delete_at(index)
    file.delete_at(index)
    line = line.split(', ')
    size = line[0].strip
    alignment = line[1].strip
    file.insert(block_index, "alignment: #{alignment}")
    file.insert(block_index, "size: #{size}")
  end
end

def create_ability_modifiers(block_index, file)
  index =  file.index{|e| e.start_with?('|  ')}
  if index
    file.delete_at(index)
    index = file.index{|e| e.start_with?('|:-')}
    file.delete_at(index)

    am_index =  file.index{|e| e.start_with?('| ')}
    am = file[am_index].split('|').reject(&:empty?).map(&:strip)
    file.delete_at(am_index)
    file.delete_at(am_index)
    file.insert(block_index, "str: #{am[0]}")
    file.insert(block_index, "dex: #{am[1]}")
    file.insert(block_index, "con: #{am[2]}")
    file.insert(block_index, "int: #{am[3]}")
    file.insert(block_index, "wis: #{am[4]}")
    file.insert(block_index, "cha: #{am[5]}")
  end
end

def transform(filename)
  file = File.readlines(filename).each {|l| l.chomp!}
  block_index = file.rindex("---")

  find_and_insert('Armor Class', block_index, file)
  find_and_insert('Hit Points', block_index, file)
  find_and_insert('Speed', block_index, file)
  find_and_insert('Saving Throws', block_index, file)
  find_and_insert('Damage Immunities', block_index, file)
  find_and_insert('Skills', block_index, file)
  find_and_insert('Senses', block_index, file)
  find_and_insert('Languages', block_index, file)
  find_and_insert('Challenge', block_index, file)
  find_and_insert('Damage Resistances', block_index, file)
  find_and_insert('Condition Immunities', block_index, file)
  find_and_insert('Damage Vulnerabilities', block_index, file)

  create_header('Actions', file)
  create_header('Legendary Actions', file)
  create_header('Reactions', file)

  create_alignment_size(block_index, file)
  create_ability_modifiers(block_index, file)
  
  File.write(filename, file.join("\n"))
end

transform(ARGV[0])
