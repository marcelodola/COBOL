$SET PRTLIBC85

 IDENTIFICATION DIVISION.

 PROGRAM-ID.     S0947-OBJ-656.

 AUTHOR.         ANALISE.......  SIMONE MENEZES.
                 PROGRAMACAO...  MARCELO DOLABELLA.

 INSTALLATION.   UNISYS - BELO HORIZONTE - M.G.

 DATE-WRITTEN.   JULHO/2019.

 DATE-COMPILED.

*----------------------------------------------------------------*
*                       RELATORIO MAC/MEX                        *
*----------------------------------------------------------------*

 ENVIRONMENT DIVISION.

 CONFIGURATION SECTION.

 SOURCE-COMPUTER.    A15.
 OBJECT-COMPUTER.    A15.
 SPECIAL-NAMES.      DECIMAL-POINT   IS  COMMA.


*INPUT-OUTPUT SECTION.

*FILE-CONTROL.

 DATA DIVISION.

*FILE SECTION.

 DATA-BASE SECTION.

 DB  BDSEGURANCA OF  BDDATAMEC.

 WORKING-STORAGE SECTION.

 01 SV-AREA-REL.
    COPY "(D0947F05)S0947/LIB/SRV/V094765601 ON PROJETO01".

 01  CLI-JANELA-SEG-WS           PIC 9(04).
 01  CLI-JANELA-FUN              PIC 9(04).

 77  RESULTADO-77                PIC S9(11)  BINARY EXTENDED.
 77  PROGRAMA-DESIGNATOR-77      REAL.
 77  AGENDA-INPUT-77             REAL.
 77  AGENDA-DESTINO-77           REAL.
 77  WINDOW-DESIGNATOR-77        REAL.
 77  ESTACAO-REAL-77             REAL.
 77  STATION-DESIG-77            PIC S9(11)  BINARY.
 77  STATION-DEVICE-77           PIC S9(11)  BINARY.
 77  STATION-LSN-77              PIC S9(11)  BINARY.
 77  STATION-SEC-77              PIC S9(11)  BINARY.
 77  IND-SEC-GLOBAL-77           PIC 9(02).
 77  CODIGO-INFORMACAO-77        PIC S9(11) BINARY EXTENDED.
 77  ENVIA-TELA-77               PIC S9(11)  BINARY EXTENDED.

 01 VARIAVEIS.
   02 TAB-SISTEMA-FLAG.
      03  TAB-SISTEMA-OK              PIC 9(1) OCCURS 10000.
   02  FLAG-MAC-SEC              PIC X(1).
   02  FLAG-MEX                  PIC X(1).
   02  TIPO-CODIGO-SEC-WS        PIC X(3).
   02  IND-FUNC-WS               PIC X(1).
   02  UNO-CODIGO-SEC-WS         PIC 9(04).
   02  FCO-CODIGO-SEC-WS         PIC 9(04).
   02  TAMANHO-AREA-WS           PIC 9(05).
   02  SIS-CODIGO-WS             PIC 9(04).
   02  GOP-CODIGO-WS             PIC 9(04).
   02  PER-CODIGO-WS             PIC 9(04).
   02  UNO-CODIGO-WS             PIC 9(04).
   02  FCO-CODIGO-WS             PIC 9(04).
   02  RESULTADO-WS                PIC S9(11)  BINARY.
   02  MENSAGEM-WS                 PIC X(160).
   02  AGENDA-NOME-WS              PIC X(17).
   02  TELA-MENSAGEM-WS.
     03  FILLER                  PIC 9(12)   COMP    VALUE
         @27E7277F4FF6@.
     03  LINHA-MENSAGEM-WS       PIC X(169).
     03  FILLER                  PIC 9(06)   COMP    VALUE
         @27E603@.

   02  IDENTIFICADOR-GETINFO.
     03  TAMANHO-GETINFO         PIC 9(04).
     03  CONTEUDO-GETINFO        PIC X(80).
     03  CONTEUDO-GETINFO-R1  REDEFINES  CONTEUDO-GETINFO.
         05  IND-SECULO-GETINFO  PIC 9(02).
         05  RESTO-GETINFO       PIC X(78).

   02 WS-CONT-GRUPOS                  PIC 9(03).
   02 WS-CONT-PERFIL                  PIC 9(03).
   02 WS-UNO-CODIGO                   PIC X(07).
   02 VERSAO-SEG-WS                   PIC 9(01).
   02 COD-FUNCAO-AUX                  PIC 9(04).
* CODIGO USUARIO
   02  USU-CODIGO-WS                   PIC X(07).
   02  USU-CODIGO-WS-RE REDEFINES USU-CODIGO-WS.
      03  USU-LETRA-WS                PIC X(01).
      03  USU-RESTO-WS                PIC X(06).
* CODIGO USUARIO
   02  WS-DATA-INT-EXC.
      03 WS-SEC-EXC               PIC 9(02) COMP.
      03 WS-ANO-EXC               PIC 9(02) COMP.
      03 WS-MES-EXC               PIC 9(02) COMP.
      03 WS-DIA-EXC               PIC 9(02) COMP.
*  DATA SISTEMA
   02 DATA-ACCEPT            PIC 9(06)     COMP.
   02 DATA-ACCEPTR REDEFINES DATA-ACCEPT   COMP.
      03 ANO-ACCEPT          PIC 9(02)     COMP.
      03 MES-ACCEPT          PIC 9(02)     COMP.
      03 DIA-ACCEPT          PIC 9(02)     COMP.

   02 DATA-SISTEMA           PIC 9(08)      COMP.
   02 DATA-SISTEMAR  REDEFINES DATA-SISTEMA COMP.
      03 SEC-SISTEMA         PIC 9(02)      COMP.
      03 ANO-SISTEMA         PIC 9(02)      COMP.
      03 MES-SISTEMA         PIC 9(02)      COMP.
      03 DIA-SISTEMA         PIC 9(02)      COMP.

*----------------------------------------------------------------*
*   AREA COM OPCOES E INFORMACOES DE ENTRADA E SAIDA             *
*   PARA A LIBRARY DE TRATAMENTO DE EXCECAO DMS                  *
*----------------------------------------------------------------*

 01  DMS-PARAMETROS-WS                                   COMMON.

*    -----  PARAMETROS DE ENTRADA  -----

     03  DMS-INTERFACE-COMS-WS       PIC X(01).
     03  DMS-TITLEBD-WS              PIC X(60).
     03  DMS-RESULT-WS               PIC X(06).
     03  DMS-PROG-ONLINE-WS          PIC X(01).

