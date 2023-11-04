program checkers.aleo;

struct Game:
    player_1 as address;
    player_2 as address;
    status as u8;
    r1 as u8;
    r2 as u8;
    r3 as u8;
    r4 as u8;
    r5 as u8;
    r6 as u8;
    r7 as u8;
    r8 as u8;
    r9 as u8;
    r10 as u8;
    r11 as u8;
    r12 as u8;
    b1 as u8;
    b2 as u8;
    b3 as u8;
    b4 as u8;
    b5 as u8;
    b6 as u8;
    b7 as u8;
    b8 as u8;
    b9 as u8;
    b10 as u8;
    b11 as u8;
    b12 as u8;


mapping hash_to_game:
	key left as u128.public;
	value right as Game.public;

closure check_range:
    input r0 as u8;
    input r1 as u8;
    gte r0 1u8 into r2;
    lte r0 64u8 into r3;
    and r2 r3 into r4;
    assert.eq r4 true;
    gte r1 1u8 into r5;
    lte r1 64u8 into r6;
    and r5 r6 into r7;
    assert.eq r7 true;


closure check_empty:
    input r0 as u8;
    input r1 as Game;
    assert.neq r1.r1 r0;
    assert.neq r1.r2 r0;
    assert.neq r1.r3 r0;
    assert.neq r1.r4 r0;
    assert.neq r1.r5 r0;
    assert.neq r1.r6 r0;
    assert.neq r1.r7 r0;
    assert.neq r1.r8 r0;
    assert.neq r1.r9 r0;
    assert.neq r1.r10 r0;
    assert.neq r1.r11 r0;
    assert.neq r1.r12 r0;
    assert.neq r1.b1 r0;
    assert.neq r1.b2 r0;
    assert.neq r1.b3 r0;
    assert.neq r1.b4 r0;
    assert.neq r1.b5 r0;
    assert.neq r1.b6 r0;
    assert.neq r1.b7 r0;
    assert.neq r1.b8 r0;
    assert.neq r1.b9 r0;
    assert.neq r1.b10 r0;
    assert.neq r1.b11 r0;
    assert.neq r1.b12 r0;


