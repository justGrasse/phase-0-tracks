# NESTED DATA STRUCTURE: MY BOARD GAMES

board_games = {
	settlers_of_catan: {
		min_players: 3,
		max_players: 4,
		est_time: 60, #minutes
		theme: [
			'discovery',
			'settlement',
			'resource management'
		],
		contents: {
			land_tiles: 19,	
			dice: 2,
			cards: 126,
			road_pieces: 60,
			settlement_pieces: 20,
			city_pieces: 16
		}
	},
	ascension: {
		min_players: 2,
		max_players: 4,
		est_time: 30, #minutes
		theme: [
			'fantasy',
			'deck building',
			'card game'
		],
		contents: {
			dice: 0,
			cards: 243,
			honor_tokens: 50,
			gameboard: 1
		}
	},
	cards_against_humanity: {
		min_players: 3,
		max_players: 15,
		est_time: 120, #minutes
		theme: [
			'adult',
			'card game'
		],
		contents: {
			dice: 0,
			cards: 950,
			big_black_box: 1
		}
	}
}

# WORKING WITH NESTED DATA STRUCTURES:

# Can 5 people play ascension?

ascension_min = board_games[:ascension][min_players]
ascension_max = board_games[:ascension][max_players]


# Which games are card games? via theme

# card_game_array


# Add Adventure Time Munchkin, the game

board_games[:adventure_time_munchkin] = {
	min_players: 3,
	max_players: 6,
	est_time: 90, #minutes
	theme: [
		'card game',
		'cartoon',
		'Mathematical!'
	],
	contents: {
		dice: 1,
		cards: 168,
		characters: 8
	} 
}

puts board_games[:adventure_time_munchkin]


# Add 50 cards to Cards against humanity

board_games[:cards_against_humanity][:contents][:cards] +=50

puts board_games[:cards_against_humanity]


