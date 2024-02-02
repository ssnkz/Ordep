$LOAD_PATH << '.'

require "instancias.rb"
require "variaveis.rb"

def todos_contatos
	puts "--------------Contatos-----------------"
	@agenda.each do |contato|
		puts "#{contato[:nome]} - #{contato[:telefone]}"
	end
	puts ""
	print "Digite qualquer coisa para sair -- >"
	gets
	puts "--------------Contatos-----------------"
	puts ""
	puts ""
	puts ""
end

def adicionar_contato
	puts ""
	print "Nome:"
	nome = gets.chomp
	print "Telefone:"
	telefone = gets.chomp
	puts ""

	@agenda << {nome: nome, telefone: telefone}
end

def ver_contato
	puts
	print "Qual contato voce deseja ver:"
	nome = gets.chomp

	@agenda.each do |contato|
		puts
		if contato[:nome].downcase.include?(nome.downcase)
			puts"----------------------------"
			puts "#{contato[:nome]} - #{contato[:telefone]}"
			puts"----------------------------"
		end
	end
end

def editar_contato
	print "Qual contato deseja editar:"
	nome = gets.chomp

	@agenda.each do |contato|
		if contato[:nome].downcase == (nome.downcase)
			print "Nome Para editar (Se quiser manter o mesmo nome, aperte enter!)"
			nome_salvo = contato[:nome]

			contato[:nome] = gets.chomp
			contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[ :nome]

			print "Telefone Para editar (Se quiser manter o mesmo telefone, aperte enter!)"
			telefone_salvo = contato[:telefone]

			contato[:telefone] = gets.chomp
			contato[:telefone] = contato[:telefone].empty? ? telefone_salvo : contato[ :telefone]
		end
	end
end

def sair_telefone 
	puts
	puts "Ok, Até mais"
end

def remover_contato
	print "Qual contato deseja remover:"
	nome = gets.chomp

	@agenda.each do |contato|
		if contato[:nome].downcase == (nome.downcase)
		indice = @agenda.index(contato)
		@agenda.delete_at(indice)
		break
		end
	end
end


def definindo_usuario
	puts "Ola"
	puts "#{validaçao_ambas::indice}"
end

def validaçao_usuario
	print "Coloque seu Usuario --> "
	resusua = gets.chomp.to_s

	user = "asdhjkadsjashjdaiojhjhaosndkasc"
    indice =
	usuariologado = ""


	@usuarios.each do |a|
		if a[:usuario].downcase == (resusua.downcase)
			user = a[:usuario]
		    indice = @usuarios.index(a)
			id = indice
			contalogada = resusua
		end
	end


	ususu = ""
	if user == resusua
		puts "Usuario Encontrado"
		puts ""
		contalogada = resusua
		ususu = resusua
		@usuarioconectado << {usuario: user, senha: ""}
	end
	while user != resusua
	    puts ""
		puts "Usuario Não Encontrado"
		print "Coloque um usuario existente ou crie um! (Criar) --> "
		resusua = gets.chomp.to_s
		puts ""
	
		if resusua == "Criar"
			criaçao_usuario
			abort
		end
	
		user = "asdhjkadsjashjdaiojhjhaosndkasc"
		@usuarios.each do |a|
			if a[:usuario].downcase == (resusua.downcase)
			user = a[:usuario]
			indice = @usuarios.index(a)
			contalogada = resusua
			ususu = resusua
			break
			end
		end
	end


	print "Agora coloque a senha do usuario #{ususu} --> "
	senha1 = gets.chomp.to_i

	@usuarioconectado[1] = {usuario: resusua, senha: "#{senha1}"}

	if @usuarioconectado[1][:senha] == @usuarios[indice][:senha]
		idpessoa = @usuarios[indice][:id]
		@usuarioconectado[1] = {usuario: resusua, senha: "#{senha1}", id: "#{idpessoa}"}
		puts @usuarioconectado[1]
		puts @usuarios[indice]
	end

	if @usuarioconectado[1] == @usuarios[indice]
		puts "Senha Correta"
		puts "Parabens #{resusua} Voce esta logado!"
		puts ""
		tela_inicial
	else
		for a in 1..3
			contagem = 4 -a
		   if @usuarioconectado[1] != @usuarios[indice]
			 puts ""
			 puts "Senha incorreta!"
			 puts "Voce tem #{contagem} tentativas para entrar na Conta!"
			 print "Insira a senha do Usuario #{resusua} --> "
			 senha1 = gets.chomp.to_i
			 idpessoa = @usuarios[indice][:id]
			 @usuarioconectado[1] = {usuario: resusua, senha: "#{senha1}", id: "#{idpessoa}"}
		   end
		    if @usuarioconectado[1] == @usuarios[indice]
				puts "Senha Correta"
				puts "Parabens #{resusua} Voce esta logado!"
				puts ""
				tela_inicial
				break
			end
		end
	end

