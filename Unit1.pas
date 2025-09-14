unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Vcl.ComCtrls,
  Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    edtNombre: TEdit;
    Label2: TLabel;
    cbTipo: TComboBox;
    Label3: TLabel;
    dtSiembra: TDateTimePicker;
    Label4: TLabel;
    dtCosecha: TDateTimePicker;
    btnAgregar: TButton;
    btnEditar: TButton;
    btnEliminar: TButton;
    sgCultivos: TStringGrid;
    Panel1: TPanel;
    Image1: TImage;
    procedure sgCultivosClick(Sender: TObject);
    procedure btnAgregarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnAgregarClick(Sender: TObject);
var
  row: Integer;
begin
  if sgCultivos.RowCount < 2 then
    sgCultivos.RowCount := 2;

  row := sgCultivos.RowCount - 1;

  if sgCultivos.Cells[0, row] <> '' then
  begin
    sgCultivos.RowCount := sgCultivos.RowCount + 1;
    row := sgCultivos.RowCount - 1;
  end;

  sgCultivos.Cells[0, row] := edtNombre.Text;
  sgCultivos.Cells[1, row] := cbTipo.Text;
  sgCultivos.Cells[2, row] := DateToStr(dtSiembra.Date);
  sgCultivos.Cells[3, row] := DateToStr(dtCosecha.Date);


  edtNombre.Clear;
  cbTipo.ItemIndex := -1;
  dtSiembra.Date := Now;
  dtCosecha.Date := Now;
end;

procedure TForm1.sgCultivosClick(Sender: TObject);
begin
  sgCultivos.ColCount := 4;
  sgCultivos.RowCount := 2;

  sgCultivos.Cells[0, 0] := 'Nombre';
  sgCultivos.Cells[1, 0] := 'Tipo';
  sgCultivos.Cells[2, 0] := 'Siembra';
  sgCultivos.Cells[3, 0] := 'Cosecha';
end;

end.
