

#my $tprocs_ref = [
#       { PID => 6745, PPID => 3, CMD => 'Root', WALKED => 0 },
#       { PID => 3, PPID => 1, CMD => 'GrandChild1', WALKED => 0 },
#       { PID => 1, PPID => 0, CMD => 'Child1', WALKED => 0 },
#       { PID => 2, PPID => 3, CMD => 'Child2', WALKED => 0 },
#       { PID => 4, PPID => 1, CMD => 'GrandChild2', WALKED => 0 }
#];


sub trim {

    my $s = shift;
    $s =~ s/^\s+|\s+$//g;

    return $s
}


sub decode_line {

    unless ( @_ == 2 ) {
        die( "not enough input params" );
    }

    my ( $tprocs_ref, $line ) = @_;

    my ( $f, $uid, $pid, $ppid, $cmd ) = (
        $line =~ m/(\d+) +(\d+) +(\d+) +(\d+).* (.*)/
    );

    # This denotes the line was not decoded
    # because of it does not abide with regex pattern
    return 0 unless ( defined( $pid ) && defined( $ppid ) && defined( $cmd ) );

    $pid = trim( $pid );
    $ppid = trim( $ppid );
    
    if ( $ppid == 0 ) {

		# He is his own inceptor as god :)
		$ppid = $pid;
	}    
    
    $$tprocs_ref{ $pid } = { PPID => $ppid, CMD  => $cmd, WALKED => 0 };

    return 1;
}


sub print_process {

    my ( $pid, $cmd, $indent ) = @_;

    my $t = "%-5s" . ( $indent ? ("    " x $indent) . '\_' : '' ) . "%0s\n";

    printf( $t, $pid, $cmd );
}


sub fetch_gods {

	my ( $tprocs_ref, $spids_ref ) = @_;

    @gods;

    foreach ( @$spids_ref ) {

        unless ( ${ $$tprocs_ref{ $_ } }{ 'PPID' } == $_ ) {
            next;
        }

        push( @gods, $_ );		
    }
    
    return @gods;
}


sub fetch_immediate_children {

	my ( $tprocs_ref, $spids_ref, $pid ) = @_;

    @children;

    foreach ( @$spids_ref ) {

        # to avoid self inclusion
        if ( $_ == $pid ) {
            next;
        }       

        unless ( ${ $$tprocs_ref{ $_ } }{ 'PPID' } == $pid ) {
            next;
        }

        push( @children, $_ );		
    }
    
    return @children;
}


sub walk_down {

    my ( $tprocs_ref, $spids_ref, $pid, $indent ) = @_;

    &print_process( $pid, ${ $$tprocs_ref{ $pid } }{ 'CMD' }, $indent );

    ${ $$tprocs_ref{ $_ } }{ 'WALKED' } = 1;  

    @cpids = &fetch_immediate_children( $tprocs_ref, $spids_ref, $pid );

    $indent++;

    foreach ( @cpids ) {
		&walk_down( $tprocs_ref, $spids_ref, $_, $indent );
    }
}


sub display {

    unless ( @_ == 1 ) {
        die( "not enough input params" );
    }

    my ( $tprocs_ref ) = @_;

    # this sorted info will be passed recursively to overhead
    # of sorting and sorting over and over again
    my @spids = sort { $$a{ 'PID' } <=> $$b{ 'PID' } } keys %$tprocs_ref;

    @gpids = &fetch_gods( $tprocs_ref, \@spids );

    # This loop is just to walk down through god processes detected,
    # the rest of processes at this level should be ignore.
    foreach ( @gpids ) {
        &walk_down( $tprocs_ref, \@spids, $_, 0 );
    }
}


%tprocs;

# Expecting input as a pipe
#while ( <STDIN> ) {
#    &decode_line( \%tprocs, $_ );
#}

$tprocs{'6745'} = { PID => 6745, PPID => 3, CMD => 'Root', WALKED => 0 };
$tprocs{'3'} = { PPID => 1, CMD => 'GrandChild1', WALKED => 0 };
$tprocs{'1'} = { PPID => 1, CMD => 'Child1', WALKED => 0 },
$tprocs{'2'} = { PPID => 3, CMD => 'Child2', WALKED => 0 },
$tprocs{'4'} = { PPID => 1, CMD => 'GrandChild2', WALKED => 0 };

&display(\%tprocs);
