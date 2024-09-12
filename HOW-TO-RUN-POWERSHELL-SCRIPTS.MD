
The following instrucitons have been copied from Chat GPT

In a GitHub Codespaces environment using the VS Code interface, there are several ways to run a PowerShell script (.ps1). Here are the different methods you can use:

1. Using the Integrated Terminal
Open the integrated terminal in VS Code by pressing Ctrl + ` (backtick) or navigating to View > Terminal.
Type pwsh to start the PowerShell session.
Navigate to the directory where your script is located using the cd command.
Run the script by typing .\YourScript.ps1.
2. Using the Run Button
Open the .ps1 file in the editor.
If the "Run" button appears in the top right of the editor or near the line numbers, click it to run the script.
This method will use the default shell specified in your VS Code terminal settings.
3. Using the Debug Feature
Set breakpoints by clicking next to the line numbers in the script file.
Open the Run and Debug view by pressing Ctrl + Shift + D or navigating to View > Run.
Select the PowerShell debug configuration or create a new one if it doesn't exist.
Click the green Run button or press F5 to start debugging the script.
4. Using the Command Palette
Open the Command Palette by pressing Ctrl + Shift + P.
Type PowerShell: Run Script and select it.
This will run the currently open PowerShell script.
5. Using Task Automation
Create a task in the tasks.json file to automate running the PowerShell script.
Open the Command Palette (Ctrl + Shift + P), type Tasks: Run Task, and select the task configured for your PowerShell script.
6. Using CodeLens (If Installed)
If the PowerShell extension for VS Code is installed, you might see "Run Script" or "Debug Script" links above your script's functions.
Click these links to execute or debug the script directly.
7. Using Context Menu
Right-click on the .ps1 file in the Explorer sidebar or in the editor.
Select Run PowerShell from the context menu (if available, depending on extensions installed).
8. Configure a Shortcut or Use Keybinding
You can customize keybindings in VS Code to run your PowerShell script directly using a shortcut.
These are some ways you can run a PowerShell script in a GitHub Codespaces environment. The availability of some options depends on the extensions and configurations you've set up in your VS Code environment within Codespaces.