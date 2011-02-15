use strict;
use warnings;
package Email::ExtractBody;

# ABSTRACT: Extract the (non-quoted) text content from an email

use Sub::Exporter -setup => ['extract_body'];

sub extract_body
{
	my $email = shift;
	
	my $text = _get_text_from_email($email);
}

sub _get_text_from_email
{
	my $email = shift;
	
	my $text = '';
	if(ref $email)
	{
		if(eval{$email->isa('Email::MIME')})
		{
			$text = _get_text_from_email_mime($email);
		}
	}
	else
	{	#assume the arg we got was the full text
		$text = $email;
	}
}

sub _get_text_from_email_mime
{
	my $email = shift;
	
	
}

1;
