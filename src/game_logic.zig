const std = @import("std");

const SpellType = enum {
    EntitySpell,
    ObjectSpell
}; 
const Entity = struct {
    id:i32,
    name:u8[50] = "",
    stats:Stats = Stats{}
    
};
const Spell = struct {
    onCast:fn(target:anytype) void
};
const Stats = struct {
    hp:i64 = 0,
    mp:i6 = 0,
    def:i64 = 0,
    mag_def:i64 = 0,
    hp_regen:i64 = 0,
    mp_regen:i64 = 0,

    pub fn add(self: *Stats, x:Stats) !void{
        self.def += x.def;
        self.hp += x.hp;
        self.hp_regen += x.hp_regen;
        self.mag_def += x.mag_def;
        self.mp += x.mp;
        self.mp_regen += x.mp_regen;
    }
    pub fn sub(self: *Stats, x:Stats) !void{
        self.def -= x.def;
        self.hp -= x.hp;
        self.hp_regen -= x.hp_regen;
        self.mag_def -= x.mag_def;
        self.mp -= x.mp;
        self.mp_regen -= x.mp_regen;
    }
};
const Item = struct {
    id:i32,
    name:u8[100],
    price:i64,
    bonusStats:fn() Stats
    


};


