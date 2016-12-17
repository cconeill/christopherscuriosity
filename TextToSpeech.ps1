Add-Type -AssemblyName System.speech
$speak = New-Object System.Speech.Synthesis.SpeechSynthesizer

do {
$type = read-host -prompt 'What do you want to say?'
$speak.Speak("$type")
$response = read-host "Say more? Y / N"
}

while ($response -eq "Y")

