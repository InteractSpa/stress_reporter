# StressReporter

Daemon that runs and reports on stressful stuff.
Was born with specific needs but may be extended to cover more scenarios.
Should help in understanding why a machine deserves to die.

## Notice

See the version number? 0.0.1 - this is pre pre pre alpha, don't even
think about using it in production.

## Installation

    $ gem install stress_reporter

## Usage

    stress_reporter [avg]

avg defaults to 1.0
If load average exceeds avg, runs various checks (well, not that various
for the time being, just a passenger-status specific one), and logs to
/tmp/xxxx

## Todo

 * Use the /proc filesystem instead of forking external programs
 * Add more config options
 * Add configuration

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
