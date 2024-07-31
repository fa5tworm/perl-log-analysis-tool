Sure, here is a complete `README.md` file along with the MIT license text.

### README.md

```markdown
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
```

## Usage

1. Place your Apache log file in the same directory as the script.
2. Ensure the `$logfile` variable in the script points to your log file.
3. Run the script:

```sh
perl log_analysis.pl
```

## Example Output

The script generates a report in the terminal, showing the total number of requests, status codes, and requests per client IP.

```
Log Analysis Report
-------------------
Total Requests: 1234

Status Codes:
200: 1000
404: 200
500: 34

Client IPs:
192.168.1.1: 100
10.0.0.1: 50
...
```

## Contributing

1. Fork the repository
2. Create a new branch (`git checkout -b feature-branch`)
3. Make your changes and commit them (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature-branch`)
5. Create a new Pull Request

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.