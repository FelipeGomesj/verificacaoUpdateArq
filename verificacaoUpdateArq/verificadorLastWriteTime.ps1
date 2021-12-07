#Horas atual        
$horasAtual = Get-Date

try{
#Insira o diretório do arquivo aqui (Verificar se o caminho está  correto e se possuir algum espaço colocar em aspas duplas.)
$caminhoArquivo = "C:\Caminho\Do\Arquivo\Aqui"

#Insira o diretório do arquivo + arquivo.arq aqui
$Arquivo = (Get-Item "C:\Caminho\Do\Arquivo\Aqui\Arquivo.arq").LastWriteTime
#Quanto tempo no máximo que o arquivo pode atrasar... (neste caso, 5 minutos)
$horaArquivoExcedida  = $Arquivo.AddMinutes(5)

if($horasAtual -ige $horaArquivoExcedida){
    For ($i=0; $i -le 10; $i++) {
    [console]::beep(2000,100)
    $i++;
    }
    Start-Sleep(0.7)
    Add-Type -AssemblyName System.Windows.Forms
    #Add-Type -AssemblyName PresentationFramework
    [System.Windows.Forms.MessageBox]::Show("O Arquivo escolhido não foi atualizado. Por favor verifique o arquivo no diretório: $caminhoArquivo","Alerta!",0, 48)
    
}else{
    Write-Host "Ultima atualização do controle: $Arquivo"
}
}catch{
    $Error[0].Exception
}