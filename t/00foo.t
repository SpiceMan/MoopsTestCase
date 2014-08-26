#!/usr/bin/env perl

use strict;
use warnings;
use Moops;
use DB;
use Test::More;


ok( my $schema = DB->connect({ dsn => "dbi:SQLite:dbname=db.db" }), "connected" );
ok( $schema->deploy, "deployed");
ok( -f "db.db" && !-z _ , "db looks ok-ish");

unlink "db.db";

done_testing()