closure valid_move:
    input r0 as address;
    input r1 as u8;
    input r2 as u8;
    input r3 as Game;
    is.eq r3.status 1u8 into r4;
    not r4 into r5;
    is.eq r0 r3.player_1 into r6;
    or r5 r6 into r7;
    assert.eq r7 true;
    add r1 9u8 into r8;
    is.eq r2 r8 into r9;
    add r1 7u8 into r10;
    is.eq r2 r10 into r11;
    rem r1 16u8 into r12;
    is.eq r12 0u8 into r13;
    ternary r13 false r9 into r14;
    sub r1 1u8 into r15;
    rem r15 16u8 into r16;
    is.eq r16 0u8 into r17;
    ternary r17 false r11 into r18;
    or r14 r18 into r19;
    is.eq r19 true into r20;
    is.eq r3.r1 r1 into r21;
    ternary r21 r2 r3.r1 into r22;
    ternary r21 2u8 r3.status into r23;
    is.eq r3.r2 r1 into r24;
    ternary r24 r2 r3.r2 into r25;
    ternary r24 2u8 r23 into r26;
    is.eq r3.r3 r1 into r27;
    ternary r27 r2 r3.r3 into r28;
    ternary r27 2u8 r26 into r29;
    is.eq r3.r4 r1 into r30;
    ternary r30 r2 r3.r4 into r31;
    ternary r30 2u8 r29 into r32;
    is.eq r3.r5 r1 into r33;
    ternary r33 r2 r3.r5 into r34;
    ternary r33 2u8 r32 into r35;
    is.eq r3.r6 r1 into r36;
    ternary r36 r2 r3.r6 into r37;
    ternary r36 2u8 r35 into r38;
    is.eq r3.r7 r1 into r39;
    ternary r39 r2 r3.r7 into r40;
    ternary r39 2u8 r38 into r41;
    is.eq r3.r8 r1 into r42;
    ternary r42 r2 r3.r8 into r43;
    ternary r42 2u8 r41 into r44;
    is.eq r3.r9 r1 into r45;
    ternary r45 r2 r3.r9 into r46;
    ternary r45 2u8 r44 into r47;
    is.eq r3.r10 r1 into r48;
    ternary r48 r2 r3.r10 into r49;
    ternary r48 2u8 r47 into r50;
    is.eq r3.r11 r1 into r51;
    ternary r51 r2 r3.r11 into r52;
    ternary r51 2u8 r50 into r53;
    is.eq r3.r12 r1 into r54;
    ternary r54 r2 r3.r12 into r55;
    ternary r54 2u8 r53 into r56;
    ternary r20 r22 r3.r1 into r57;
    ternary r20 r56 r3.status into r58;
    ternary r20 r25 r3.r2 into r59;
    ternary r20 r28 r3.r3 into r60;
    ternary r20 r31 r3.r4 into r61;
    ternary r20 r34 r3.r5 into r62;
    ternary r20 r37 r3.r6 into r63;
    ternary r20 r40 r3.r7 into r64;
    ternary r20 r43 r3.r8 into r65;
    ternary r20 r46 r3.r9 into r66;
    ternary r20 r49 r3.r10 into r67;
    ternary r20 r52 r3.r11 into r68;
    ternary r20 r55 r3.r12 into r69;
    ternary r4 r57 r3.r1 into r70;
    ternary r4 r58 r3.status into r71;
    ternary r4 r59 r3.r2 into r72;
    ternary r4 r60 r3.r3 into r73;
    ternary r4 r61 r3.r4 into r74;
    ternary r4 r62 r3.r5 into r75;
    ternary r4 r63 r3.r6 into r76;
    ternary r4 r64 r3.r7 into r77;
    ternary r4 r65 r3.r8 into r78;
    ternary r4 r66 r3.r9 into r79;
    ternary r4 r67 r3.r10 into r80;
    ternary r4 r68 r3.r11 into r81;
    ternary r4 r69 r3.r12 into r82;
    is.eq r71 2u8 into r83;
    not r83 into r84;
    is.eq r0 r3.player_2 into r85;
    or r84 r85 into r86;
    assert.eq r86 true;
    sub r1 7u8 into r87;
    is.eq r2 r87 into r88;
    sub r1 9u8 into r89;
    is.eq r2 r89 into r90;
    rem r1 16u8 into r91;
    is.eq r91 0u8 into r92;
    ternary r92 false r88 into r93;
    sub r1 1u8 into r94;
    rem r94 16u8 into r95;
    is.eq r95 0u8 into r96;
    ternary r96 false r90 into r97;
    or r93 r97 into r98;
    is.eq r98 true into r99;
    is.eq r3.b2 r1 into r100;
    ternary r100 r2 r3.b2 into r101;
    ternary r100 1u8 r71 into r102;
    is.eq r3.b1 r1 into r103;
    ternary r103 r2 r3.b1 into r104;
    ternary r103 1u8 r102 into r105;
    is.eq r3.b3 r1 into r106;
    ternary r106 r2 r3.b3 into r107;
    ternary r106 1u8 r105 into r108;
    is.eq r3.b4 r1 into r109;
    ternary r109 r2 r3.b4 into r110;
    ternary r109 1u8 r108 into r111;
    is.eq r3.b5 r1 into r112;
    ternary r112 r2 r3.b5 into r113;
    ternary r112 1u8 r111 into r114;
    is.eq r3.b6 r1 into r115;
    ternary r115 r2 r3.b6 into r116;
    ternary r115 1u8 r114 into r117;
    is.eq r3.b7 r1 into r118;
    ternary r118 r2 r3.b7 into r119;
    ternary r118 1u8 r117 into r120;
    is.eq r3.b8 r1 into r121;
    ternary r121 r2 r3.b8 into r122;
    ternary r121 1u8 r120 into r123;
    is.eq r3.b9 r1 into r124;
    ternary r124 r2 r3.b9 into r125;
    ternary r124 1u8 r123 into r126;
    is.eq r3.b10 r1 into r127;
    ternary r127 r2 r3.b10 into r128;
    ternary r127 1u8 r126 into r129;
    is.eq r3.b11 r1 into r130;
    ternary r130 r2 r3.b11 into r131;
    ternary r130 1u8 r129 into r132;
    is.eq r3.b12 r1 into r133;
    ternary r133 r2 r3.b12 into r134;
    ternary r133 1u8 r132 into r135;
    ternary r99 r101 r3.b2 into r136;
    ternary r99 r135 r71 into r137;
    ternary r99 r104 r3.b1 into r138;
    ternary r99 r107 r3.b3 into r139;
    ternary r99 r110 r3.b4 into r140;
    ternary r99 r113 r3.b5 into r141;
    ternary r99 r116 r3.b6 into r142;
    ternary r99 r119 r3.b7 into r143;
    ternary r99 r122 r3.b8 into r144;
    ternary r99 r125 r3.b9 into r145;
    ternary r99 r128 r3.b10 into r146;
    ternary r99 r131 r3.b11 into r147;
    ternary r99 r134 r3.b12 into r148;
    ternary r83 r136 r3.b2 into r149;
    ternary r83 r137 r71 into r150;
    ternary r83 r138 r3.b1 into r151;
    ternary r83 r139 r3.b3 into r152;
    ternary r83 r140 r3.b4 into r153;
    ternary r83 r141 r3.b5 into r154;
    ternary r83 r142 r3.b6 into r155;
    ternary r83 r143 r3.b7 into r156;
    ternary r83 r144 r3.b8 into r157;
    ternary r83 r145 r3.b9 into r158;
    ternary r83 r146 r3.b10 into r159;
    ternary r83 r147 r3.b11 into r160;
    ternary r83 r148 r3.b12 into r161;
    cast r3.player_1 r3.player_2 r150 r70 r72 r73 r74 r75 r76 r77 r78 r79 r80 r81 r82 r151 r149 r152 r153 r154 r155 r156 r157 r158 r159 r160 r161 into r162 as Game;
    output r162 as Game;


