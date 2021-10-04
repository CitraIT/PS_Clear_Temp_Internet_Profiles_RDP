<#
# CITRA IT - EXCELÊNCIA EM TI
# SCRIPT PARA REMOVER PERFIS DE USUÁRIOS DOS BROWSERS COMUNS (IE, FIREFOX, CHROME E EDGE) 
# 	UTIL EM SERVIDORES RDP.
# AUTOR: luciano@citrait.com.br
# DATA: 10/01/2021
# Homologado para executar no Windows 7 ou Server 2008+
# EXAMPLO DE USO: Powershell -ExecutionPolicy ByPass -File C:\scripts\PS_Clear_Temp_Internet_Profiles_RDP.ps1
#>


#
# Enumerating Users
#
$users = Get-ChildItem -Path C:\Users



#
# Removing browsers profiles
#
Write-Host "Cleaning $user temporary internet files..."
ForEach($user in $users)
{
	# Internet Explorer Cache
    get-childitem -path "C:\Users\$user\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.MSO" | remove-item -Recurse -force -EA SilentlyContinue -Confirm:$False
    get-childitem -path "C:\Users\$user\AppData\Local\Microsoft\Windows\Temporary Internet Files\Content.IE5" | remove-item -Recurse -force -EA SilentlyContinue -Confirm:$False
    
    # Windows Internet cache
    get-childitem -path "C:\Users\$user\AppData\Local\Microsoft\Windows\WebCache" | remove-item -Recurse -force -EA SilentlyContinue -Confirm:$False

    # Google Chrome Profile
    get-childitem -path "C:\Users\$user\AppData\Local\Google\Chrome\User Data\Default" | remove-item -Recurse -force -EA SilentlyContinue -Confirm:$False

    # MS Edge Profile
    get-childitem -path "C:\Users\$user\AppData\Local\Microsoft\Edge\User Data\Default" | remove-item -Recurse -force -EA SilentlyContinue -Confirm:$False



}

#
# Finished
#
Write-Host -ForegroundColor Green "Finished !"