end


def telefone
	loop do
		puts "----------------------------"
		puts "1. Contatos\n2. Adicionar Contato\n3. Ver Contato\n4. Editar Contato\n5. Remover Contato\n0. Voltar"
		puts "----------------------------"

		codigo = gets.chomp.to_i
	
		case
		when codigo == 0 
			sair_telefone
			break
		when codigo == 1
			todos_contatos
		when codigo == 2
			adicionar_contato
			puts "----------------------------"
			puts "Contato foi Adicionado"
			puts "----------------------------"
			puts
		when codigo == 3
			ver_contato
		when codigo == 4
			editar_contato
		when codigo == 5
			remover_contato
			puts "----------------------------"
			puts "Contato Removido com sucesso!"
			puts "----------------------------"
		else
			puts "Função nao existe, por favor use uma função valida!"
		end
	end
end

def criar_num
	a = rand(1..10000)
	idrandom = a
end

def criaçao_usuario
	puts ""
	puts "Vamos começar com seu usuario"
	print "Escolha um nome de usuario --> "
	novonome = gets.chomp.to_s
	while novonome.empty? == true
		puts "Você precisa escolher um nome!"
		print "coloque um nome para seu usuario --> "
		novonome = gets.chomp.to_s
		puts ""
	end
	puts""
	print "Agora escolha uma senha forte --> "
	novasenha = gets.chomp


    while novasenha.empty? == true
	    puts "Você precisa escolher uma senha"
		print "coloque uma senha para seu usuario --> "
		novasenha = gets.chomp
		puts ""
	end


	puts "Usuario adicionado"
	puts ""
	
	idrandom = "99999"

	@usuarios.each do |a|
		while a[:id] == idrandom
			idrandom = rand (1..100000)
		end
		
		if a[:id] != idrandom
			puts "é diferente"
			break
		end
	end

	@usuarioconectado[1] = {usuario:novonome, senha:"#{novasenha}", id:"#{idrandom}"}
	@usuarios << {usuario:novonome, senha:"#{novasenha}", id:"#{idrandom}"}
	tela_inicial
end
#------------------------------------------------------- Contas ----------------------------------------------------------------------------------------
def contas
	loop do
	  puts "----------------------------"
	  puts " 1. Contas\n 2. Opções de Administrador\n 3. Ver Administradores\n 4. Editar minha Conta\n 6. Apagar minha Conta\n 0. Voltar"
	  puts "----------------------------"
	  codigo = gets.chomp.to_i

	  case
	  when codigo == 1
		puts ""
		mostrar_contas
	  when codigo == 2
		puts ""
		opçoes_admin
	  when codigo == 3
		ver_admin
	  when codigo == 4
		puts ""
	  when codigo == 0
		puts ""
		puts "Voltando"
		break
	  end
	end
end

def opçoes_admin
	loop do
		puts " 1. Adicionar Nova Conta\n 2. Apagar Conta Existente\n 3. Editar Conta Existente\n 4.Voltar"
		codigo = gets.chomp.to_i

		case
		when codigo == 1
			adicionar_conta
		when codigo == 2
			apagar_conta
		when codigo == 4 
			break
		end
	end
