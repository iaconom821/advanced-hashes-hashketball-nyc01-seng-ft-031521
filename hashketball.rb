# Write your code below game_hash
require 'pry' 

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here


def num_points_scored(player)
  game_hash.each do |location, information|
    information.each do |team, data|
      if data.kind_of?(Array) 
        data.each do |data_item|
          if data_item.kind_of?(Hash)
            if data_item[:player_name] == player
              return data_item[:points]
            end
          end
        end
      end
    end
  end
end

def shoe_size(player)
  game_hash.each do |location, information|
    information.each do |team, data|
      if data.kind_of?(Array) 
        data.each do |data_item|
          if data_item.kind_of?(Hash)
            if data_item[:player_name] == player
              return data_item[:shoe]
            end
          end
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, information|
    information.each do |team_info, data|
      if data.kind_of?(Array) 
        data.each do |data_item|
          if information[:team_name] == team
            return data 
          end 
        end
      end
    end
  end
end

def team_names
  team_names_array = game_hash.each_with_object([]) do |(location, information), team_names_array|
    team_names_array.append(information[:team_name])
  end
  team_names_array
end

def player_numbers(teamname)
  team_players = game_hash.each_with_object([]) do |(location, information), team_players|
    information.each do |team, data|
      if data.kind_of?(Array) 
        data.each do |data_item|
          if data_item.kind_of?(Hash)
            if information[:team_name] == teamname
              team_players.append(data_item[:number])
            end
          end
        end
      end
    end
  end
  team_players
end

def player_stats(player)
  player_stat = game_hash.each do |location, information|
    information.each do |team, data|
      if data.kind_of?(Array) 
        data.each do |data_item|
          if data_item.kind_of?(Hash)
            if data_item[:player_name] == player
              return data_item
            end
          end
        end
      end
    end
  end
end

def most_points_scored
  most_points = 0 
  player = 0
  game_hash.each do |location, information|
    information.each do |team, data|
      if data.kind_of?(Array) 
        data.each do |data_item|
          if data_item.kind_of?(Hash)
            if data_item[:points] > most_points
              most_points = data_item[:points]
              player = data_item[:player_name]
            end
          end
        end
      end
    end
  end
  player 
end

def winning_team
  team_1 = 0 
  team_2 = 0
  game_hash.each do |location, information|
    information.each do |team, data|
      if data.kind_of?(Array) 
        data.each do |data_item|
          if data_item.kind_of?(Hash)
             if information[:team_name] != 'Brooklyn Nets'
               team_1 += data_item[:points]
             else
               team_2 += data_item[:points]
            end
          end
        end
      end
    end
  end
  if team_1 > team_2
    return 'Charlotte Hornets'
  else
    return 'Brooklyn Nets'
  end
end

winning_team

def big_shoe_rebounds
  big_shoe = 0 
  rebounds = 0
  game_hash.each do |location, information|
    information.each do |team, data|
      if data.kind_of?(Array) 
        data.each do |data_item|
          if data_item.kind_of?(Hash)
            if data_item[:shoe] > big_shoe
              big_shoe = data_item[:shoe]
              rebounds = data_item[:rebounds]
            end
          end
        end
      end
    end
  end
  rebounds
end

