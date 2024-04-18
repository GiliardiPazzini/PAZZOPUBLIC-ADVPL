//NFESEFAZ.PRW
//Alertar usuários quando o destinatário não foi informado no cadastro do cliente ou quando o arry retornar vazio 
//Tag <dest>

Static Function NfeDest(aDest,cVerAmb,aTransp,aCST,lBrinde,cMunDest)
	Local cString		:= ""
	Local cMailTrans 	:= ""
	Local cFoneDest		:= ""
	Local cIndicador	:= ""

	Default cMunDest	:= ""

	cVerAmb	:= PARAMIXB[2]
	//Pazzini
	//cMunDest	:= iIf(!lBrinde,IIf(Len(aDest[07])>5,aDest[07],aUF[aScan(aUF,{|x| x[1] == aDest[09]})][02]+aDest[07]),SM0->M0_CODMUN)
	If !lBrinde
		If Len(aDest[07])>5
			cMunDest := aDest[07]
		ElseIf !EMPTY(aDest[09]) .AND. aUF[aScan(aUF,{|x| x[1] == aDest[09]})][02]+aDest[07] > 5
			cMunDest := aDest[09]+aDest[07]
		Else
			cMunDest := SM0->M0_CODMUN
			IF EMPTY(cMunDest)
				Alert('<b>Cadastro do cliente sem informações de destino !</b><br><br> - Verifique alterações no cadastro do cliente.';
				+'<br> - Verificar se existe NF Vinculada.<br><br><font color="#FF0000"><b>Tabela: AIF <br>Parametro: MV_HISTTAB</b></font>')                                       
				// Caso exista alterações no cadastro o sistema busca informações da nota vinculada.- aDestVinc[07]| aDestVinc[09] 
				//http://fly.nater.com.br/front/ticket.form.php?id=12120
			ENDIF
		EndIf
	EndIf
	//Pazzini

	cString := '<dest>'
	cString += '</dest>'

Return(cString)
