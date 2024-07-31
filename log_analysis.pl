#!/usr/bin/env perl

use v5.34;
use strict;
use warnings;
use Log::Log4perl qw(:easy);
use Apache::LogRegex;

# Initialize logging
Log::Log4perl->easy_init($INFO);

# Set up the Apache log format
my $format = '%h %l %u %t "%r" %>s %b "%{Referer}i" "%{User-Agent}i"';

# Create a new parser object
my $lr = Apache::LogRegex->new($format);

# Define log file to analyze
my $logfile = 'access_log';

# Open the log file
open my $fh, '<', $logfile or die "Could not open '$logfile' $!";

# Initialize counters for report
my $total_requests = 0;
my %status_codes;
my %clients;

# Process each line in the log file
while (my $line = <$fh>) {
    chomp $line;

    # Parse the line
    if ($lr->parse($line)) {
        $total_requests++;

        # Extract relevant fields
        my $client_ip = $lr->{data}->{h};
        my $status_code = $lr->{data}->{'%>s'};

        # Log the request
        INFO("Request from $client_ip returned status $status_code");

        # Update counters
        $clients{$client_ip}++;
        $status_codes{$status_code}++;
    }
    else {
        WARN("Failed to parse line: $line");
    }
}

close $fh;

# Generate a simple report
print "Log Analysis Report\n";
print "-------------------\n";
print "Total Requests: $total_requests\n\n";

print "Status Codes:\n";
foreach my $code (sort keys %status_codes) {
    print "$code: $status_codes{$code}\n";
}

print "\nClient IPs:\n";
foreach my $client (sort keys %clients) {
    print "$client: $clients{$client}\n";
}