end

def apagar_conta
	puts "---------------------------------------------------------"
	puts "Contas Existentes"
	@usuarios.each do |a|
		puts "#{a[:usuario]} -- #{a[:id]}"
	end
	puts "Qual Conta deseja apagar? (Coloque o nome do usuario)"
	puts "---------------------------------------------------------"
	res = gets.chomp

	indice = 
	@usuarios.each do |a|
		if a[:usuario] == res
			indice = @usuarios.index(a)
			print "Deseja mesmo apagar a conta #{res}? -->  "
			son = gets.chomp
			if son == "S"
				if @usuarios[indice] == @usuarioconectado[1]
					conta_apagada
				end
				@usuarios.delete_at(indice)
				puts "Conta Removida!"
				puts ""
				break
			elsif son == "N"
				puts "Voltando..."
				break
			end
		end
	end
end

def ver_admin 
	puts "Administradores"
	@administradores.each do |a|
		puts "#{a[:usuario]} | #{a[:id]}"
		puts ""
	print "Digite qualque coisa para sair -- >"
	gets
end
end

def adicionar_conta
	if @usuarioconectado[1] == @usuarios[0]
		print "Digite o nome de usuario --> "
		novonome = gets.chomp.to_s
		puts ""
		print "Agora digite a senha do usuario #{novonome}"
		novasenha = gets.chomp

		idrandom = rand(1..100000)
		@usuarios << {usuario: novonome, senha: "#{novasenha}", id:"#{idrandom}"}
		puts "Conta Adicionada!"
		print "Insira qualquer botam para sair.."
		gets
	else
		puts "Voce não tem permissão para isso."
		puts "Apenas o Pedro tem permissão para isso"
	end
end

def mostrar_contas
	puts "--------Contas no Sistema-------"
	puts "Nome   |   ID"
	@usuarios.each do |a|
		puts "#{a[:usuario]}  |  #{a[:id]}"
	end
	puts ""
	print "Digite qualque coisa para sair -- >"
	gets
end
5
def conta_apagada
	abort "Sua Conta foi apagada..."
end
#------------------------------------------------------- Contas ----------------------------------------------------------------------------------------
def tela_inicial
	loop do 
	   puts "|Conta Logada ✓| #{@usuarioconectado[1][:usuario]}"
	   puts
	   puts "---------------------------------------------"
	   puts " 1. Telefone\n 2. Camera\n 3. Bloco de Notas\n 4. Jogos\n 5 .Contas\n 6. Desligar"
	   puts "---------------------------------------------"
	   codigo = gets.chomp.to_i
	   puts ""
	   case
	   when codigo == 1
		puts ""
		telefone
	   when codigo == 5
		contas
	   when codigo == 6
		puts "Desligando.."
		break
	   end 
	end
end

def conectando_conta
	puts "🟪   -----------------------Ordep 1.0----------------------------🟪"
	puts ""
	puts "           Seja bem vindo ao Alpha do Ordep >P "
	print "          Você possui alguma conta? (S ou N) --> "
	puts ""
	puts ""
	puts "🟪------------------------------------------------------------🟪"
	res1 = gets.chomp
	
	if res1 == "S" 
		validaçao_usuario
	elsif res1 == "N"
		criaçao_usuario
	elsif
		while res1.empty? == true
			puts "Resposta Invalida!"
			print "S ou N --> "
			res1 = gets.chomp
			puts ""
			if res1 == "S"
				validaçao_usuario
			elsif res1 == "N"
				criaçao_usuario
			end
		end
	else
		while res1 != "S" && res1 != "N"
			puts "Resposta Invalida!"
			print "S ou N --> "
			res1 = gets.chomp
			if res1 == "S"
				validaçao_usuario
			elsif res1 == "N"
				criaçao_usuario
			end
		end
	end
end


