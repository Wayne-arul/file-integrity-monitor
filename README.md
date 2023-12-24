# File Integrity Monitor

File Integrity Monitor is a simple PowerShell script that helps you monitor the integrity of files in a specified directory. It enables you to create a baseline of file hashes and then continuously monitors for any changes, additions, or deletions within the monitored directory.

## Features

- **Baseline Creation:** Easily create a baseline of file hashes for a specified directory.
- **Continuous Monitoring:** Monitor files against the baseline to detect any changes in real-time.
- **User-Friendly Interface:** Interactive menu for choosing between baseline creation and continuous monitoring.

## Usage

1. Clone the repository:

   ```bash
   git clone https://github.com/WayneArul/file-integrity-monitor.git

   ```powershell
   cd File-Integrity-Monitor

## How It Works

The tool uses the SHA-512 hashing algorithm to calculate file hashes. It maintains a `baseline.txt` file containing the paths and corresponding hashes of the files in the monitored directory. During continuous monitoring, it compares the current state of files with the saved baseline to detect any changes.

## Contributing

Contributions are welcome! If you encounter any issues or have ideas for improvements, feel free to open an issue or submit a pull request.