*    -----  PARAMETROS DE SAIDA  -----

     03  DMS-ACAO-TOMAR-WS           PIC 9(01).
     88  DMS-CONTINUAR               VALUE   01.
     88  DMS-ENCERRAR                VALUE   02.
     88  DMS-ATIVAR-DMTERMINATE      VALUE   03.

*----------------------------------------------------------------*
* VALORES ASSUMIDOS PELOS CAMPOS DO HEADER E USADOS NO PROGRAMA  *
*----------------------------------------------------------------*

 01 VALORES-STATUSVALUE-IN USAGE BINARY.
    03 FINALIZAR                    PIC S9(11) BINARY VALUE 99.

 01  VALORES-STATUSVALUE-OUT       USAGE BINARY.
     03  SEND-SEM-ERRO             PIC S9(11) BINARY VALUE 00.

*---------------------------------------------------------------*
*       CAMPOS DO HEADER PARA PASSAGEM DE PARAMETROS            *
*---------------------------------------------------------------*

 01  ARRAY-IN-WS                     USAGE REAL COMMON    .
     03 PROGRAMDESG-WS               REAL                 .
     03 FUNCTIONINDEX-WS             REAL                 .
     03 USERCODE-WS                  REAL                 .
     03 SECURITYDESG-WS              REAL                 .
     03 FIELDS-WS                    REAL                 .
     03 TIMESTAMP-WS                 REAL                 .
     03 STATION-WS                   REAL                 .
     03 TEXTLENGTH-WS                REAL                 .
     03 FILLER-WS                    REAL                 .
     03 STATUSVALUE-WS               REAL                 .
     03 RESTART-WS                   REAL                 .
     03 AGENDA-WS                    REAL                 .
     03 SDFINFO-WS                   REAL                 .
     03 FORM-KEY-WS                  REAL                 .
     03 SDFTRANSNUM-WS               REAL                 .
     03 SDFFORMRECNUM-WS             REAL                 .

*----------------------------------------------------------------*
* DECLARACAO DE AREAS QUE IRAO RECEBER/FORNECER MSD DO/PARA COMS.*
* O PROGRAMA RECEBE A MENSAGEM NA AREA "AREA-IN-WS", DEPOIS MOVE *
* ESTA AREA PARA A AREA DE TELA GERADA PELO SDF.                 *
******************************************************************

* 01  AREA-IN-WS                      PIC X(28224)         COMMON.

*----------------------------------------------------------------*
*    AREA AUXILIAR.                                              *
*----------------------------------------------------------------*

** 01  FML-SISEG       FROM    DICTIONARY.

*- LIBRARY COM OS DADOS OBRIGATORIOS PARA EXECUCAO DO PRG. COMS --

 COMMUNICATION   SECTION.

*----------------------------------------------------------------*
*                                                                *
* DECLARACAO INPUT E OUTPUT HEADER USADOS PELO COMS.             *
*                                                                *
*----------------------------------------------------------------*

 INPUT HEADER COMS-IN
     CONVERSATION AREA.
     02 CONVERSATION-AREA    REAL.
        03 FORM-KEY-IN       REAL.
* OUTPUT HEADER COMS-OUT
*     CONVERSATION AREA.
*     02 CONVERSATION-AREA.
*        03 FORM-KEY-OUT      REAL.
*        03 PAGINADOR-OUT     REAL.
  OUTPUT HEADER COMS-OUT
  CONVERSATION AREA.
  02 CONVERSATION-AREA.
     03 FORM-KEY-OUT      REAL.
     03 PAGINADOR-OUT     PIC S9(11) BINARY EXTENDED.
     03 AGENDA-OUT        REAL.
     03 FUNCTIONINDEX-OUT REAL.

******************************************************************
*                                                                *
*              CORPO PRINCIPAL DO PROGRAMA                       *
*                                                                *
******************************************************************

 PROCEDURE DIVISION.

 0001-00-PROGRAMA    SECTION.

 0002-00-INICIO-TRATA-RELATORIO.

     CHANGE ATTRIBUTE LIBACCESS OF "DCILIBRARY" TO BYFUNCTION.
*
     CHANGE ATTRIBUTE FUNCTIONNAME OF "DCILIBRARY" TO
                                      "COMSSUPPORT".
*
     ENABLE INPUT COMS-IN KEY "ONLINE".
*
     MOVE    PROGRAMDESG OF COMS-IN  TO  PROGRAMA-DESIGNATOR-77.
     MOVE    "A_S094765601"          TO  AGENDA-NOME-WS.
*
     CALL   "INICIALIZA_HOST_COMS OF S0997/OBJ/LIBRARY/INSTALACAO"
             USING   AGENDA-NOME-WS
                     PROGRAMA-DESIGNATOR-77
                     AGENDA-DESTINO-77
                     AGENDA-INPUT-77
                     WINDOW-DESIGNATOR-77
                     MENSAGEM-WS
             GIVING  RESULTADO-77.
*
     IF  RESULTADO-77    =  00
         MOVE    "BANCO-BDDATAMEC-<HOST>-<USERCODE>" TO
                 IDENTIFICADOR-GETINFO
         CALL    "GET_INSTALLATION_INFO OF S0997/OBJ/SLIBRARIES"
                 USING IDENTIFICADOR-GETINFO
                 GIVING RESULTADO-77.


    IF  RESULTADO-77    NOT =   0
             MOVE    "*** ERRO NA OBTENCAO DO TITULO DO BANCO"
                                      TO MENSAGEM-WS
             MOVE 1                   TO DESTCOUNT   OF COMS-OUT
             MOVE 0                   TO STATUSVALUE OF COMS-OUT
             MOVE 178                 TO TEXTLENGTH  OF COMS-OUT
             MOVE STATION OF COMS-IN  TO
                                      DESTINATIONDESG OF COMS-OUT
             MOVE MENSAGEM-WS         TO      LINHA-MENSAGEM-WS
             SEND COMS-OUT            FROM    TELA-MENSAGEM-WS
             GO TO 99900-00-ULTIMO-PARAGRAFO.

     CHANGE ATTRIBUTE TITLE OF BDSEGURANCA  TO CONTEUDO-GETINFO.

     OPEN INQUIRY BDSEGURANCA.

  003-INICIO-REL.

     INITIALIZE VARIAVEIS.

     ACCEPT DATA-ACCEPT FROM DATE.
     MOVE DIA-ACCEPT TO DIA-SISTEMA.
     MOVE MES-ACCEPT TO MES-SISTEMA.
     MOVE ANO-ACCEPT TO ANO-SISTEMA.
     MOVE 20         TO SEC-SISTEMA.

     INITIALIZE SV-AREA-REL.

     RECEIVE COMS-IN MESSAGE INTO SV-AREA-REL.
     IF STATUSVALUE OF COMS-IN = FINALIZAR
        STOP RUN.

     MOVE STATION OF COMS-IN TO ESTACAO-REAL-77.
     MOVE 12 TO CODIGO-INFORMACAO-77.
     CALL
       "SEG_OBTEM_INFORMACOES OF S0997/OBJ/LIBRARY/SEGURANCA/NOVA"
           USING ESTACAO-REAL-77
           CODIGO-INFORMACAO-77
           CLI-JANELA-SEG-WS
           GIVING RESULTADO-77.

     MOVE SPACES TO MENSAGEM OF SV-AREA-REL
           MENSAGEM-RESULTADO OF SV-AREA-REL.

     PERFORM 0100-IDENTIFICA-USU
        THRU 0100-IDENTIFICA-USU-FIM.

     PERFORM 0110-MAC-ORIGINAL
        THRU 0110-MAC-ORIGINAL-FIM.

     PERFORM 0120-MAC-SECUNDARIA
        THRU 0120-MAC-SECUNDARIA-FIM.

     PERFORM 0130-MEX
        THRU 0130-MEX-FIM.

