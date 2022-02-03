000000     01 COBOLRECORD.
000000       02 AREA-HEADER.
000000         03 TRANCODE                    PIC X(10).
000000         03 ACAO                        PIC X(70).
000000         03 VERSAO-AREA                 PIC 9(05).
000000         03 CLIENTE-SERVICO.
000000             05 CLIENTE-ORIGEM           PIC 9(03).
000000             05 CLIENTE-NOME             PIC X(12).
000000         03 SESSAO-COMS                 PIC X(38).
000000         03 CODIGO-RESULTADO            PIC 9(04).
000000         03 MENSAGEM-RESULTADO          PIC X(158).
000000         03 REQUISICAO-ID               PIC X(40).
000000         03 FILLER                      PIC X(160).
000000       02 AREA-PARAMETROS.
000000         03 USU-CODIGO                  PIC X(07).
000000       02 AREA-APLICATIVO.
000000         03 FLAG-FIM-AREA               PIC X(01).
000000         03 TIPO-AREA                   PIC X(03).
000000         03 DATA-INI-VALIDADE.
000000             05 SEC-VALI-INI             PIC 9(02).
000000             05 ANO-VALI-INI             PIC 9(02).
000000             05 MES-VALI-INI             PIC 9(02).
000000             05 DIA-VALI-INI             PIC 9(02).
000000         03 DATA-VALIDADE.
000000             05 SEC-VALIDADE             PIC 9(02).
000000             05 ANO-VALIDADE             PIC 9(02).
000000             05 MES-VALIDADE             PIC 9(02).
000000             05 DIA-VALIDADE             PIC 9(02).
000000         03 LOT-CODIGO                  PIC 9(04).
000000         03 TIF-CODIGO                  PIC 9(04).
000000         03 MENSAGEM                    PIC X(159).
000000         03 CONTADORES.
000000             05 CONT-GRUPOS             PIC 9(03).
000000             05 CONT-PERFIL             PIC 9(03).
000000             05 CONT-SISTEMA            PIC 9(03).
000000         03 TAB-PER.
000000             05 TAB-PERFIL            OCCURS 100 TIMES.
000000                 07 SIS-CODIGO-PER        PIC 9(04).
000000                 07 PER-CODIGO            PIC 9(05).
000000                 07 PER-DESCRICAO         PIC X(50).
000000         03 TAB-SISTEMAS.
000000             05 TAB-SISTEMA           OCCURS 40 TIMES.
000000                 07 SIS-CODIGO          PIC 9(04).
000000                 07 SIS-NOME            PIC X(40).
000000                 07 UCS-ABRANGENCIA     PIC 9(04).
000000                 07 ABR-DESCRICAO       PIC X(40).
000000       02 TAB-GRP.
000000             05 TAB-GRUPOS               OCCURS 400 TIMES.
000000                 07 SIS-CODIGO-GRP      PIC 9(04).
000000                 07 GOP-MNEMONICO       PIC X(10).
000000                 07 GOP-DESCRICAO       PIC X(50).
000000   