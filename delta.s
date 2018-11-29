# Calculo de DELTA - Abaixo codigo
#Main(){
#int a, b, c;
#Console.Write("Digite o a: ");
#a = int.Parse(Console.ReadLine());
#Console.Write("Digite o b: ");
#b = int.Parse(Console.ReadLine());
#Console.Write("Digite o c: ");
#c = int.Parse(Console.ReadLine());
#Console.WriteLine("O delta é: "+((b*b)-(4*a*c)));
#Console.ReadKey();}

	.data
coeficienteA: .space 4
coeficienteB: .space 4
coeficienteC: .space 4
MsgInicial: .asciiz "Este programa ira calcular o DELTA\n"
msgA: .asciiz "Digite o a: \n"
msgB: .asciiz "Digite o b: \n"
msgC: .asciiz "Digite o c: \n"
msgDELTA: .asciiz "O valor do DELTA: \n"

	.text
  #mensagem inicial
main:	li $v0,4
	la $a0,MsgInicial
	syscall

  #mensagem A
	la $a0,msgA
	syscall

  #lendo o valor de a informado pelo usuario
	li $v0,5
	syscall
	sw $v0,coeficienteA($zero) 

  #mensagem B
	li $v0,4
	la $a0,msgB
	syscall

  #lendo o valor de b informad pelo usuario
	li $v0,5
	syscall	
	sw $v0,coeficienteB($zero)  

  #mensagem C
	li $v0,4
	la $a0,msgC
	syscall

  #lendo o valor de c informado pelo usuario
	li $v0,5
	syscall	
	sw $v0,coeficienteC($zero)

  #mensagem delta
 	li $v0,4
	la $a0,msgDELTA
	syscall 

  #jogando os valores salvos em registradoes
	lw $s0,coeficienteA($zero)
	lw $s1,coeficienteB($zero)
	lw $s2,coeficienteC($zero)	

  #chamando a funcao Delta e armanezando o valor do retorno
	mul $t0,$s1,$s1 	 #b elevado ao quadrado
	mul $t1,$s0,$s2		 #a multiplicando c
	addi $t3,$zero,4 	 #jogando valor de 4 no registrador
	mul $t2,$t1,$t3 	 #multiplicando 4 com o resultado de a vezes c
	sub $a0,$t0,$t2		 #b subtraido com os valor de 4 a e c multiplicados
				
  #exibindo o delta
	li $v0,1
 	syscall	
	jr $ra



	