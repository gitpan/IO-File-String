
=head1 NAME

IO::File::String - load/save whole file as single string

=head1 DESCRIPTION

Simple interface to enable load/save the whole file 
as single scalar string.

It is subclass of IO::File so that all methods
are inherited (including the 'new' method).

=head1 SYNOPSIS

 my $sfh = IO::File::String->new( '< my-file.txt' );
 $sfh->load( my $str )->close;
 ...
 my $str =  'test string';
 my $sfh = IO::File::String->new( '> my-file.txt' );
 $sfh->save( $str )->close;
 
=cut

#------------------------------------------------------
# 2004/01/09 - $Date: 2004/01/09 18:31:44 $
# (C) Daniel Peder & Infoset s.r.o., all rights reserved
# http://www.infoset.com, Daniel.Peder@infoset.com
#------------------------------------------------------
# $Revision: 1.3 $
# $Date: 2004/01/09 18:31:44 $
# $Id: String.pm_rev 1.3 2004/01/09 18:31:44 root Exp root $

# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
#
# SECTION: package
#

	package IO::File::String;


# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
#
# SECTION: version
#

	use vars qw( $VERSION $VERSION_LABEL $REVISION $REVISION_DATETIME $REVISION_LABEL $PROG_LABEL );

	$VERSION           = '0.10';
	
	$REVISION          = (qw$Revision: 1.3 $)[1];
	$REVISION_DATETIME = join(' ',(qw$Date: 2004/01/09 18:31:44 $)[1,2]);
	$REVISION_LABEL    = '$Id: String.pm_rev 1.3 2004/01/09 18:31:44 root Exp root $';
	$VERSION_LABEL     = "$VERSION (rev. $REVISION $REVISION_DATETIME)";
	$PROG_LABEL        = __PACKAGE__." - ver. $VERSION_LABEL";


# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
#
# SECTION: modules use
#

	require 5.005_62;

	use IO::File      ;
	use base          qw( IO::File );
	

# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
#
# SECTION: methods
#

=head1 METHODS

=over 4

=cut





# =item B< new >
# 
# =cut
# 
# ### ---
# sub new { goto &IO::File::new }
# ### ---






=item B< load >

 $fh->load( my $string );
 
Load the whole file into $string.

=cut

### ----
sub load
### ----
{
	my $fh = shift();
	local $/ = undef;
	$_[0] = $fh->getline;
	$fh
}








=item B< save >

 $fh->save( $string );
 
Save the whole $string into file.

=cut

### ----
sub save
### ----
{
	my $fh = shift();
	print $fh $_[0];
	$fh
}












1;


# --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- --- 
#
# SECTION: pod epilogue
#

=back

=cut

=head1 FILES

none

=head1 REVISION

B<<  project started: 2004/01/09 >>

 $Id: String.pm_rev 1.3 2004/01/09 18:31:44 root Exp root $


=head1 AUTHOR

 Daniel Peder, Daniel.Peder@Infoset.COM
 
 http://www.Infoset.COM

=head1 SEE ALSO

L<IO::File> L<IO::Handle> L<IO::Seekable>

=head1 NOTE

'Out of memory' could occur on large files
because the whole file is allways tried to 
put in memory without size checking.
	
=cut

__DATA__

__END__
