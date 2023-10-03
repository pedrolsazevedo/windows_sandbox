# Windows Sandbox Configuration

This README provides documentation for the configuration settings of Windows Sandbox using an XML-based configuration file (WSB file). Windows Sandbox is a lightweight, isolated environment for running untrusted applications without affecting your host system. The configuration file allows you to customize various aspects of the sandbox, such as GPU sharing, folder mapping, protected client mode, and clipboard redirection.

Documentation Link:

https://learn.microsoft.com/en-us/windows/security/application-security/application-isolation/windows-sandbox/windows-sandbox-overview

## Table of Contents
Installation
- [Enable Windows Sandbox](#enable-windows-sandbox)
- [Disable Windows Sandbox](#disable-windows-sandbox)

Configuration
- [vGPU](#vgpu)
- [Mapped Folders](#mapped-folders)
- [Protected Client Mode](#protected-client-mode)
- [Clipboard Redirection](#clipboard-redirection)


## Installation

### Enable Windows Sandbox

To enable the Windows Sandbox feature on your Windows machine, follow these steps:

1. Open PowerShell as an administrator. To do this, right-click on the Windows Start button, select "Windows Terminal (Admin)" or "Windows PowerShell (Admin)," depending on your Windows version.

2. Navigate to the `scripts` directory where the `enable_sandbox.ps1` script is located. You can use the `cd` command to change the directory.

3. Run the `enable_sandbox.ps1` script by entering the following command:

```powershell
.\enable_sandbox.ps1
```

4. If Windows Sandbox was not already enabled, the script will enable it and prompt you to restart your computer to apply the changes.

5. After the restart, you should be able to use Windows Sandbox on your Windows machine.

Please note that administrative privileges are required to enable or disable Windows features. Make sure to save any unsaved work before restarting your computer as part of this process.

### Disable Windows Sandbox

To disable the Windows Sandbox feature on your Windows machine, follow these steps:

1. Open PowerShell as an administrator.

2. Navigate to the `scripts` directory where the `disable_sandbox.ps1` script is located. You can use the `cd` command to change the directory.

3. Run the `disable_sandbox.ps1` script by entering the following command:

```powershell
.\disable_sandbox.ps1
```

4. If Windows Sandbox was enabled, the script will disable it and prompt you to restart your computer to apply the changes.

5. After the restart, Windows Sandbox will be disabled on your Windows machine.

These scripts, located in the `scripts` directory, allow you to easily enable or disable the Windows Sandbox feature on your Windows system, providing a secure and isolated environment for running untrusted applications when needed.

## Configuration Example

There's an example file with the configuration and file structure in the folder `configs`

### vGPU

The `<vGPU>` setting controls GPU sharing within the Windows Sandbox. GPU sharing can enhance graphics performance for applications running in the sandbox.

- `Enable`: Enables vGPU support in the sandbox, allowing applications to use the host GPU for improved graphics performance.
- `Disable`: Disables vGPU support in the sandbox. If disabled, the sandbox will use software rendering, which may result in slower graphics performance.
- `Default`: The default value is to disable vGPU support in the sandbox.

For more information, refer to the [Windows Sandbox documentation](https://learn.microsoft.com/en-us/windows/security/application-security/application-isolation/windows-sandbox/windows-sandbox-configure-using-wsb-file#vgpu).

### Mapped Folders

The `<MappedFolders>` section allows you to specify folders on the host machine that will be shared into the sandbox environment. This can be useful for providing access to specific files or data within the sandbox.

- `<MappedFolder>`: Defines a mapped folder with the following properties:
  - `<HostFolder>`: Specifies the folder on the host machine to share into the sandbox. Ensure that the folder already exists on the host.
  - `<SandboxFolder>`: Specifies the destination path in the sandbox where the host folder will be mapped. If the folder doesn't exist in the sandbox, it will be created.
  - `<ReadOnly>`: If set to `true`, enforces read-only access to the shared folder from within the sandbox. If set to `false`, read-write access is allowed. The default value is `false`.

For more details, please check the [Windows Sandbox documentation](https://learn.microsoft.com/en-us/windows/security/application-security/application-isolation/windows-sandbox/windows-sandbox-configure-using-wsb-file#mapped-folders).

![Shared Folder from host to sandbox](docs\imgs\image.png)
### Protected Client Mode

The `<ProtectedClient>` setting determines whether Windows Sandbox runs in Protected Client mode. Protected Client mode provides an additional layer of security by running the sandbox in an AppContainer Isolation execution environment.

- `Enable`: Runs Windows Sandbox in Protected Client mode, enhancing security through AppContainer Isolation.
- `Disable`: Runs the Sandbox in standard mode without extra security mitigations.
- `Default`: The default value is to run the sandbox without Protected Client mode.

Learn more about Protected Client mode in the [Windows Sandbox documentation](https://learn.microsoft.com/en-us/windows/security/application-security/application-isolation/windows-sandbox/windows-sandbox-configure-using-wsb-file#protected-client).

### Clipboard Redirection

The `<ClipboardRedirection>` setting controls whether the host clipboard can be shared with the sandbox or if clipboard redirection is disabled.

- `Enable`: Enables sharing of the host clipboard with the sandbox, allowing you to copy and paste data between the host and sandbox.
- `Disable`: Disables clipboard redirection in the sandbox. If disabled, copy/paste operations between the host and sandbox will be restricted.
- `Default`: The default value permits copy/paste between the host and sandbox.

For more information, please refer to the [Windows Sandbox documentation](https://learn.microsoft.com/en-us/windows/security/application-security/application-isolation/windows-sandbox/windows-sandbox-configure-using-wsb-file#clipboard-redirection).

Please note that modifying the Windows Sandbox configuration should be done with caution to ensure the desired behavior and security level for your specific use case.

## Running the Sandbox.

After creating the file, just need to double click and run, it will start the `Sandbox` with the desired configuration.