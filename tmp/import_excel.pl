use Email::Send;
use Email::Send::Gmail;
use Email::Simple::Creator;

use Spreadsheet::ParseXLSX;
use Spreadsheet::Read;

#my $book = Spreadsheet::Read->new ("LA DCs Order Guide.xlsx");
my $book = Spreadsheet::Read->new ("Canteen Updated Fresh Grill Order - GARDEN GROVE Laura  CHANGES 11 01 2018 .xlsx");

my $sheet = $book->sheet(1);

my $sheets = $book->sheets;
print "Sheets: $sheets\n";

my $sheet = $book->sheet(2);

#my $cell  = $sheet->cell("D1");

my $label = $sheet->label;
print "Label: $label\n";

print "\n";
for my $sheet_no (1...$sheets) {
	my $sheet = $book->sheet($sheet_no);
	my $label = $sheet->label;
	print "Label: $label\n";
}
print "\n";

my $location = $sheet->cell("D2");
print "location: $location\n";

#print $sheet->maxrow;

#my @dates;

#print $sheet->cell(7,6);

my $item;
my $qte;
for my $row (9...9) { 	# $sheet->maxrow) {
	$item = $sheet->cell(3, $row);
	if ($item =~ m/^\d\d\d\d\d$/) {
		print "$item\n";

		$qte = $sheet->cell(6, $row);
		if ($qte =~ m/\s?\d+\s?/) {
			print "Sun $qte\n";
		}

		$qte = $sheet->cell(7, $row);
		if ($qte =~ m/\s?\d+\s?/) {
			print "Mon $qte\n";
		}

		$qte = $sheet->cell(8, $row);
		if ($qte =~ m/\s?\d+\s?/) {
			print "Tue $qte\n";
		}

		$qte = $sheet->cell(9, $row);
		if ($qte =~ m/\s?\d+\s?/) {
			print "Wed $qte\n";
		}

		$qte = $sheet->cell(10, $row);
		if ($qte =~ m/\s?\d+\s?/) {
			print "Thu $qte\n";
		}

		$qte = $sheet->cell(11, $row);
		if ($qte =~ m/\s?\d+\s?/) {
			print "Fri $qte\n";
		}

		$qte = $sheet->cell(12, $row);
		if ($qte =~ m/\s?\d+\s?/) {
			print "Sat $qte\n";
		}		
	}
}

$date1970 = $sheet->cell(7,6) - 25569;
print $sheet->cell(7,6)."\n";
#print $sheet->cell(7,6)."\n";
print $date1970."\n";

my $datestring = localtime();
print "Current date and time $datestring\n";

my $gmt = gmtime();
print "GMT date and time $gmt\n";

my $timezone = -7*60*60;

my $epoc = time() + $timezone;
print "Epoc from 01 Jan 1970 $epoc\n";

my $yesterday = localtime($epoc - 24*60*60);
print "Yesterday date and time $yesterday\n";

my $days = int($epoc / (24*60*60));
print "Days: $days\n";

my $hours = int( ($epoc - $days * 24*60*60) / (60*60) );
print "Hours: $hours\n";

my $offset = $datestring - $gmt;
print "Time offset: $offset\n";

print $sheet->cell(6,6)."\n";
print $sheet->cell(7,6)."\n";
print $sheet->cell(8,6)."\n";
print $sheet->cell(9,6)."\n";
print $sheet->cell(10,6)."\n";
print $sheet->cell(11,6)."\n";
print $sheet->cell(12,6)."\n";


my $excel_timestamp = ($sheet->cell(6,6) - 25569) * 60 * 60 * 24;
print "excel_timestamp = $excel_timestamp\n";
my $excel_datestring = gmtime($excel_timestamp);
print "excel_datestring = $excel_datestring\n";
my ($sec,$min,$hour,$day,$mon,$year,$wday,$yday,$isdst) = gmtime($excel_timestamp);
$mon += 1;
$year += 1900;
print "date: $year/$mon/$day\n";

# exit(0);

my $email = Email::Simple->create(
    header => [
        From    => 'freshgrillfoods.delivery@gmail.com',
        To      => 'alexeib.2018@gmail.com',
        Subject => 'Test email 2',
    ],
    body => 'Hello, Alexei!',
);

my $sender = Email::Send->new(
    {   mailer      => 'Gmail',
        mailer_args => [
            username => 'freshgrillfoods.delivery@gmail.com',
            password => 'qwer!123',
        ]
    }
);

eval { $sender->send($email) };
die "Error sending email: $@" if $@;



my $mailer = Email::Send->new( {
    mailer => 'SMTP::TLS',
    mailer_args => [
        Host => 'smtp.gmail.com',
        Port => 587,
        User => 'freshgrillfoods.delivery@gmail.com',
        Password => 'qwer!1234',
        Hello => 'freshgrillfoods.com',
    ]
} );

my $email = Email::Simple->create(
    header => [
        From    => 'freshgrillfoods.delivery@gmail.com',
        To      => 'alexeib.2018@gmail.com',
        Subject => 'Subject title',
    ],
    body => 'Content.',
);

eval { $mailer->send($email) };
die "Error sending email: $@" if $@;