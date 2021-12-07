#Horas atual        
$horasAtual = Get-Date

try{
#Insira o diret�rio do arquivo aqui (Verificar se o caminho est�  correto e se possuir algum espa�o colocar em aspas duplas.)
$caminhoArquivo = "C:\Caminho\Do\Arquivo\Aqui"

#Insira o diret�rio do arquivo + arquivo.arq aqui
$Arquivo = (Get-Item "C:\Caminho\Do\Arquivo\Aqui\Arquivo.arq").LastWriteTime
#Quanto tempo no m�ximo que o arquivo pode atrasar... (neste caso, 5 minutos)
$horaArquivoExcedida  = $Arquivo.AddMinutes(5)

if($horasAtual -ige $horaArquivoExcedida){
    For ($i=0; $i -le 10; $i++) {
    [console]::beep(2000,100)
    $i++;
    }
    Start-Sleep(0.7)
    Add-Type -AssemblyName System.Windows.Forms
    #Add-Type -AssemblyName PresentationFramework
    [System.Windows.Forms.MessageBox]::Show("O Arquivo escolhido n�o foi atualizado. Por favor verifique o arquivo no diret�rio: $caminhoArquivo","Alerta!",0, 48)
    
}else{
    Write-Host "Ultima atualiza��o do controle: $Arquivo"
}
}catch{
    $Error[0].Exception
}