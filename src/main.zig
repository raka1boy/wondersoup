const std = @import("std");
const cmd = @import("console.zig");
const game = @import("game_logic.zig");

pub fn main() !void {
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();
    var buf = [_]u8{0}**256;

    try stdout.print("Welcome to wondersoup version 0.0.1 ! Type responding numbers for selecting an option:\n",.{});
    try stdout.print("1) New game\n",.{});
    try stdout.print("2) Load game from save file\n",.{});
    
    try cmd.input(&buf);

    try stdout.print("2) Load game from save file{s}\n",.{buf});
    try bw.flush();
}
