
#Include "Protheus.ch"
#Include "RwMake.ch"
#Include "TbiConn.ch"
#INCLUDE "TOTVS.CH"
#INCLUDE "TOPCONN.CH"

//Pazzini
User Function MT120APV()

Local ExpC1 := Nil
Local ExpC2 := Nil
Local cGrp := "" //Grupo de aprovação

Local aPergs     := {}
Local aRetorn    := {}
Local cLoad      := "00001"
Local lCanSave   := .T.
Local lUserSave  := .T.
Local cTitulo    := "GRUPO DE APROVADORES"
Local bOk        := {|| .T.}
Local aButtons   := {}
Local lCentered  := .T.
Local nPosx
Local nPosy
Local cMSG :=""
//local aCombo   := {"000001","000002","000003","000004","000005","000006","000007","000008","000009","000010","000011","000012","000013","000014","000015"}



/* Variável Privada */
Private cNewGRP    := Space(06)
//Private lIncluir 	:= .F.
//Private lAlterar 	:= .F.

/* Abro a empresa TESTE, caso faça uso via debug
Remover para utilizar dentro do Protheus*/
 // RpcSetEnv('99','01')
IF !IsBlind()  

    If  !Type("ALTERA") == "U"
        ALTERA := .F.
        INCLUIR := .T.
    Endif

    If !Type("INCLUIR") == "U"
        ALTERA := .T.
        INCLUIR := .F.
    Endif

    If (ALTERA .OR. INCLUIR ) == .T.
        If Type("PARAMIXB") == "U"
        
            IF EMPTY(cMSG)
                cMSG := AllTrim(cMSG) + "ALTERAR GRUPO DE APROVADORES ! " + chr(13)+chr(10)
                If !IsBlind()  
                    If MsgYesNo(cMSG + chr(13)+chr(10)+ "Deseja continuar?" )
                        lRet := .t.
                    Else
                        lRet := .F.
                        IF lRet == .F. .and. !IsBlind()  
                            Return(lRet)
                        EndIf 
                    EndIf
                EndIf

            EndIf
                /* Adiciono a pergunta do Parambox */
              //  aAdd(aPergs, {1, "NOVO GRUPO : " , cNewGRP  , aCombo[], ".T.", "", ".T.", 80, .F.})

                /* Se a pergunta for confirmada */
                //aAdd( aPergs ,{9,"Abaixo escolha uma opção",200, 40,.T.})                 
                //aAdd( aPergs ,{2,"Tipo 2 - Escolha:",01,aCombo,50,"",.T.})


               // aPergs := {}
                cPergs := "MT120APV01"

                Aadd(aPergs,{cPergs,"Grupo de aprovadores?","C",06,00,"G","","SAL","","","","","",""})

                U_Testasx1(cPergs,aPergs,.F.) 
                
                If ! Pergunte(cPergs,.T.)
                    Return(cGrp)
                EndIf

                If Empty(mv_par01)
                    Return(cGrp)
                EndIf
                
                cGrp := mv_par01
                MSGALERT( "Grupo alterado com sucesso ! ")
        Else
                ExpC1 := PARAMIXB[1]
                ExpC2 := PARAMIXB[2]

                //EXEMPLO 2 (Manipulando o saldo do pedido, na alteração do pedido):
                //Manipulando o saldo do pedido pelo usuário, conf. necessidade, atualizando a variável n120TotLib
                /*If ALTERA
                    MSGALERT( "ALTERAR no ponto MT120APV")
                Endif
                
                If INCLUIR
                    MSGALERT( "INCLUIR no ponto MT120APV")
                Endif
                */  
        EndIf

    EndIf 
       // MSGALERT( "Saindo do ponto de entrada MT120APV")
ENDIF

Return cGrp

