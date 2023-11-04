// The 'checkers' program.
program checkers.aleo {
    // 8 x 8 board
    mapping hash_to_game: u128 => Game;
    // Data Structure
    struct Game {
        player_1: address, //smaller hash address
        player_2: address, //larger hash address
        status: u8, //1 means player_1 turn, 2 means player_2 turn, 3 means player_1 won, 4 means_player 2 won
        r1: u8,
        r2: u8,
        r3: u8,
        r4: u8,
        r5: u8,
        r6: u8,
        r7: u8,
        r8: u8,
        r9: u8,
        r10: u8,
        r11: u8,
        r12: u8,
        b1: u8,
        b2: u8,
        b3: u8,
        b4: u8,
        b5: u8,
        b6: u8,
        b7: u8,
        b8: u8,
        b9: u8,
        b10: u8,
        b11: u8,
        b12: u8
    }

    function check_range(start_pos: u8, end_pos:u8){
        assert(start_pos>=1u8 && start_pos<=64u8);
        assert(end_pos>=1u8 && end_pos<=64u8); //within the checkerboard
    }
    function check_empty(end_pos:u8, game: Game){
        assert_neq(game.r1,end_pos);
        assert_neq(game.r2,end_pos);
        assert_neq(game.r3,end_pos);
        assert_neq(game.r4,end_pos);
        assert_neq(game.r5,end_pos);
        assert_neq(game.r6,end_pos);
        assert_neq(game.r7,end_pos);
        assert_neq(game.r8,end_pos);
        assert_neq(game.r9,end_pos);
        assert_neq(game.r10,end_pos);
        assert_neq(game.r11,end_pos);
        assert_neq(game.r12,end_pos);
        assert_neq(game.b1,end_pos);
        assert_neq(game.b2,end_pos);
        assert_neq(game.b3,end_pos);
        assert_neq(game.b4,end_pos);
        assert_neq(game.b5,end_pos);
        assert_neq(game.b6,end_pos);
        assert_neq(game.b7,end_pos);
        assert_neq(game.b8,end_pos);
        assert_neq(game.b9,end_pos);
        assert_neq(game.b10,end_pos);
        assert_neq(game.b11,end_pos);
        assert_neq(game.b12,end_pos);
    }
    transition move_piece(game_hash:u128, start_pos: u8, end_pos:u8,starting_board:Game) -> Game{
        check_range(start_pos,end_pos); //check positions are in range
        check_empty(end_pos,starting_board);
        let game: Game = valid_move(self.caller,start_pos,end_pos,starting_board);
        return game then finalize(game_hash,game,starting_board); //return correct board and status
    }

    finalize move_piece(game_hash:u128, game: Game, starting_board:Game){
        let stored_game: Game = Mapping::get(hash_to_game,game_hash);
        assert_eq(stored_game,starting_board);
        Mapping::set(hash_to_game,game_hash,game);
    }
    function valid_move(caller: address,start_pos: u8, end_pos: u8, game: Game) -> Game {
        let vmr1: u8 = game.r1;
        let vmr2: u8 = game.r2;
        let vmr3: u8 = game.r3;
        let vmr4: u8 = game.r4;
        let vmr5: u8 = game.r5;
        let vmr6: u8 = game.r6;
        let vmr7: u8 = game.r7;
        let vmr8: u8 = game.r8;
        let vmr9: u8 = game.r9;
        let vmr10: u8 = game.r10;
        let vmr11: u8 = game.r11;
        let vmr12: u8 = game.r12;
        let vmb1: u8 = game.b1;
        let vmb2: u8 = game.b2;
        let vmb3: u8 = game.b3;
        let vmb4: u8 = game.b4;
        let vmb5: u8 = game.b5;
        let vmb6: u8 = game.b6;
        let vmb7: u8 = game.b7;
        let vmb8: u8 = game.b8;
        let vmb9: u8 = game.b9;
        let vmb10: u8 = game.b10;
        let vmb11: u8 = game.b11;
        let vmb12: u8 = game.b12;
        let next_status: u8 = game.status;
        if(next_status==1u8){
            assert_eq(caller,game.player_1);
            let right_move: bool = end_pos == start_pos+9u8;
            let left_move: bool = end_pos == start_pos+7u8;
            if((start_pos%16u8)==0u8){right_move=false;} //right column
            if(((start_pos-1u8)%16u8)==0u8){left_move=false;} //left column
            if(right_move.or(left_move)==true){ //allow to make a move
                //find which piece needs to move
                if(game.r1==start_pos){vmr1=end_pos; next_status = 2u8;}
                if(game.r2==start_pos){vmr2=end_pos; next_status = 2u8;}
                if(game.r3==start_pos){vmr3=end_pos; next_status = 2u8;}
                if(game.r4==start_pos){vmr4=end_pos; next_status = 2u8;}
                if(game.r5==start_pos){vmr5=end_pos; next_status = 2u8;}
                if(game.r6==start_pos){vmr6=end_pos; next_status = 2u8;}
                if(game.r7==start_pos){vmr7=end_pos; next_status = 2u8;}
                if(game.r8==start_pos){vmr8=end_pos; next_status = 2u8;}
                if(game.r9==start_pos){vmr9=end_pos; next_status = 2u8;}
                if(game.r10==start_pos){vmr10=end_pos; next_status = 2u8;}
                if(game.r11==start_pos){vmr11=end_pos; next_status = 2u8;}
                if(game.r12==start_pos){vmr12=end_pos; next_status = 2u8;}
            }
        }
        if(next_status==2u8){
            assert_eq(caller,game.player_2);
            let right_move: bool = end_pos == start_pos-7u8;
            let left_move: bool = end_pos == start_pos-9u8;
            if((start_pos%16u8)==0u8){right_move=false;} //right column
            if(((start_pos-1u8)%16u8)==0u8){left_move=false;} //left column
            if(right_move.or(left_move)==true){ //allow to make a move
                //find which piece needs to move
                if(game.b2==start_pos){vmb2=end_pos; next_status = 1u8;}
                if(game.b1==start_pos){vmb1=end_pos; next_status = 1u8;}
                if(game.b3==start_pos){vmb3=end_pos; next_status = 1u8;}
                if(game.b4==start_pos){vmb4=end_pos; next_status = 1u8;}
                if(game.b5==start_pos){vmb5=end_pos; next_status = 1u8;}
                if(game.b6==start_pos){vmb6=end_pos; next_status = 1u8;}
                if(game.b7==start_pos){vmb7=end_pos; next_status = 1u8;}
                if(game.b8==start_pos){vmb8=end_pos; next_status = 1u8;}
                if(game.b9==start_pos){vmb9=end_pos; next_status = 1u8;}
                if(game.b10==start_pos){vmb10=end_pos; next_status = 1u8;}
                if(game.b11==start_pos){vmb11=end_pos; next_status = 1u8;}
                if(game.b12==start_pos){vmb12=end_pos; next_status = 1u8;}
            }
        }
        let return_game: Game = Game{
            player_1: game.player_1,
            player_2: game.player_2,
            status: next_status, //player 1 start first
            r1: vmr1,
            r2: vmr2,
            r3: vmr3,
            r4: vmr4,
            r5: vmr5,
            r6: vmr6,
            r7: vmr7,
            r8: vmr8,
            r9: vmr9,
            r10: vmr10,
            r11: vmr11,
            r12: vmr12,
            b1: vmb1,
            b2: vmb2,
            b3: vmb3,
            b4: vmb4,
            b5: vmb5,
            b6: vmb6,
            b7: vmb7,
            b8: vmb8,
            b9: vmb9,
            b10: vmb10,
            b11: vmb11,
            b12: vmb12
        };
        return return_game;
    }
    

    transition initialize_game(first: address, second: address) -> u128{
        //assert_neq(first,second);
        let larger: address = return_larger_address(first,second);
        let smaller: address = larger==first? second: first;
        let game_hash: u128 = get_game_hash(smaller,larger);
        let game: Game = Game{
            player_1: smaller,
            player_2: larger,
            status: 1u8, //player 1 start first
            r1: 1u8,
            r2: 3u8,
            r3: 5u8,
            r4: 7u8,
            r5: 10u8,
            r6: 12u8,
            r7: 14u8,
            r8: 16u8,
            r9: 17u8,
            r10: 19u8,
            r11: 21u8,
            r12: 23u8,
            b1: 64u8,
            b2: 62u8,
            b3: 60u8,
            b4: 58u8,
            b5: 49u8,
            b6: 51u8,
            b7: 53u8,
            b8: 55u8,
            b9: 48u8,
            b10: 46u8,
            b11: 44u8,
            b12: 42u8
        };
        return game_hash then finalize(game_hash,game);
    }
    finalize initialize_game(game_hash: u128, game: Game){
        Mapping::set(hash_to_game,game_hash,game);
    }
    function get_game_hash(smaller: address, larger: address) -> u128 {
        let smaller_hash: u128 = BHP256::hash_to_u128(smaller);
        let larger_hash: u128 = BHP256::hash_to_u128(larger);
        return smaller_hash.add_wrapped(larger_hash);
    }

    function return_larger_address(a: address, b: address) -> address {
        let a_hash: u8 = BHP256::hash_to_u8(a);
        let b_hash: u8 = BHP256::hash_to_u8(b);
        return a_hash > b_hash ? a:b;
    }
    function blank_game(caller: address) -> Game{
        let game: Game = Game{
            player_1: caller,
            player_2: caller,
            status: 1u8, //player 1 start first
            r1: 1u8,
            r2: 3u8,
            r3: 5u8,
            r4: 7u8,
            r5: 10u8,
            r6: 12u8,
            r7: 14u8,
            r8: 16u8,
            r9: 17u8,
            r10: 19u8,
            r11: 21u8,
            r12: 23u8,
            b1: 64u8,
            b2: 62u8,
            b3: 60u8,
            b4: 58u8,
            b5: 49u8,
            b6: 51u8,
            b7: 53u8,
            b8: 55u8,
            b9: 48u8,
            b10: 46u8,
            b11: 44u8,
            b12: 42u8
        };
        return game;
    }


}
