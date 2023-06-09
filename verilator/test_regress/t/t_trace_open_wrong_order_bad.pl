#!/usr/bin/env perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2023 by Wilson Snyder. This program is free software; you
# can redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.
# SPDX-License-Identifier: LGPL-3.0-only OR Artistic-2.0

scenarios(vlt => 1);

compile(
    verilator_flags2 => ["--cc --trace --exe $Self->{t_dir}/$Self->{name}.cpp"],
    make_top_shell => 0,
    make_main => 0,
    );

execute(
    fails => 1
    );

file_grep($Self->{run_log_filename}, qr/::trace\(\)' shall not be called after 'VerilatedVcdC::open\(\)'/i);

ok(1);
1;
