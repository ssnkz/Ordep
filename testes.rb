while @usuarioconectado[1] != @usuarios[indice]
    puts "Coloque a Senha Correta!"
    senha1 = gets.chomp.to_i
    @usuarioconectado[1] = {usuario: resusua, senha: "#{senha1}"}
    if @usuarioconectado[1] == @usuarios[indice]
      puts "Senha Correta"
      break
    end
  end


#Solução Autenticação de usuario.