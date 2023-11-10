Add-Type -AssemblyName System.Windows.Forms

# Create a form
$form = New-Object Windows.Forms.Form
$form.Text = "Eerik-Toolbox™"
$form.Width = 220
$form.Height = 700

$form.ForeColor = [System.Drawing.Color]::White
$form.BackColor = [System.Drawing.Color]::DarkSlateGray
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog

# Create labels and buttons
$label = New-Object Windows.Forms.Label
$label.Text = "Eerik-Toolbox™"
$label.Location = New-Object Drawing.Point(10, 10)
$label.Size = New-Object Drawing.Size(500, 25)
$label.Font = New-Object System.Drawing.Font("Arial Black", 12)
$form.Controls.Add($label)

# Function to create and configure buttons
Function New-Button {
    param (
        [string]$text,
        [int]$top,
        [scriptblock]$action
    )

    $button = New-Object Windows.Forms.Button
    $button.Text = $text
    $button.Location = New-Object Drawing.Point(14, $top)
    $button.Size = New-Object Drawing.Size(185, 40)
    $button.Font = New-Object System.Drawing.Font("Arial", 12)
    $button.Add_Click($action)
    $form.Controls.Add($button)
}

New-Button -text "Notepad" -top 60 -action { Start-Process notepad }
New-Button -text "Tegumihaldur" -top 110 -action { Start-Process taskmgr }
New-Button -text "Kontrollpaneel" -top 160 -action { Control }
New-Button -text "Võrguühendused" -top 210 -action { Start-Process ncpa.cpl }
New-Button -text "Kettahaldus" -top 260 -action { Start-Process diskmgmt.msc }
New-Button -text "Seadmehaldus" -top 310 -action { Start-Process devmgmt.msc }
New-Button -text "Registriredaktor" -top 360 -action { Start-Process regedit }
New-Button -text "Task Scheduler" -top 410 -action { Start-Process taskschd.msc }
New-Button -text "NVIDIA Draiverid" -top 460 -action { Start-Process "https://www.nvidia.com/download/index.aspx" }
New-Button -text "AMD Draiverid" -top 510 -action { Start-Process "https://www.amd.com/en/support" }

# Add a button to remove Microsoft Edge
New-Button -text "Remove Edge" -top 560 -action { Remove-MicrosoftEdge }

# Add a button to close the script
New-Button -text "Exit" -top 610 -action { $form.Close() }


# Function to remove Microsoft Edge
Function Remove-MicrosoftEdge {
    # Use PowerShell command to remove Microsoft Edge
    Get-AppxPackage *MicrosoftEdge* | Remove-AppxPackage
}


# Show the form
$form.Add_Shown({$form.Activate()})
$form.ShowDialog()

# Dispose of the form when done
$form.Dispose()