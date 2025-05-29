<#
.SYNOPSIS
    AES (Fernet) encryption and decryption example in PowerShell 7.
.DESCRIPTION
    Demonstrates key generation, encryption, and decryption using .NET's AES implementation.
.NOTES
    Requires PowerShell 7+.
#>

param(
    [string]$KeyFile = "aes.key"
)

function Generate-Key {
    param($KeyFile)
    $aes = [System.Security.Cryptography.Aes]::Create()
    $aes.KeySize = 256
    $aes.GenerateKey()
    [IO.File]::WriteAllBytes($KeyFile, $aes.Key)
    return $aes.Key
}

function Load-Key {
    param($KeyFile)
    return [IO.File]::ReadAllBytes($KeyFile)
}

function Encrypt-Message {
    param($Message, $Key)
    $aes = [System.Security.Cryptography.Aes]::Create()
    $aes.Key = $Key
    $aes.GenerateIV()
    $iv = $aes.IV
    $encryptor = $aes.CreateEncryptor()
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($Message)
    $cipher = $encryptor.TransformFinalBlock($bytes, 0, $bytes.Length)
    # Return IV + cipher as base64
    return [Convert]::ToBase64String($iv + $cipher)
}

function Decrypt-Message {
    param($CipherText, $Key)
    $data = [Convert]::FromBase64String($CipherText)
    $iv = $data[0..15]
    $cipher = $data[16..($data.Length-1)]
    $aes = [System.Security.Cryptography.Aes]::Create()
    $aes.Key = $Key
    $aes.IV = $iv
    $decryptor = $aes.CreateDecryptor()
    $plain = $decryptor.TransformFinalBlock($cipher, 0, $cipher.Length)
    return [System.Text.Encoding]::UTF8.GetString($plain)
}

# Main logic
if (-not (Test-Path $KeyFile)) {
    Write-Host "[INFO] Generating new AES key..."
    $key = Generate-Key $KeyFile
} else {
    Write-Host "[INFO] Loading existing AES key..."
    $key = Load-Key $KeyFile
}

$message = "Top secret message"
Write-Host "Original Message: $message"

$encrypted = Encrypt-Message -Message $message -Key $key
Write-Host "Encrypted: $encrypted"

$decrypted = Decrypt-Message -CipherText $encrypted -Key $key
Write-Host "Decrypted: $decrypted"