# ProcessWatcher

A batch script to open Chrome, monitor its process, and display a reminder message when Chrome is closed.

## Description

This project provides a simple batch script that opens Google Chrome with a specified URL, monitors its process, and displays a reminder message when the Chrome process is closed. The script is designed to be easy to use and modify for various purposes.

## Features

- Opens Google Chrome with a specified URL.
- Monitors the Chrome process.
- Displays a reminder message when Chrome is closed.
- Uses embedded PowerShell for process monitoring and message display.

## Getting Started

### Prerequisites

- Windows operating system.
- Google Chrome installed.
- PowerShell available on the system.

### Installation

1. Clone the repository:

    ```sh
    git clone https://github.com/YOUR_USERNAME/ProcessWatcher.git
    cd ProcessWatcher
    ```

2. Make sure you have the necessary permissions to run batch scripts and PowerShell scripts on your system.

### Usage

1. Edit the batch script `ProcessWatcher.bat` to set the desired URL:

    ```batch
    @echo off
    setlocal

    REM Abre Chrome con la URL especificada
    start chrome "https://www.tu-enlace.com"
    ```

2. Run the batch script:

    ```sh
    ProcessWatcher.bat
    ```

3. The script will open Google Chrome with the specified URL, monitor its process, and display a reminder message when Chrome is closed.

### Customization

- To change the reminder message, edit the following line in the batch script:

    ```batch
    [System.Windows.MessageBox]::Show('Recuerda hacer x cosa', 'Recordatorio', 'OK', 'Information')
    ```

- You can modify the timeout duration and other parameters as needed.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any changes or improvements.

## License

This project is licensed under the MIT License - see the
