Function DisableMouseHiding {
    Write-Output "Disable mouse pointer hiding"
    Set-ItemProperty "HKCU:\Control Panel\Desktop" "UserPreferencesMask" ([byte[]](0x9e,
            0x1e, 0x06, 0x80, 0x12, 0x00, 0x00, 0x00))
}

Function EnableDomainPINLogon {
    Write-Output "Enabling Domain PIN logon"
    Set-ItemProperty "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" "AllowDomainPINLogon" 1
}

Function SetLidCloseAction {
    powercfg -setacvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 1
    #When only on battery
    powercfg -setdcvalueindex 381b4222-f694-41f0-9685-ff5bb260df2e 4f971e89-eebd-4455-a8de-9e59040e7347 5ca83367-6e45-459f-a27b-476b1d01c936 0

}

Function EnableSomePowerSavingSettings {
    #Powersaving settings
    Powercfg -change -monitor-timeout-ac 20
    Powercfg -change -monitor-timeout-dc 15
    Powercfg -change -standby-timeout-ac 60
    Powercfg -change -standby-timeout-dc 30
}

Function EnableSomeWindowsUpdateSettings{
    # Enable updates for other products from Windows Update
    $ServiceManager = New-Object -ComObject "Microsoft.Update.ServiceManager"
    $ServiceManager.ClientApplicationID = "My App"
    $NewService = $ServiceManager.AddService2("7971f918-a847-4430-9279-4a52d1efe18d",7,"")
}
