sub common_fetch {

    return undef unless ( @_ == 1 );

    my ( $line ) = @_;

    my ( $f, $uid, $pid, $ppid, $cmd ) = (
        $line =~ m/(\d+) +(\d+) +(\d+) +(\d+).* (.*)/
    );

    return undef unless (
        defined( $pid ) &&
        defined( $ppid ) &&
        defined( $cmd  )
    );

    return {
        PID  => $pid,
        PPID => $ppid,
        CMD  => $cmd
    };
}

sub common_spread {

    return undef unless ( @_ == 2 );

    my ( $hier_ref, $chunk_ref ) = @_;

    if ( exists $$hier_ref{ $$chunk_ref{'PPID'} } ) {
        my $a_ref = $$hier_ref{ $$chunk_ref{'PPID'} };
        push( @$a_ref, $$chunk_ref{'PID'} );
    }
    else {
        $$hier_ref{ $$chunk_ref{'PPID'} } = [ $$chunk_ref{'PID'} ];
    }

    # It is just to abide with not returning undef
    return $hier_ref;
}


sub common_display {

    return undef unless ( @_ == 1 );

    my ( $hier_ref ) = @_;

    foreach my $pkey ( keys %{ $hier_ref } )
    {
        print("PPID: $pkey \n");
        my $a_ref = $$hier_ref{ $pkey };
        foreach ( @$a_ref ) {
            print("  " . $_ . "\n");
        }
    }
}


my %steps = (
    'FETCH'   => \&common_fetch,
    'SPREAD'  => \&common_spread,
    'DISPLAY' => \&common_display
);


sub start {
    my %hierarchy = {};

    # Expecting input as a pipe
    while ( <STDIN> ) {

        my $chunk_ref = &{ $steps{'FETCH'} }("$_");
        if ( defined( $chunk_ref ) ) {
            &{ $steps{'SPREAD'} }( \%hierarchy, $chunk_ref );
        }


    }

    &{ $steps{'DISPLAY'} }( \%hierarchy );
}



&start();
