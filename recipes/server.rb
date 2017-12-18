powershell_script 'Install IIS' do
  code <<-EOH
  Import-Module ServerManager
  Add-WindowsFeature Web-Server
  EOH
  file 'C:\inetpub\wwwroot\Default.ht' do
    content '<h1>Hello,world!</h1>'
  end
  service 'w3svc' do
    action [:enable, :start]
  end