*     IF MENSAGEM OF SV-AREA-REL NOT EQUAL SPACES
*      IF CONT-GRUPOS OF SV-AREA-REL = 0
*       AND CONT-PERFIL OF SV-AREA-REL = 0
*         MOVE 1 TO CODIGO-RESULTADO OF SV-AREA-REL.

*      DISPLAY "CONT-GRUPOS:" CONT-GRUPOS OF SV-AREA-REL.
*      DISPLAY "CON-PERFUL: " CONT-PERFIL OF SV-AREA-REL.
*      DISPLAY "COD-RESULT: " CODIGO-RESULTADO OF SV-AREA-REL.

     GO TO 003-INICIO-REL.
*   STOP RUN.
  003-FIM-REL.
     EXIT.

******************************************************************
*    PROCESSAMENTO IDENTIFICA PARAMETROS DO USUARIO              *
******************************************************************

  0100-IDENTIFICA-USU .
/* MOVIMENTACAO DO CODIGO USUARIO PARA VAR-AUX
        MOVE USU-CODIGO OF SV-AREA-REL TO USU-CODIGO-WS.
/* VALIDACAO DO USUARIO NA USUARIO-CLI
        PERFORM 0200-ACESSO-USUARIOS-CLI
           THRU 0210-ACESSO-USUARIOS-CLI-FIM.

        PERFORM 0250-VERIFICA-FIS-SUB
           THRU 0250-VERIFICA-FIS-SUB-FIM.

        PERFORM 0240-VERIFICA-MEX
           THRU 0240-VERIFICA-MEX-FIM.

  0100-IDENTIFICA-USU-FIM.
     EXIT.

******************************************************************
*    PROCESSAMENTO DA MAC ORIGINAL                               *
******************************************************************

  0110-MAC-ORIGINAL.
/*BUSCA LOTACAO

        MOVE "ORI" TO TIPO-AREA OF SV-AREA-REL.
        MOVE "S" TO FLAG-FIM-AREA OF SV-AREA-REL.

        IF FLAG-MAC-SEC = "S" OR FLAG-MEX = "S"
           MOVE "N" TO FLAG-FIM-AREA OF SV-AREA-REL
        END-IF.
**********************************************************
*        MOVE "S" TO FLAG-FIM-AREA OF SV-AREA-REL.
**********************************************************
        MOVE UNO-CODIGO-ORI OF USUARIO-CLI TO UNO-CODIGO-WS.
        MOVE FCO-CODIGO-ORI OF USUARIO-CLI TO FCO-CODIGO-WS.

        PERFORM 0300-BUSCA-TIPO-LOTACAO
           THRU 0310-BUSCA-TIPO-LOTACAO-FIM.

*BG240414 - D550134I
       IF IND-FUNC-WS EQUAL "S"
         PERFORM 0400-BUSCA-TIPO-FUNCAO
            THRU 0410-BUSCA-TIPO-FUNCAO-FIM
       ELSE
         MOVE TIF-CODIGO OF USUARIO-CLI TO FCO-CODIGO-WS
         PERFORM 0400-BUSCA-TIP-FUN-USU-N-CEF
            THRU 0410-FIM-TIP-FUN-USU-N-CEF-FIM.
*BG240414 - D550134F

        PERFORM 0500-ACESSO-MATRIZ-GRUPO
           THRU 0500-ACESSO-MATRIZ-GRUPO-FIM.

        PERFORM 0600-MONTA-PERFIL
           THRU 0600-MONTA-PERFIL-FIM.

        COMPUTE TAMANHO-AREA-WS =
             FUNCTION LENGTH(AREA-HEADER) +
             FUNCTION LENGTH(AREA-PARAMETROS) +
             FUNCTION LENGTH(AREA-APLICATIVO) +
             FUNCTION LENGTH(TAB-GRUPOS(1)) * CONT-GRUPOS.

        IF CONT-GRUPOS OF SV-AREA-REL = 0
            AND CONT-PERFIL OF SV-AREA-REL = 0
               MOVE 1 TO CODIGO-RESULTADO OF SV-AREA-REL.

        PERFORM 0100-00-ENVIA-TELA
           THRU 0100-00-ENVIA-TELA-FIM.

  0110-MAC-ORIGINAL-FIM.
       EXIT.

******************************************************************
*    PROCESSAMENTO DA MAC TEMPORARIA/SUBSTITUTA                  *
******************************************************************

  0120-MAC-SECUNDARIA.

        IF FLAG-MAC-SEC = "N"
           GO TO 0120-MAC-SECUNDARIA-FIM.

        IF FLAG-MEX = "S"
           MOVE "N" TO FLAG-FIM-AREA OF SV-AREA-REL
        ELSE
           MOVE "S" TO FLAG-FIM-AREA OF SV-AREA-REL
        END-IF.

*D550134 - BG240415 - INICIO VALIDADE SUBSTITUICAO
     MOVE USC-SEC-INI-SUBST OF USUARIO-CLI
                          TO SEC-VALI-INI OF SV-AREA-REL.
     MOVE USC-ANO-INI-SUBST OF USUARIO-CLI
                          TO ANO-VALI-INI OF SV-AREA-REL.
     MOVE USC-MES-INI-SUBST OF USUARIO-CLI
                          TO MES-VALI-INI OF SV-AREA-REL.
     MOVE USC-DIA-INI-SUBST OF USUARIO-CLI
                          TO DIA-VALI-INI OF SV-AREA-REL.
*D550134 - BG240415

        MOVE USC-SEC-FIM-SUBST OF USUARIO-CLI
                               TO SEC-VALIDADE OF SV-AREA-REL.
        MOVE USC-ANO-FIM-SUBST OF USUARIO-CLI
                               TO ANO-VALIDADE OF SV-AREA-REL.
        MOVE USC-MES-FIM-SUBST OF USUARIO-CLI
                               TO MES-VALIDADE OF SV-AREA-REL.
        MOVE USC-DIA-FIM-SUBST OF USUARIO-CLI
                               TO DIA-VALIDADE OF SV-AREA-REL.

        MOVE TIPO-CODIGO-SEC-WS TO TIPO-AREA OF SV-AREA-REL.

        MOVE UNO-CODIGO-SEC-WS TO UNO-CODIGO-WS.
        MOVE FCO-CODIGO-SEC-WS TO FCO-CODIGO-WS.

        PERFORM 0300-BUSCA-TIPO-LOTACAO
               THRU 0310-BUSCA-TIPO-LOTACAO-FIM.

        PERFORM 0400-BUSCA-TIPO-FUNCAO
               THRU 0410-BUSCA-TIPO-FUNCAO-FIM.

        PERFORM 0500-ACESSO-MATRIZ-GRUPO
              THRU 0500-ACESSO-MATRIZ-GRUPO-FIM.

        PERFORM 0600-MONTA-PERFIL
           THRU 0600-MONTA-PERFIL-FIM.

        COMPUTE TAMANHO-AREA-WS =
             FUNCTION LENGTH(AREA-HEADER) +
             FUNCTION LENGTH(AREA-PARAMETROS) +
             FUNCTION LENGTH(AREA-APLICATIVO) +
             FUNCTION LENGTH(TAB-GRUPOS(1)) * CONT-GRUPOS.

        IF CONT-GRUPOS OF SV-AREA-REL = 0
            AND CONT-PERFIL OF SV-AREA-REL = 0
               MOVE 1 TO CODIGO-RESULTADO OF SV-AREA-REL.

        PERFORM 0100-00-ENVIA-TELA
           THRU 0100-00-ENVIA-TELA-FIM.

  0120-MAC-SECUNDARIA-FIM.
       EXIT.

******************************************************************
*    PROCESSAMENTO DA MAC DE EXCECAO                             *
******************************************************************

  0130-MEX.

        IF FLAG-MEX = "N"
           GO TO 0130-MEX-FIM.

        MOVE "S" TO FLAG-FIM-AREA OF SV-AREA-REL.
        MOVE "MEX" TO TIPO-AREA OF SV-AREA-REL.

        PERFORM 0700-MONTA-MEX
           THRU 0700-MONTA-MEX-FIM

        PERFORM 0730-MONTA-PERFIL
           THRU 0730-MONTA-PERFIL-FIM.

        COMPUTE TAMANHO-AREA-WS =
             FUNCTION LENGTH(AREA-HEADER) +
             FUNCTION LENGTH(AREA-PARAMETROS) +
             FUNCTION LENGTH(AREA-APLICATIVO) +
             FUNCTION LENGTH(TAB-GRUPOS(1)) * CONT-GRUPOS.

        IF CONT-GRUPOS OF SV-AREA-REL = 0
            AND CONT-PERFIL OF SV-AREA-REL = 0
               MOVE 1 TO CODIGO-RESULTADO OF SV-AREA-REL.

        PERFORM 0100-00-ENVIA-TELA
           THRU 0100-00-ENVIA-TELA-FIM.

  0130-MEX-FIM.
       EXIT.

******************************************************************
*    ENVIO DAS INFORMACOES DE RESPOSTA                           *
******************************************************************

   0100-00-ENVIA-TELA.

     MOVE 1                    TO DESTCOUNT OF COMS-OUT.
     MOVE AGENDA OF COMS-IN    TO AGENDA-OUT OF COMS-OUT.
     MOVE STATION OF COMS-IN   TO DESTINATIONDESG OF COMS-OUT.
     MOVE FUNCTIONINDEX        OF COMS-IN
     TO   FUNCTIONINDEX-OUT    OF COMS-OUT.
     MOVE TAMANHO-AREA-WS      TO TEXTLENGTH OF COMS-OUT.

     MOVE ZEROS TO FORM-KEY-OUT.

     SEND COMS-OUT FROM SV-AREA-REL.

     IF  STATUSVALUE OF COMS-OUT NOT = ZEROS
         MOVE STATUSVALUE      OF COMS-OUT TO RESULTADO-77
         MOVE FORM-KEY-IN      OF COMS-IN TO FORM-KEY-WS
         MOVE SDFINFO          OF COMS-IN TO SDFINFO-WS
         MOVE PROGRAMDESG      OF COMS-IN TO PROGRAMDESG-WS
         MOVE FUNCTIONINDEX    OF COMS-IN TO FUNCTIONINDEX-WS
         MOVE USERCODE         OF COMS-IN TO USERCODE-WS
         MOVE SECURITYDESG     OF COMS-IN TO SECURITYDESG-WS
         MOVE TIMESTAMP        OF COMS-IN TO TIMESTAMP-WS
         MOVE STATION          OF COMS-IN TO STATION-WS
         MOVE TEXTLENGTH       OF COMS-IN TO TEXTLENGTH-WS
         MOVE STATUSVALUE      OF COMS-IN TO STATUSVALUE-WS
         MOVE RESTART          OF COMS-IN TO RESTART-WS
         MOVE AGENDA           OF COMS-IN TO AGENDA-WS
         CALL   "TRATA_ERRO_SAIDA OF S0997/OBJ/LIBRARY/INSTALACAO"
                 USING   ARRAY-IN-WS
                         PROGRAMA-DESIGNATOR-77
                         RESULTADO-77.

   0100-00-ENVIA-TELA-FIM.
      EXIT.

*****************************************************************
*                                                               *
*           INICIO PROCESSAMENTO - RELATORIO MAC/MEX            *
*                                                               *
*****************************************************************

 0200-ACESSO-USUARIOS-CLI.
*  FIND PARA COMPARAR DATA DO SISTEMA COM USC-DATA-INI-SUBST

       FIND FIRST USC-POR-USUARIO AT
          CLI-CODIGO = CLI-JANELA-SEG-WS AND
          USU-CODIGO = USU-CODIGO OF SV-AREA-REL
          ON EXCEPTION
              IF DMSTATUS(NOTFOUND)
                 MOVE "Usuario nao possui MAC." TO
                 MENSAGEM OF SV-AREA-REL
              ELSE
                 PERFORM 10000-00-TRATA-ERRO-DMS
                     THRU 10000-99-TRATA-ERRO-DMS
              GO TO 0210-ACESSO-USUARIOS-CLI-FIM
              END-IF
       END-FIND.

*BG240414 - D550134I

       MOVE "S" TO IND-FUNC-WS.
** se janela 103 mover pra 102
       IF CLI-JANELA-SEG-WS EQUAL 103
          MOVE 102 TO CLI-JANELA-FUN
       ELSE
          MOVE CLI-JANELA-SEG-WS TO CLI-JANELA-FUN.

       FIND FIRST FUN-POR-IDENT AT
          FUN-CLIENTE = CLI-JANELA-FUN  AND
          FUN-CODIGO = USU-CODIGO OF SV-AREA-REL
          ON EXCEPTION
            IF DMSTATUS(NOTFOUND)
               MOVE "N" TO IND-FUNC-WS
               MOVE "Usuario nao e funcionario." TO
                 MENSAGEM OF SV-AREA-REL
            ELSE
                 PERFORM 10000-00-TRATA-ERRO-DMS
                     THRU 10000-99-TRATA-ERRO-DMS
            END-IF
            GO TO 0210-ACESSO-USUARIOS-CLI-FIM
       END-FIND.

*BG240414 - D550134F


  0210-ACESSO-USUARIOS-CLI-FIM.
      EXIT.


  0240-VERIFICA-MEX.

     MOVE "N" TO FLAG-MEX.

     IF USC-SEC-FIM-EXC EQUAL ZEROS
        GO TO 0240-VERIFICA-MEX-FIM.

     IF DATA-SISTEMAR < USC-DATA-INI-EXC OF USUARIO-CLI
        GO TO 0240-VERIFICA-MEX-FIM.

     IF DATA-SISTEMAR > USC-DATA-FIM-EXC OF USUARIO-CLI
        GO TO 0240-VERIFICA-MEX-FIM.

     MOVE "S" TO FLAG-MEX.

  0240-VERIFICA-MEX-FIM.
     EXIT.

  0250-VERIFICA-FIS-SUB.
**VERIFICA TIPO USUARIO E UNO-CODIGO

   MOVE "N" TO FLAG-MAC-SEC.

   IF USU-LETRA-WS NOT EQUAL "C"
      GO TO 0250-VERIFICA-FIS-SUB-FIM.

   IF UNO-CODIGO-SUB OF USUARIO-CLI NOT EQUAL ZEROS AND
      DATA-SISTEMAR >= USC-DATA-INI-SUBST OF USUARIO-CLI AND
      DATA-SISTEMAR <= USC-DATA-FIM-SUBST OF USUARIO-CLI THEN

      MOVE UNO-CODIGO-SUB OF USUARIO-CLI TO UNO-CODIGO-SEC-WS
      MOVE FCO-CODIGO-SUB OF USUARIO-CLI TO FCO-CODIGO-SEC-WS
      MOVE "S" TO FLAG-MAC-SEC
      MOVE "SUB" TO TIPO-CODIGO-SEC-WS
      GO TO 0250-VERIFICA-FIS-SUB-FIM
    END-IF.

   IF UNO-CODIGO-FIS OF USUARIO-CLI NOT EQUAL ZEROS THEN
     MOVE UNO-CODIGO-FIS OF USUARIO-CLI TO UNO-CODIGO-SEC-WS
     MOVE FCO-CODIGO-FIS OF USUARIO-CLI TO FCO-CODIGO-SEC-WS
     MOVE "S" TO FLAG-MAC-SEC
     MOVE "FIS" TO TIPO-CODIGO-SEC-WS
   END-IF.

 0250-VERIFICA-FIS-SUB-FIM.
   EXIT.

**VERIFICA TIPO USUARIO E UNO-CODIGO

 0300-BUSCA-TIPO-LOTACAO.

**PROCURA LOT-CODIGO
   FIND UNL-POR-UNO AT
         CLI-CODIGO = CLI-JANELA-SEG-WS AND
         UNO-CODIGO = UNO-CODIGO-WS
         ON EXCEPTION
            IF NOT DMSTATUS (NOTFOUND) THEN
               PERFORM 10000-00-TRATA-ERRO-DMS
                  THRU 10000-99-TRATA-ERRO-DMS
            ELSE
               MOVE "Tipo de Lotacao nao cadastrada." TO
                 MENSAGEM OF SV-AREA-REL
            END-IF
            GO TO 0310-BUSCA-TIPO-LOTACAO-FIM
    END-FIND.
**PROCURA LOT-CODIGO

**MOVE LOT-CODIGO
    MOVE LOT-CODIGO OF UNO-LOTACAO
      TO LOT-CODIGO OF SV-AREA-REL.

  0310-BUSCA-TIPO-LOTACAO-FIM.
  EXIT.

  0400-BUSCA-TIPO-FUNCAO.

**PROCURA TIF-CODIGO

    FIND FIRST FCO-POR-CODIGO AT
           CLI-CODIGO   =  CLI-JANELA-SEG-WS AND
           FCO-CODIGO   =  FCO-CODIGO-WS
           ON EXCEPTION
              IF DMSTATUS (NOTFOUND)
                 MOVE "Tipo de Funcao nao cadastrada."
                   TO MENSAGEM OF SV-AREA-REL
                 MOVE 1 TO RESULTADO-77
              ELSE
                 PERFORM 10000-00-TRATA-ERRO-DMS
                    THRU 10000-99-TRATA-ERRO-DMS
              END-IF
              GO TO 0410-BUSCA-TIPO-FUNCAO-FIM
      END-FIND.
**PROCURA TIF-CODIGO
**MOVE TIF-CODIGO
      MOVE TIF-CODIGO OF FUNCAO
         TO TIF-CODIGO OF SV-AREA-REL.

****** MOVE FCO-CODIGO OF FUNCAO
*******  TO FCO-CODIGO OF SV-AREA-REL.

**MOVE TIF-CODIGO
  0410-BUSCA-TIPO-FUNCAO-FIM.
  EXIT.

  0400-BUSCA-TIP-FUN-USU-N-CEF.

**PROCURA TIF-CODIGO
*TIF-CODIGO SUBSET KEYS CLI-CODIGO, TIF-CODIGO
    FIND FIRST TIF-POR-CODIGO AT
           CLI-CODIGO   =  CLI-JANELA-SEG-WS AND
           TIF-CODIGO   =  FCO-CODIGO-WS
           ON EXCEPTION
              IF DMSTATUS (NOTFOUND)
                 MOVE "Tipo de Funcao nao cadastrada."
                   TO MENSAGEM OF SV-AREA-REL
                 MOVE 1 TO RESULTADO-77
              ELSE
                 PERFORM 10000-00-TRATA-ERRO-DMS
                    THRU 10000-99-TRATA-ERRO-DMS
              END-IF
              GO TO 0410-FIM-TIP-FUN-USU-N-CEF-FIM
      END-FIND.
**PROCURA TIF-CODIGO
**MOVE TIF-CODIGO
      MOVE TIF-CODIGO OF TIPO-FUNCAO
         TO TIF-CODIGO OF SV-AREA-REL.

**MOVE TIF-CODIGO
  0410-FIM-TIP-FUN-USU-N-CEF-FIM.
  EXIT.

****************************************************************
*                                                              *
*                        MONTAGEM MAC                          *
*                                                              *
****************************************************************
****************************************************************
***                      GRUPO MAC                           ***
****************************************************************
  0500-ACESSO-MATRIZ-GRUPO.
* PROCURAR MATRIZ PELA LOTACAO
    SET MGR-POR-LOTAC TO BEGINNING.
    SET SIS-POR-CODIGO TO BEGINNING.

    MOVE ZEROS TO CONT-GRUPOS OF SV-AREA-REL.
  0501-MONTA-MATRIZ-GRUPO.
    FIND KEY OF NEXT MGR-POR-LOTAC AT
         CLI-CODIGO = CLI-JANELA-SEG-WS AND
         LOT-CODIGO = LOT-CODIGO  OF SV-AREA-REL    AND
         TIF-CODIGO = TIF-CODIGO  OF SV-AREA-REL
         ON EXCEPTION
            IF NOT DMSTATUS(NOTFOUND)
               PERFORM 10000-00-TRATA-ERRO-DMS
                  THRU 10000-99-TRATA-ERRO-DMS
            ELSE
               MOVE "Usuario nao possui matriz de acesso." TO
                 MENSAGEM OF SV-AREA-REL
            END-IF
            GO TO 0500-ACESSO-MATRIZ-GRUPO-FIM
    END-FIND.

    MOVE GOP-CODIGO OF MATRIZ-GRUPO TO GOP-CODIGO-WS.
    MOVE SIS-CODIGO OF MATRIZ-GRUPO TO SIS-CODIGO-WS.

    IF CONT-SISTEMA = 0
      PERFORM 0520-MONTA-SISTEMA THRU 0545-MONTA-SISTEMA-FIM.

    IF SIS-CODIGO OF TAB-SISTEMA(CONT-SISTEMA)
                        NOT EQUAL SIS-CODIGO OF MATRIZ-GRUPO
      PERFORM 0520-MONTA-SISTEMA THRU 0545-MONTA-SISTEMA-FIM.

    PERFORM 0550-MONTA-GRUPO THRU 0550-MONTA-GRUPO-FIM.

    GO TO 0501-MONTA-MATRIZ-GRUPO.

 0500-ACESSO-MATRIZ-GRUPO-FIM.
   EXIT.

 0520-MONTA-SISTEMA.
* PROCURA SISTEMA
    IF TAB-SISTEMA-OK(SIS-CODIGO-WS) NOT EQUAL ZEROS
        GO TO 0545-MONTA-SISTEMA-FIM.

    IF CONT-SISTEMA >= 40
       MOVE "Limite da tabela de SISTEMAS excedido"
         TO MENSAGEM OF SV-AREA-REL
       GO TO 0545-MONTA-SISTEMA-FIM
    END-IF

    ADD 1 TO CONT-SISTEMA.

    MOVE SPACES TO SIS-NOME OF SV-AREA-REL(CONT-SISTEMA).

    FIND NEXT SIS-POR-CODIGO AT
          SIS-CODIGO = SIS-CODIGO-WS
           ON EXCEPTION
              IF DMSTATUS(NOTFOUND)
                 MOVE "Sistema nao cadastrado."
                   TO MENSAGEM OF SV-AREA-REL
              ELSE
                 PERFORM 10000-00-TRATA-ERRO-DMS
                    THRU 10000-99-TRATA-ERRO-DMS
              END-IF
     END-FIND.

     MOVE SIS-CODIGO OF SISTEMAS
        TO SIS-CODIGO OF SV-AREA-REL(CONT-SISTEMA).

     MOVE 1 TO TAB-SISTEMA-OK(SIS-CODIGO-WS).

     MOVE SIS-NOME OF SISTEMAS
          TO SIS-NOME OF SV-AREA-REL(CONT-SISTEMA).

  0530-MONTA-COD-ABRANG.
/*MONTAGEM DA ABRANGENCIA

     FIND MAB-POR-LOT-TIF AT
           CLI-CODIGO   = CLI-JANELA-SEG-WS AND
           SIS-CODIGO   = SIS-CODIGO OF SISTEMAS        AND
           LOT-CODIGO   = LOT-CODIGO OF SV-AREA-REL     AND
           TIF-CODIGO   = TIF-CODIGO OF SV-AREA-REL
           ON EXCEPTION
              IF NOT DMSTATUS (NOTFOUND)
                 PERFORM 10000-00-TRATA-ERRO-DMS
                    THRU 10000-99-TRATA-ERRO-DMS
              END-IF
            GO TO 0545-MONTA-SISTEMA-FIM
     END-FIND.

     IF UCS-ABRANGENCIA OF MATRIZ-ABRANG EQUAL ZEROS
         GO TO 0545-MONTA-SISTEMA-FIM.

     MOVE UCS-ABRANGENCIA OF MATRIZ-ABRANG
       TO UCS-ABRANGENCIA OF SV-AREA-REL(CONT-SISTEMA).

  0540-MONTA-NOME-ABRANG.

    FIND FIRST TAG-POR-IDENT AT
          TAG-CLIENTE  =  CLI-CODIGO  OF USUARIO-CLI      AND
          TAG-SISTEMA  =  SIS-CODIGO  OF MATRIZ-GRUPO      AND
          TAG-CODIGO   =  UCS-ABRANGENCIA OF MATRIZ-ABRANG
           ON EXCEPTION
              IF DMSTATUS (NOTFOUND)
                 MOVE "Codigo abrangencia nao cadastrado"
                   TO ABR-DESCRICAO OF SV-AREA-REL(CONT-SISTEMA)
              ELSE
                 PERFORM 10000-00-TRATA-ERRO-DMS
                    THRU 10000-99-TRATA-ERRO-DMS
              END-IF
            GO TO 0545-MONTA-SISTEMA-FIM
    END-FIND.

    MOVE TAG-DESCRICAO   OF TAB-ABRANGENCIA
      TO ABR-DESCRICAO   OF SV-AREA-REL(CONT-SISTEMA).

  0545-MONTA-SISTEMA-FIM.
  EXIT.

  0550-MONTA-GRUPO.
* MONTAGEM GRUPOS

   FIND GOP-POR-IDENT AT
          CFS-VER-SISEG = VERSAO-SEG-WS     AND
          GOP-CLIENTE   = CLI-JANELA-SEG-WS AND
          GOP-SISTEMA   = SIS-CODIGO-WS    AND
          GOP-CODIGO    = GOP-CODIGO-WS
          ON EXCEPTION
             IF DMSTATUS (NOTFOUND)
                  MOVE "Grupo nao identificado"
                         TO MENSAGEM OF SV-AREA-REL
             ELSE
                PERFORM 10000-00-TRATA-ERRO-DMS
                   THRU 10000-99-TRATA-ERRO-DMS
             END-IF
          GO TO 0550-MONTA-GRUPO-FIM
     END-FIND.

  0570-MOVE-DADOS.

     IF CONT-GRUPOS >= 300
        MOVE "Limite da tabela de GRUPOS excedido"
          TO MENSAGEM OF SV-AREA-REL
        GO TO 0550-MONTA-GRUPO-FIM
     END-IF

     ADD 1 TO CONT-GRUPOS.
     MOVE CONT-GRUPOS TO CONT-GRUPOS OF SV-AREA-REL.

     MOVE SIS-CODIGO-WS
       TO SIS-CODIGO-GRP OF SV-AREA-REL(CONT-GRUPOS).
     MOVE GOP-DESCRICAO OF GRUPOS-OPERACOES
       TO GOP-DESCRICAO OF SV-AREA-REL(CONT-GRUPOS).
     MOVE GOP-MNEMONICO OF GRUPOS-OPERACOES
       TO GOP-MNEMONICO OF SV-AREA-REL(CONT-GRUPOS).

  0550-MONTA-GRUPO-FIM.
  EXIT.

******************************************************
***                 PERFIL MAC                     ***
******************************************************

  0600-MONTA-PERFIL.
* MONTAGEM PERFIL
   MOVE ZEROS TO CONT-PERFIL OF SV-AREA-REL.

   SET SIS-POR-CODIGO TO BEGINNING.
   SET MPE-POR-LOT-TIF TO BEGINNING.

 0601-MONTA-MATRIZ-PERFIL.
    FIND KEY OF NEXT MPE-POR-LOT-TIF AT
         CLI-CODIGO = CLI-JANELA-SEG-WS AND
         LOT-CODIGO = LOT-CODIGO  OF SV-AREA-REL    AND
         TIF-CODIGO = TIF-CODIGO  OF SV-AREA-REL
         ON EXCEPTION
            IF NOT DMSTATUS(NOTFOUND)
               PERFORM 10000-00-TRATA-ERRO-DMS
                  THRU 10000-99-TRATA-ERRO-DMS
            END-IF
         GO TO 0600-MONTA-PERFIL-FIM
    END-FIND.

    MOVE PER-CODIGO OF MATRIZ-PERFIL TO PER-CODIGO-WS.
    MOVE SIS-CODIGO OF MATRIZ-PERFIL TO SIS-CODIGO-WS.


    IF CONT-SISTEMA = 0
      PERFORM 0520-MONTA-SISTEMA THRU 0545-MONTA-SISTEMA-FIM.

    IF SIS-CODIGO OF TAB-SISTEMA(CONT-SISTEMA)
                        NOT EQUAL SIS-CODIGO OF MATRIZ-PERFIL
      PERFORM 0520-MONTA-SISTEMA THRU 0545-MONTA-SISTEMA-FIM.

    PERFORM 0610-COMPOR-PERFIL THRU 0625-FIM-PERFIL-MAC.

    GO TO 0601-MONTA-MATRIZ-PERFIL.

 0600-MONTA-PERFIL-FIM.
   EXIT.

 0610-COMPOR-PERFIL.

     FIND PER-POR-IDENT AT
          SIS-CODIGO = SIS-CODIGO-WS AND
          PER-CODIGO = PER-CODIGO-WS
          ON EXCEPTION
             IF NOT DMSTATUS (NOTFOUND)
                 PERFORM 10000-00-TRATA-ERRO-DMS
                   THRU 10000-99-TRATA-ERRO-DMS
             END-IF
             GO TO 0625-FIM-PERFIL-MAC
     END-FIND.

 0620-MOVE-DADOS.

     IF CONT-PERFIL >= 100
        MOVE "Limite da tabela de PERFIL excedido"
          TO MENSAGEM OF SV-AREA-REL
          GO TO 0625-FIM-PERFIL-MAC
     END-IF.

     ADD 1 TO CONT-PERFIL.

     MOVE SIS-CODIGO-WS
       TO SIS-CODIGO-PER OF SV-AREA-REL(CONT-PERFIL).
     MOVE PER-DESCRICAO OF PERFIL
       TO PER-DESCRICAO OF SV-AREA-REL(CONT-PERFIL).
     MOVE PER-CODIGO    OF PERFIL
       TO PER-CODIGO    OF SV-AREA-REL(CONT-PERFIL).


  0625-FIM-PERFIL-MAC.
   EXIT.

****************************************************************
*                                                              *
*                        MONTAGEM MEX                          *
*                                                              *
****************************************************************
  0700-MONTA-MEX.

     MOVE ZEROS TO CONT-GRUPOS OF SV-AREA-REL.

     SET GRX-POR-USU TO BEGINNING.
     SET SIS-POR-CODIGO TO BEGINNING.

*D550134 - BG240415 - INICIO VALIDADE EXCECAO
     MOVE USC-SEC-INI-EXC OF USUARIO-CLI
                          TO SEC-VALI-INI OF SV-AREA-REL.
     MOVE USC-ANO-INI-EXC OF USUARIO-CLI
                          TO ANO-VALI-INI OF SV-AREA-REL.
     MOVE USC-MES-INI-EXC OF USUARIO-CLI
                          TO MES-VALI-INI OF SV-AREA-REL.
     MOVE USC-DIA-INI-EXC OF USUARIO-CLI
                          TO DIA-VALI-INI OF SV-AREA-REL.
*D550134 - BG240415

     MOVE USC-SEC-FIM-EXC OF USUARIO-CLI
                          TO SEC-VALIDADE OF SV-AREA-REL.
     MOVE USC-ANO-FIM-EXC OF USUARIO-CLI
                          TO ANO-VALIDADE OF SV-AREA-REL.
     MOVE USC-MES-FIM-EXC OF USUARIO-CLI
                          TO MES-VALIDADE OF SV-AREA-REL.
     MOVE USC-DIA-FIM-EXC OF USUARIO-CLI
                          TO DIA-VALIDADE OF SV-AREA-REL.

   0701-MONTA-MATRIZ.

    FIND KEY OF NEXT GRX-POR-USU AT
         CLI-CODIGO = CLI-JANELA-SEG-WS AND
         USU-CODIGO = USU-CODIGO OF SV-AREA-REL
         ON EXCEPTION
            IF NOT DMSTATUS(NOTFOUND)
               PERFORM 10000-00-TRATA-ERRO-DMS
                  THRU 10000-99-TRATA-ERRO-DMS
            END-IF
          GO TO 0700-MONTA-MEX-FIM
    END-FIND.

    MOVE GOP-CODIGO OF GRUPO-EXC-USU TO GOP-CODIGO-WS.
    MOVE SIS-CODIGO OF GRUPO-EXC-USU TO SIS-CODIGO-WS.

    IF CONT-SISTEMA = 0
      PERFORM 0520-MONTA-SISTEMA THRU 0545-MONTA-SISTEMA-FIM.

    IF SIS-CODIGO OF TAB-SISTEMA(CONT-SISTEMA)
                        NOT EQUAL SIS-CODIGO OF GRUPO-EXC-USU
      PERFORM 0520-MONTA-SISTEMA THRU 0545-MONTA-SISTEMA-FIM.

    PERFORM 0550-MONTA-GRUPO THRU 0550-MONTA-GRUPO-FIM.

    GO TO 0701-MONTA-MATRIZ.

  0700-MONTA-MEX-FIM.
   EXIT.

******************************************************
***                 PERFIL MEX                     ***
******************************************************

  0730-MONTA-PERFIL.
* MONTAGEM PERFIL MEX
     MOVE ZEROS TO CONT-PERFIL OF SV-AREA-REL.

     SET SIS-POR-CODIGO TO BEGINNING.
     SET PRX-POR-USU-PER TO BEGINNING.

  0710-MONTA-MATRIZ-EXC-PERFIL.

     FIND NEXT PRX-POR-USU-PER AT
        CLI-CODIGO = CLI-JANELA-SEG-WS      AND
        USU-CODIGO = USU-CODIGO OF SV-AREA-REL
        ON EXCEPTION
          IF NOT DMSTATUS(NOTFOUND)
             PERFORM 10000-00-TRATA-ERRO-DMS
                THRU 10000-99-TRATA-ERRO-DMS
          END-IF
       GO TO 0730-MONTA-PERFIL-FIM
     END-FIND.

    MOVE PER-CODIGO OF PERFIL-EXC-USU TO PER-CODIGO-WS.
    MOVE SIS-CODIGO OF PERFIL-EXC-USU TO SIS-CODIGO-WS.

    IF CONT-SISTEMA = 0
      PERFORM 0520-MONTA-SISTEMA THRU 0545-MONTA-SISTEMA-FIM.

    IF SIS-CODIGO OF TAB-SISTEMA(CONT-SISTEMA)
                        NOT EQUAL SIS-CODIGO OF GRUPO-EXC-USU
      PERFORM 0520-MONTA-SISTEMA THRU 0545-MONTA-SISTEMA-FIM.

*    PERFORM 0600-MONTA-PERFIL THRU 0600-MONTA-PERFIL-FIM.
    PERFORM 0610-COMPOR-PERFIL THRU 0625-FIM-PERFIL-MAC.

    GO TO 0710-MONTA-MATRIZ-EXC-PERFIL.

  0730-MONTA-PERFIL-FIM.
   EXIT.

*---

 10000-00-TRATA-ERRO-DMS.
*ERRO BANDO DE DADOS
     MOVE    DMSTATUS (DMRESULT) TO  DMS-RESULT-WS.
     MOVE FORM-KEY-IN      OF COMS-IN TO FORM-KEY-WS
     MOVE SDFINFO          OF COMS-IN TO SDFINFO-WS
     MOVE PROGRAMDESG      OF COMS-IN TO PROGRAMDESG-WS
     MOVE FUNCTIONINDEX    OF COMS-IN TO FUNCTIONINDEX-WS
     MOVE USERCODE         OF COMS-IN TO USERCODE-WS
     MOVE SECURITYDESG     OF COMS-IN TO SECURITYDESG-WS
     MOVE TIMESTAMP        OF COMS-IN TO TIMESTAMP-WS
     MOVE STATION          OF COMS-IN TO STATION-WS
     MOVE TEXTLENGTH       OF COMS-IN TO TEXTLENGTH-WS
     MOVE STATUSVALUE      OF COMS-IN TO STATUSVALUE-WS
     MOVE RESTART          OF COMS-IN TO RESTART-WS
     MOVE AGENDA           OF COMS-IN TO AGENDA-WS

     CALL "TRATA_EXCECAO_DMS OF S0997/OBJ/LIBRARY/INSTALACAO"
          USING   DMS-PARAMETROS-WS
                  ARRAY-IN-WS
          GIVING  RESULTADO-77.

     IF  DMS-ENCERRAR
         STOP    RUN.

     IF  DMS-ATIVAR-DMTERMINATE
         CALL    SYSTEM  DMTERMINATE.

     MOVE "Erro no acesso ao banco de dados."
       TO MENSAGEM OF SV-AREA-REL.

     MOVE 1 TO RESULTADO-77.

 10000-99-TRATA-ERRO-DMS.
     EXIT.

 99900-00-ULTIMO-PARAGRAFO.
      CLOSE BDSEGURANCA.
      STOP RUN.

 END-OF-JOB.