function move_piece:
    input r0 as u128.private;
    input r1 as u8.private;
    input r2 as u8.private;
    input r3 as Game.private;
    call check_range r1 r2;    call check_empty r2 r3;    call valid_move self.caller r1 r2 r3 into r4;
    output r4 as Game.private;

    finalize r0 r4 r3;

finalize move_piece:
    input r0 as u128.public;
    input r1 as Game.public;
    input r2 as Game.public;
    get hash_to_game[r0] into r3;
    assert.eq r3 r2;
    set r1 into hash_to_game[r0];


closure return_larger_address:
    input r0 as address;
    input r1 as address;
    hash.bhp256 r0 into r2 as u8;    hash.bhp256 r1 into r3 as u8;    gt r2 r3 into r4;
    ternary r4 r0 r1 into r5;
    output r5 as address;


closure get_game_hash:
    input r0 as address;
    input r1 as address;
    hash.bhp256 r0 into r2 as u128;    hash.bhp256 r1 into r3 as u128;    add.w r2 r3 into r4;
    output r4 as u128;


function initialize_game:
    input r0 as address.private;
    input r1 as address.private;
    call return_larger_address r0 r1 into r2;
    is.eq r2 r0 into r3;
    ternary r3 r1 r0 into r4;
    call get_game_hash r4 r2 into r5;
    cast r4 r2 1u8 1u8 3u8 5u8 7u8 10u8 12u8 14u8 16u8 17u8 19u8 21u8 23u8 64u8 62u8 60u8 58u8 49u8 51u8 53u8 55u8 48u8 46u8 44u8 42u8 into r6 as Game;
    output r5 as u128.private;

    finalize r5 r6;

finalize initialize_game:
    input r0 as u128.public;
    input r1 as Game.public;
    set r1 into hash_to_game[r0];


closure blank_game:
    input r0 as address;
    cast r0 r0 1u8 1u8 3u8 5u8 7u8 10u8 12u8 14u8 16u8 17u8 19u8 21u8 23u8 64u8 62u8 60u8 58u8 49u8 51u8 53u8 55u8 48u8 46u8 44u8 42u8 into r1 as Game;
    output r1 as Game;
