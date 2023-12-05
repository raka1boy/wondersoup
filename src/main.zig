const std = @import("std");
const cmd = @import("console.zig");
const game = @import("entity.zig");
pub fn main() !void {
    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();
    
    try stdout.print("{any}\n", .{cmd.getTerminalSize()});

    try bw.flush();
}
