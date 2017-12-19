powershell_script 'Install IIS' do
  code <<-EOH
  Import-Module ServerManager
  Add-WindowsFeature Web-Server
  EOH
  template 'C:\inetpub\wwwroot\Default.htm' do
  source 'Default.htm.erb'
end
  service 'w3svc' do
    action [:enable, :start]
  end
