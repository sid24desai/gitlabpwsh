# Here we are defining the application object properties
# Remember to change the AppId, AppSecret and TenantID values accordingly.

$AppId="c0c952e9-5254-45b5-b838-6d26a31435cb"
$AppSecret="swQ8Q~v6sg3CMNYdnOhD1CCh2UaKmxN2xePBIaOm"

# We need to convert the password to a secute string

$SecureSecret = $AppSecret | ConvertTo-SecureString -AsPlainText -Force

# We then create a new object to encapsulate the Application ID and secret

$Credential = New-Object -TypeName System.Management.Automation.PSCredential `
-ArgumentList $AppId,$SecureSecret

$TenantID="83331f4e-7f45-4ce4-99ed-af9038592395"

# We can then connnect to our Azure account via the use of the Service Principal

Connect-AzAccount -ServicePrincipal -Credential $Credential -Tenant $TenantID 

# Now go ahead and create the resource group

$ResourceGroupName ="powershell-grp"
$Location = "North Europe"
New-AzResourceGroup -Name $ResourceGroupName -Location $Location