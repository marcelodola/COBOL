  01 COBOLRECORD.
    02 AREA-HEADER.
      03 TRANCODE                    PIC X(10).
      03 ACAO                        PIC X(70).
      03 VERSAO-AREA                 PIC 9(05).
      03 CLIENTE-SERVICO.
          05 CLIENTE-ORIGEM           PIC 9(03).
          05 CLIENTE-NOME             PIC X(12).
      03 SESSAO-COMS                 PIC X(38).
      03 CODIGO-RESULTADO            PIC 9(04).
      03 MENSAGEM-RESULTADO          PIC X(158).
      03 REQUISICAO-ID               PIC X(40).
      03 FILLER                      PIC X(160).
    02 AREA-PARAMETROS.
      03 USU-CODIGO                  PIC X(07).
    02 AREA-APLICATIVO.
      03 FLAG-FIM-AREA               PIC X(01).
      03 TIPO-AREA                   PIC X(03).
      03 DATA-INI-VALIDADE.
          05 SEC-VALI-INI             PIC 9(02).
          05 ANO-VALI-INI             PIC 9(02).
          05 MES-VALI-INI             PIC 9(02).
          05 DIA-VALI-INI             PIC 9(02).
      03 DATA-VALIDADE.
          05 SEC-VALIDADE             PIC 9(02).
          05 ANO-VALIDADE             PIC 9(02).
          05 MES-VALIDADE             PIC 9(02).
          05 DIA-VALIDADE             PIC 9(02).
      03 LOT-CODIGO                  PIC 9(04).
      03 TIF-CODIGO                  PIC 9(04).
      03 MENSAGEM                    PIC X(159).
      03 CONTADORES.
          05 CONT-GRUPOS             PIC 9(03).
          05 CONT-PERFIL             PIC 9(03).
          05 CONT-SISTEMA            PIC 9(03).
      03 TAB-PER.
          05 TAB-PERFIL            OCCURS 100 TIMES.
              07 SIS-CODIGO-PER        PIC 9(04).
              07 PER-CODIGO            PIC 9(05).
              07 PER-DESCRICAO         PIC X(50).
      03 TAB-SISTEMAS.
          05 TAB-SISTEMA           OCCURS 40 TIMES.
              07 SIS-CODIGO          PIC 9(04).
              07 SIS-NOME            PIC X(40).
              07 UCS-ABRANGENCIA     PIC 9(04).
              07 ABR-DESCRICAO       PIC X(40).
    02 TAB-GRP.
          05 TAB-GRUPOS               OCCURS 400 TIMES.
              07 SIS-CODIGO-GRP      PIC 9(04).
              07 GOP-MNEMONICO       PIC X(10).
              07 GOP-DESCRICAO       PIC X(50).
