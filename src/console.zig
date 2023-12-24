const std = @import("std");


pub const Size = struct {
    columns: u16,
    rows: u16,
};

//Crross-platform terminal size implementation by @Lee Cannon#5908 from Zig Programming Language discord server
pub fn getTerminalSize() !Size {
    if (@import("builtin").os.tag == .windows) return windowsGetTerminalSize();
    return unixlikeGetTerminalSize();
}

pub fn input(buf: []u8) !void {
    const stdin = std.io.getStdIn().reader();
    _ = try stdin.readUntilDelimiterOrEof(buf, '\n');
}

fn unixlikeGetTerminalSize() !Size {
    const stdout = std.io.getStdOut();

    var wsz: std.os.system.winsize = undefined;
    const rc = std.os.system.ioctl(stdout.handle, std.os.system.T.IOCGWINSZ, @intFromPtr(&wsz));
    switch (std.os.errno(rc)) {
        .SUCCESS => {}, 
        else => return error.GetTerminalSizeFailed,
    }
    return .{ .columns = wsz.ws_col, .rows = wsz.ws_row };
}

fn windowsGetTerminalSize() !Size {
    var info: std.os.windows.CONSOLE_SCREEN_BUFFER_INFO = undefined;
    if (std.os.windows.kernel32.GetConsoleScreenBufferInfo(std.io.getStdOut().handle, &info) != std.os.windows.TRUE) {
        return error.GetTerminalSizeFailed;
    }
    return .{
        .columns = @intCast(info.srWindow.Right - info.srWindow.Left + 1),
        .rows = @intCast(info.srWindow.Bottom - info.srWindow.Top + 1),
    };
}
