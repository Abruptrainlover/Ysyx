#!/usr/bin/env perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2003 by Wilson Snyder. This program is free software; you
# can redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.
# SPDX-License-Identifier: LGPL-3.0-only OR Artistic-2.0

scenarios(vlt => 1);

top_filename("t/t_protect_ids.v");

compile(
    verilator_flags2 => ["--protect-ids --protect-key SECRET_KEY",
                         "t/t_protect_ids_c.cpp"],
    );

execute(
    check_finished => 1,
    );

# Since using a named key, we can check for always identical map
files_identical("$Self->{obj_dir}/$Self->{vm_prefix}__idmap.xml", $Self->{golden_filename});

ok(1);
1;
