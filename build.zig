const std = @import("std");

pub fn build(b: *std.Build) void {
    const path = b.option([]const u8, "path", "the source file to compile.").?;

    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const exe = b.addExecutable(.{
        .name = "test",
        // .root_module = b.createModule(.{
        //     .root_source_file = b.path(path),
        //     .target = b.graph.host,
        // }),
        .root_module = null,
        .target = target,
        .optimize = optimize,
    });
    exe.addCSourceFile(.{
        .file = b.path(path),
    });


    // link with the standard library libcpp
    exe.linkLibCpp();
    exe.linkLibC();

    exe.addIncludePath(b.path("."));
    exe.addIncludePath(b.path("tests"));

    // exe.addCSourceFile("src/hello.cpp", &.{});
    b.installArtifact(exe);
    const run_exe = b.addRunArtifact(exe);
    const run_step = b.step("run", "run the app");

    run_step.dependOn(&run_exe.step);
}
