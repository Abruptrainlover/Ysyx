#!/usr/bin/env perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2003 by Wilson Snyder. This program is free software; you
# can redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.
# SPDX-License-Identifier: LGPL-3.0-only OR Artistic-2.0

scenarios(simulator => 1);

compile(
    );

execute(
    check_finished => 1,
    );

for my $file (glob_all("$Self->{obj_dir}/$Self->{vm_prefix}___024root__DepSet*__Slow.cpp")) {
    file_grep_not($file, qr/(<<|>>)/x);
}

ok(1);
1;
