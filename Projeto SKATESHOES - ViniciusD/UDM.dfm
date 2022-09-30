object DM: TDM
  OldCreateOrder = False
  Height = 342
  Width = 330
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=D:\Users\VODOBROVOLSK.UNIVEL\Desktop\NovoProjeto\Databa' +
        'se\bancoDados.db'
      'LockingMode=Normal'
      'DriverID=SQLite')
    Connected = True
    AfterConnect = FDConnection1AfterConnect
    BeforeConnect = FDConnection1BeforeConnect
    Left = 120
    Top = 56
  end
  object FDQueryPessoa: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from pessoa'
      'where nome=:pNome')
    Left = 128
    Top = 192
    ParamData = <
      item
        Name = 'PNOME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object FDQueryPessoatelefone: TWideStringField
      FieldName = 'telefone'
      Origin = 'telefone'
      Size = 15
    end
    object FDQueryPessoaid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQueryPessoanome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object FDQueryPessoaemail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 50
    end
    object FDQueryPessoasenha: TWideStringField
      FieldName = 'senha'
      Origin = 'senha'
      Size = 15
    end
  end
  object FDQueryProduto: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select*from produto;')
    Left = 224
    Top = 192
    object FDQueryProdutoprodutoId: TFDAutoIncField
      FieldName = 'produtoId'
      Origin = 'produtoId'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQueryProdutonome: TStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 45
    end
    object FDQueryProdutodescricao: TStringField
      FieldName = 'descricao'
      Origin = 'descricao'
      Size = 100
    end
    object FDQueryProdutovalor: TIntegerField
      FieldName = 'valor'
      Origin = 'valor'
    end
    object FDQueryProdutopessoaid: TIntegerField
      FieldName = 'pessoaid'
      Origin = 'pessoaid'
    end
  end
  object FDQueryEditar: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update pessoa '
      'set nome =:pNome,'
      'email =:pEmail,'
      'senha =:pSenha,'
      'telefone =:pTelefone'
      'where id =:pID')
    Left = 248
    Top = 128
    ParamData = <
      item
        Name = 'PNOME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PEMAIL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PSENHA'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PTELEFONE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDQueryAddProd: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update produto'
      'set nome =:pNome,'
      'descricao =:pDescricao,'
      'valor =:pValor,'
      'pessoaid =:pPessoaid'
      'where produtoId =:pID')
    Left = 120
    Top = 136
    ParamData = <
      item
        Name = 'PNOME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PDESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PVALOR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PPESSOAID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDQueryConsultaPed: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from produto'
      'where nome=:pPessoaid'
      '')
    Left = 48
    Top = 256
    ParamData = <
      item
        Name = 'PPESSOAID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end