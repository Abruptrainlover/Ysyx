#!/usr/bin/env perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2003-2009 by Wilson Snyder. This program is free software; you
# can redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.
# SPDX-License-Identifier: LGPL-3.0-only OR Artistic-2.0

scenarios(simulator => 1);

my $out_filename = "$Self->{obj_dir}/V$Self->{name}.xml";

compile(
    verilator_flags2 => ["+define+ATTRIBUTES"],
    );

if ($Self->{vlt_all}) {
    file_grep("$out_filename", qr/\<var loc="e,74,.*?" name="clk0" .*dir="input" .*vartype="logic" origName="clk0" clocker="true" public="true"\/\>/i);
    file_grep("$out_filename", qr/\<var loc="e,75,.*?" name="clk1" .*dir="input" .*vartype="logic" origName="clk1" clocker="true" public="true"\/\>/i);
    file_grep("$out_filename", qr/\<var loc="e,76,.*?" name="clk2" .*dir="input" .*vartype="logic" origName="clk2" clocker="true" public="true"\/\>/i);
}

execute(
    check_finished => 1,
    );

ok(1);
1;
