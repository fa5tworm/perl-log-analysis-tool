# Perl Log Analysis Tool

This is a simple Perl-based tool for analyzing Apache log files. It parses log files, extracts relevant information, and generates reports on system activity.

## Features

- Parses Apache log files using `Apache::LogRegex`
- Logs activity using `Log::Log4perl`
- Generates reports on:
  - Total number of requests
  - Status codes
  - Requests per client IP

## Installation

Ensure you have the necessary Perl modules installed:

```sh
cpan Log::Log4perl
cpan Apache::LogRegex
