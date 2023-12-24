const std = @import("std");
const cmd = @import("console.zig");
const game = @import("game_logic.zig");

pub fn main() !void {

    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();
    var buf = [_]u8{0} ** 256;
    var name = [_]u8{0} ** 256;
    const world = std.mem.zeroes([100][100]u8);
    try stdout.print("Welcome to wondersoup version 0.0.1 ! Type responding numbers for selecting an option:\n", .{});
    try stdout.print("1) New game\n", .{});
    try stdout.print("2) Load game from save file\n", .{});
    try bw.flush();
    try cmd.input(&buf);
    switch (buf[0]) {
        49 => {
            try stdout.print("Enter name of your character: ", .{});
            try bw.flush();
            try cmd.input(&name);
        },
        50 => {
            try stdout.print("Saving not implemented yet :(\n", .{});
            try bw.flush();
        },
        else => {
            try stdout.print("unknown option: {s}\n", .{buf});
            try bw.flush();
        }
    }

    std.debug.print("{any}", .{world});

}
