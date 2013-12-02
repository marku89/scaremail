#!/usr/bin/perl
# marku89

my $MailTo = "root\@localhost"; ## Change me !
my $from = "snowden\@lavabit.com"; ## Change me !
my $subject = "Some fishy subject"; ## If needed change me too 

my $sendmailpath = "/usr/sbin/sendmail"; ## linux default path

#read args
foreach my $in (@ARGV)
{
   if ( $in =~ m/help/ )
   {
      print "Help message, Usage senmail.pl /path/to/input/text.txt";
      exit;
   }
   if ( $in =~ m/(\S+)/ )
   {
      $input = $1;
   }
}

if ( -e $sendmailpath )
{
        open(MAIL, "|$sendmailpath -t");
        #open(MAIL, ">/tmp/mail"); ## debug

        ## Mail Header
        print MAIL "To: $MailTo\n";
        print MAIL "From: $from\n";
        print MAIL "Subject: $subject\n";
        ## Mail Content
        print MAIL `cat $input`;
        close(MAIL);
}
else
{
   print "Sendmail not found, please correct the path !!"
}
