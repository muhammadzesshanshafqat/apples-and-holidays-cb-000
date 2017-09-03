require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |key, value|
    value.each do |key2, value2|
      value2 << supply
      end
    end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply

end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array

end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supply_array = []
  holiday_hash.each do |key, value|
    if key == :winter
      value.each do |key2, value2|
        value2.each do |array_value|
          winter_supply_array << array_value
        end
      end
    end
  end
  winter_supply_array
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |key1, value1|
    string1 = key1.to_s.capitalize
    puts "#{string1}:"
    value1.each do |key2, value2|
      if [:new_year, :fourth_of_july, :memorial_day].include? key2
        string2 = key2.to_s.split('_').map(&:capitalize).join(' ')
        #puts "#{string2}:"
      else
        string2 = key2.to_s.capitalize
        #puts"#{string2}:"
      end
      string3 = value2.map(&:capitalize).join(', ')
      puts "  #{string2}: #{string3}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  array_of_keys = []
  holiday_hash.each do |key1, value1|
    value1.each do |key2, value2|
      if value2.include?("BBQ")
        array_of_keys << key2
      end
    end
  end
  array_of_keys
end
